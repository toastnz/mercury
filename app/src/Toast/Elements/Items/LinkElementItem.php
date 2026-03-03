<?php

namespace Toast\Elements\Items;

use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\TextField;
use SilverStripe\LinkField\Form\LinkField;
use SilverStripe\LinkField\Models\Link;
use Toast\Elements\LinkElement;

class LinkElementItem extends ElementItem
{
    private static $table_name = 'LinkElementItem';

    private static $singular_name = 'Item';

    private static $plural_name = 'Items';

    private static $default_sort  = 'SortOrder';

    private static $db = [
        'SortOrder' => 'Int',
        'Title' => 'Varchar(255)',
        'Summary' => 'Text'
    ];

    private static $has_one = [
        'Link'   => Link::class,
        'Image'  => Image::class,
        'Parent' => LinkElement::class
    ];

    private static $summary_fields = [
        'Title' => 'Title'
    ];

    private static $owns = [
        'Image',
        'Link'
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->removeByName([
            'ParentID',
            'SortOrder',
            'ImageID',
            'Image',
            'Title',
            'Summary',

        ]);

        $fields->addFieldsToTab('Root.Main', [
            UploadField::create('Image', 'Thumbnail')
                ->setAllowedFileCategories('image/supported')
                ->setFolderName('elements/images'),
            TextField::create('Title', 'Title'),
            TextareaField::create('Summary', 'Summary')
                ->setRows(6),
            LinkField::create('Link', 'Link')
        ]);

        return $fields;
    }

    public function onBeforeWrite()
    {
        parent::onBeforeWrite();

        if (!$this->SortOrder) {
            $max = (int)self::get()->filter('ParentID', $this->ParentID)->max('SortOrder');
            $this->setField('SortOrder', $max + 1);
        }
    }

}
