<?php

namespace Toast\Elements\Items;

use SilverStripe\Assets\File;
use SilverStripe\Forms\TextField;
use Toast\Elements\DownloadElement;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\RequiredFields;
use SilverStripe\AssetAdmin\Forms\UploadField;

class DownloadElementItem extends ElementItem
{
    private static $table_name  = 'DownloadElementItem';

    private static $singular_name = 'Item';

    private static $plural_name = 'Items';

    private static $default_sort  = 'SortOrder';

    private static $db = [
        'Title' => 'Varchar(255)',
        'Summary' => 'Text',
        'SortOrder' => 'Int'
    ];

    private static $has_one = [
        'Parent' => DownloadElement::class,
        'File' => File::class
    ];

    private static $owns = [
        'File'
    ];

    private static $summary_fields = [
        'Title' => 'Title',
        'File.Title' => 'File'
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();;

        $fields->addFieldsToTab('Root.Main', [
            TextField::create('Title', 'Title'),
            TextareaField::create('Summary', 'Summary'),
            UploadField::create('File', 'File')
                ->setFolderName('elements/files')
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
            'File'
        ]);
    }

}
