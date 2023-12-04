<?php

namespace Toast\Elements;

use SilverStripe\Assets\Image;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\RequiredFields;
use UncleCheese\Forms\ImageOptionsetField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Core\Manifest\ModuleResourceLoader;

class ImageTextElement extends BaseElement
{
    private static $table_name = 'ImageTextElement';

    private static $singular_name = 'Image & Text';

    private static $plural_name = 'Image & Text';

    private static $description = 'Image and text block';

    private static $inline_editable = false;

    private static $icon = 'font-icon-columns';

    private static $db = [
        'Content' => 'HTMLText',
        'Alignment' => 'Enum("image-left,image-right", "image-left")',
        'Width' => 'Enum("standard,full,wide,narrow,thin", "standard")',
    ];

    private static $has_one = [
        'Image' => Image::class
    ];

    private static $owns = [
        'Image'
    ];

    private static $defaults = [
        'Width' => 'standard'
    ];

    public function getType()
    {
        return self::$singular_name;
    }

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldsToTab('Root.Main', [
            UploadField::create('Image', 'Image')
                ->setAllowedFileCategories('image/supported')
                ->setFolderName('elements/images'),
            DropdownField::create('Alignment', 'Alignment', singleton(self::class)->dbObject('Alignment')->enumValues()),
            ImageOptionsetField::create('Width', 'Select a Width')
                ->setSource([
                    'full' => ModuleResourceLoader::resourceURL('themes/mercury/dist/elements/full.svg'),
                    'wide' => ModuleResourceLoader::resourceURL('themes/mercury/dist/elements/wide.svg'),
                    'standard' => ModuleResourceLoader::resourceURL('themes/mercury/dist/elements/standard.svg'),
                    'narrow' => ModuleResourceLoader::resourceURL('themes/mercury/dist/elements/narrow.svg'),
                    'thin' => ModuleResourceLoader::resourceURL('themes/mercury/dist/elements/thin.svg')
                ])
                ->setImageWidth(100)
                ->setImageHeight(100)
        ]);

        return $fields;
    }

    public function getCMSValidator()
    {
        return RequiredFields::create([
            'Image',
            'Content'
        ]);
    }
}
