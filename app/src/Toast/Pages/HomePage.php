<?php

namespace Toast\Pages;


use Sheadawson\Linkable\Forms\LinkField;
use Sheadawson\Linkable\Models\Link;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\HeaderField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;

class HomePage extends \Page
{
    private static $singular_name = 'Home Page';

    private static $plural_name = 'Home Pages';

    private static $description = 'Landing page of the website';

    private static $table_name = 'HomePage';

    private static $icon_class = 'font-icon-p-home';

}

class HomePageController extends \PageController
{

}