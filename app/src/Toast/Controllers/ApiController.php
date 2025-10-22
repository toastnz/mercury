<?php

namespace Toast\Controllers;

use Page;
use SilverStripe\Control\Controller;
use SilverStripe\Control\HTTPRequest;

use SilverStripe\Control\HTTPResponse;
use SilverStripe\Core\Injector\Injector;
use SilverStripe\Core\Cache\CacheFactory;
use SilverStripe\View\ArrayData;
use Heyday\MenuManager\MenuSet;

class ApiController extends Controller
{
    private static $url_handlers = [
        'GET pages' => 'getPages',
        'GET elemental' => 'getElementalArea',
    ];

    private static $allowed_actions = [
        'getPages',
        'getElementalArea'
    ];

    public function getElementalArea(HTTPRequest $request)
    {
        // Check for flush parameter and clear cache if present
        if ($request->getVar('flush') !== null) {
            self::clearElementalCache();
        }

        $elementalData = $this->getElementalAreaData($request);

        $response = HTTPResponse::create(json_encode($elementalData));
        $response->addHeader('Content-Type', 'application/json');
        $response->addHeader('Access-Control-Allow-Origin', '*');
        return $response;
    }

    public static function getElementalAreaData($request = null)
    {
        $isApiRequest = self::isApiRequest($request);
        
        // Get current page differently for API vs template context
        if ($isApiRequest && $request) {
            // For API requests, get page ID from request parameter or use current URL
            $pageId = $request->getVar('page_id');
            if (!$pageId) {
                // Try to get page from current URL/referer
                $referer = $request->getHeader('Referer');
                if ($referer) {
                    $currentPage = Page::get()->filter('URLSegment', basename(parse_url($referer, PHP_URL_PATH)))->first();
                } else {
                    // Default to home page if no page specified
                    $currentPage = Page::get()->filter('URLSegment', 'home')->first();
                }
            } else {
                $currentPage = Page::get()->byID($pageId);
            }
        } else {
            // For template context, use the current controller's data
            $controller = Controller::curr();
            if ($controller && method_exists($controller, 'data')) {
                $currentPage = $controller->data();
            } else {
                return [];
            }
        }
        
        if (!$currentPage || !$currentPage->ElementalArea()) {
            return [];
        }

        $cacheKey = 'elemental_data_page_' . $currentPage->ID;

        // Only use cache if not an API request
        if (!$isApiRequest) {
            $cache = Injector::inst()->get(CacheFactory::class)->create('elemental_cache');

            // Try to get from cache first
            $elementalData = $cache->get($cacheKey);

            if ($elementalData !== null) {
                return $elementalData;
            }
        }

        // Cache miss or API request - fetch from database
        $elementalData = [];
        
        if ($currentPage->ElementalArea()->Elements()) {
            $pageElements = [];
            foreach ($currentPage->ElementalArea()->Elements() as $element) {
                $pageElements[] = [
                    'id' => $element->ID,
                    'title' => $element->Title,
                    'type' => $element->ClassName,
                    'content' => $element->getElementData(),
                    'sort' => $element->Sort,
                    'available_globally' => $element->AvailableGlobally ?? false
                ];
            }
            
            $elementalData = [
                'page_id' => $currentPage->ID,
                'page_title' => $currentPage->Title,
                'page_url' => $currentPage->Link(),
                'elements' => $pageElements
            ];
        }

        // Only cache if not an API request
        if (!$isApiRequest) {
            $cache = Injector::inst()->get(CacheFactory::class)->create('elemental_cache');
            // Cache for 1 hour (3600 seconds)
            $cache->set($cacheKey, $elementalData, 3600);
        }

        return $elementalData;
    }

    public static function clearElementalCache()
    {
        $cache = Injector::inst()->get(CacheFactory::class)->create('elemental_cache');
        $cache->clear();
    }

    /**
     * Get elemental area data as JSON for JavaScript consumption
     * For use in templates
     */
    public static function getElementalAreaDataAsJSON()
    {
        $elementalData = self::getElementalAreaData();
        return json_encode($elementalData, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
    }

    public function getPages(HTTPRequest $request)
    {
        // Check for flush parameter and clear cache if present
        if ($request->getVar('flush') !== null) {
            self::clearPagesCache();
        }

        $pages = $this->getPagesData($request);

        $response = HTTPResponse::create(json_encode($pages));
        $response->addHeader('Content-Type', 'application/json');
        $response->addHeader('Access-Control-Allow-Origin', '*');
        return $response;
    }

    /**
     * Check if the request is an API/AJAX request
     */
    private static function isApiRequest($request = null)
    {
        if (!$request) {
            return false;
        }

        return $request->isAjax() ||
            $request->getHeader('X-Requested-With') === 'XMLHttpRequest' ||
            strpos($request->getHeader('Accept'), 'application/json') !== false ||
            strpos($request->getURL(), 'api/') !== false;
    }

    /**
     * Shared method to get pages data
     * Can be called from both API and template
     */
    public static function getPagesData($request = null)
    {
        $isApiRequest = self::isApiRequest($request);

        // Only use cache if not an API request
        if (!$isApiRequest) {
            $cache = Injector::inst()->get(CacheFactory::class)->create('pages_cache');
            $cacheKey = 'pages_data';

            // Try to get from cache first
            $pages = $cache->get($cacheKey);

            if ($pages !== null) {
                return $pages;
            }
        }

        // Cache miss or API request - fetch from database
        $pages = [];
        // Get the 'Header' menu set from Heyday Menu Manager
        $headerMenu = MenuSet::get()->filter('Name', 'Header')->first();

        if ($headerMenu && $headerMenu->MenuItems()) {
            foreach ($headerMenu->MenuItems() as $menuItem) {
                $pages[$menuItem->ID] = [
                    'id' => $menuItem->ID,
                    'title' => $menuItem->Title,
                    'link' => $menuItem->URL ?: ($menuItem->Page() ? $menuItem->Page()->Link() : '#'),
                    'is_new_window' => boolval($menuItem->IsNewWindow),
                    'linking_mode' => $menuItem->LinkingMode
                ];
            }
        }


        // Only cache if not an API request
        if (!$isApiRequest) {
            $cache = Injector::inst()->get(CacheFactory::class)->create('pages_cache');
            $cacheKey = 'pages_data';
            // Cache for 1 hour (3600 seconds)
            $cache->set($cacheKey, $pages, 3600);
        }

        return $pages;
    }

    public static function clearPagesCache()
    {
        $cache = Injector::inst()->get(CacheFactory::class)->create('pages_cache');
        $cache->delete('pages_data'); // Use delete instead of clear
        // Also try clearing the entire cache
        $cache->clear();
    }

    /**
     * Get pages data as JSON for JavaScript consumption
     * For use in templates
     */
    public static function getPagesDataAsJSON()
    {
        $pages = self::getPagesData();
        return json_encode($pages, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
    }
}
