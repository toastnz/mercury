<?php

namespace Toast\Pages;

use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\ORM\DB;
use SilverStripe\Versioned\Versioned;

class SearchResultsPage extends \Page
{
    private static $singular_name = 'Search Results';
   
    private static $plural_name = 'Search Results Pages';
    
    private static $description = 'Displays search results';
    
    private static $can_be_root = true;
    
    private static $table_name = 'SearchResultsPage';

    private static $defaults = [
        'ShowInMenus' => false,
        'ShowInSearch' => false
    ];

}

class SearchResultsPageController extends \PageController
{

}