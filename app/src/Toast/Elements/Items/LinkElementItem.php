<?php

// TODO: Replace link field with something more up to date. Tried to install Sheadawson\Linkable but
// Get errors from it looking for packages related to ss3.

namespace Toast\Elements\Items;

use SilverStripe\Assets\File;
use SilverStripe\Assets\Image;
use Toast\Elements\LinkElement;
use SilverStripe\Forms\TextField;
// use SilverStripe\LinkField\Models\Link;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\RequiredFields;
// use Sheadawson\Linkable\Forms\LinkField;
use SilverStripe\AssetAdmin\Forms\UploadField;

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
        // 'Link'   => Link::class,
        'Image'  => Image::class,
        'Parent' => LinkElement::class
    ];

    private static $summary_fields = [
        'Title' => 'Title'
    ];

    private static $owns = [
        'Image'
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->removeByName([
            'ParentID',
            'SortOrder',
            'LinkID',
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
            // LinkField::create('LinkID', 'Link')
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

    public function getCMSValidator()
    {
        return RequiredFields::create([
            'Title',
            'LinkID'
        ]);
    }
}
