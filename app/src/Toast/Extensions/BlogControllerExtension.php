<?php

namespace Toast\Extensions;

use SilverStripe\Blog\Model\BlogPost;
use SilverStripe\Blog\Model\BlogTag;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\Control\HTTPResponse;
use SilverStripe\Core\Injector\Injector;
use SilverStripe\ORM\PaginatedList;
use SilverStripe\View\ArrayData;
use SilverStripe\View\Parsers\URLSegmentFilter;
use SilverStripe\Control\Director;
use SilverStripe\ORM\DataExtension;

class BlogControllerExtension extends DataExtension
{
    private static $limit = 12;

    public function LatestNews($limit)
    {
        return BlogPost::get()->sort('PublishDate DESC')->limit($limit);
    }

    // public function afterCallActionHandler()
    // {
    //     $request = Injector::inst()->get(HTTPRequest::class);
    //     $session = $request->getSession();

    //     $allQuerystringVars = $request->getVars();
    //     $session->set('LinkFrom', [
    //         'params' => $allQuerystringVars
    //     ]);

    //     if (Director::is_ajax()) {
    //         return $this->blogs_html($request);
    //     }
    // }

    // public function blogs_html($request)
    // {
    //     $blogPost = $this->getPaginatedBlogs((int)$request->getVar('offset'));
    //     $tpl = ArrayData::create([
    //         'PaginatedBlogs' => $blogPost
    //     ])->renderWith('Toast/Includes/BlogList');


    //     $response = Injector::inst()->get(HTTPResponse::class);

    //     $response->addHeader('Content-Type', 'application/json');

    //     return json_encode([
    //         'data' => $tpl->getValue(),
    //         'loadmore' => $blogPost->CurrentPage() < $blogPost->TotalPages()
    //     ]);
    // }

    // public function getPaginatedBlogs($start = 0)
    // {
    //     $allBlogs = $this->getFilteredBlogs();
    //     $items = PaginatedList::create($allBlogs);
    //     $items->setPageLength(self::$limit);
    //     $items->setPageStart($start);
    //     return $items;
    // }

    // public function getFilteredBlogs()
    // {
    //     $request = Injector::inst()->get(HTTPRequest::class);
    //     $blogPosts = BlogPost::get();

    //     if ($keyword = $request->getVar('keyword')) {
    //         $blogPosts = $blogPosts->filterAny([
    //             'Title:PartialMatch' => $keyword,
    //             'AuthorNames:PartialMatch' => $keyword,
    //             'Authors.FirstName:PartialMatch' => $keyword,
    //             'Authors.Surname:PartialMatch' => $keyword
    //         ]);
    //     }

    //     if ($tag = $request->getVar('tag')) {

    //         $filter = URLSegmentFilter::create();
    //         if (!$filter->getAllowMultibyte()) {
    //             $tag = rawurlencode($tag);
    //         }

    //         $tagObj = BlogTag::get()
    //             ->filter('URLSegment', $tag)
    //             ->first();

    //         if ($tagObj) $blogPosts = $tagObj->BlogPosts();
    //     }

    //     if ($authorID = $request->getVar('author')) {
    //         $blogPosts = $blogPosts->addFilter([
    //             'Authors.ID' => $authorID
    //         ]);
    //     }

    //     $blogPosts = $blogPosts->sort('PublishDate', 'DESC');
    //     return $blogPosts;
    // }

    // public function getTags()
    // {
    //     return BlogTag::get();
    // }

    // public function getQueryStringVar($var)
    // {
    //     $request = Injector::inst()->get(HTTPRequest::class);
    //     return $request->getVar($var);
    // }
}
