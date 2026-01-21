<?php

namespace Toast\Elements\Items;

use SilverStripe\Assets\Image;
use Toast\Elements\GridElement;
use SilverStripe\Forms\TextField;
use SilverStripe\LinkField\Models\Link;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\RequiredFields;
use Sheadawson\Linkable\Forms\LinkField;
use SilverStripe\AssetAdmin\Forms\UploadField;

class GridElementItem extends ElementItem
{
    private static $table_name = 'GridElementItem';

    private static $singular_name = 'Item';

    private static $plural_name = 'Items';

    private static $default_sort  = 'SortOrder';

    private static $db = [
        'SortOrder' => 'Int',
        'Title' => 'Varchar(255)',
        'Summary' => 'Text',
        'Size' => 'Enum("small,medium,large", "small")'
    ];

    private static $has_one = [
        'Link'   => Link::class,
        'Image'  => Image::class,
        'Parent' => GridElement::class
    ];

    private static $summary_fields = [
        'Thumbnail' => 'Image',
        'Title' => 'Title',
        'Size' => 'Size'
    ];

    private static $owns = [
        'Image'
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldsToTab('Root.Main', [
            DropdownField::create('Size', 'Size', singleton(self::class)->dbObject('Size')->enumValues()),
            UploadField::create('Image', 'Thumbnail')
                ->setAllowedFileCategories('image/supported')
                ->setFolderName('elements/images'),
            TextField::create('Title', 'Title'),
            TextareaField::create('Summary', 'Summary')
                ->setRows(3),
            LinkField::create('LinkID', 'Link')
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

    public function getThumbnail()
    {
        if ($this->Image()->exists()) {
            return $this->Image()->CMSThumbnail();
        }
        return null;
    }
}
