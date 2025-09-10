<?php

namespace Toast\Extensions;

use SilverStripe\Core\Extension;
use SilverStripe\Control\Director;
use SilverStripe\View\Requirements;

class ControllerExtension extends Extension
{
    public function getStandardJsonResponse($data, $method = 'json', $message = '', $code = 200, $status = 'success')
    {
        $elapsed = microtime(true) - $_SERVER["REQUEST_TIME_FLOAT"];

        $response = [
            'request' => $this->owner->getRequest()->httpMethod(),
            'status'  => $status,
            'method'  => $method,
            'elapsed' => number_format($elapsed * 1000, 0) . 'ms',
            'message' => $message,
            'code'    => $code,
            'data'    => $data
        ];

        return json_encode($response, JSON_HEX_QUOT | JSON_HEX_TAG);
    }

    public function IsDevHot()
    {
        $fp = @fsockopen('localhost', 5171, $errno, $errstr, 1);
        return Director::isDev() && $fp !== false;
    }

    public function getViteBaseHref(): string
    {
        if (Director::is_https()) {
            return rtrim(Director::absoluteBaseURL(), '/') . ':5172';
        } else {
            return rtrim(Director::absoluteBaseURL(), '/') . ':5171';
        }
    }


    public function getIncludeRequirements()
    {


        $manifestFile = Director::baseFolder() . '/themes/mercury/dist/build/.vite/manifest.json';

        if (!file_exists($manifestFile)) {
            throw new \Exception('client/dist/manifest.json does not exist. Please run `ddev npm build` or `ddev npm dev`');
        }

        $manifest = json_decode(file_get_contents($manifestFile), true);

        if (!$manifest) {
            throw new \Exception('client/dist/manifest.json is not valid JSON. Please run `ddev npm build` or `ddev npm dev`');
        }

        Requirements::javascript('themes/mercury/dist/build/' . $manifest['themes/mercury/src/js/main.js']['file'], ['type' => 'module']);

        // Only include this script on pages that are not the home page
        if ($this->owner->getRequest()->getURL() !== 'home') {
            Requirements::javascript('themes/mercury/dist/build/' . $manifest['themes/mercury/src/js/extended.js']['file'], ['type' => 'module']);
            Requirements::css('themes/mercury/dist/build/' . $manifest['themes/mercury/src/js/extended.js']['css'][0]);
        }

        Requirements::css('themes/mercury/dist/build/' . $manifest['themes/mercury/src/js/main.js']['css'][0]);

        if ($this->owner->hasMethod('getAdditionalRequirements')) {
            $this->owner->getAdditionalRequirements($manifest);
        }
    }
}
