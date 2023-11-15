<?php

namespace Toast\Elements;

use SilverStripe\Assets\Image;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\RequiredFields;
use UncleCheese\Forms\ImageOptionsetField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Core\Manifest\ModuleResourceLoader;

class ImageElement extends BaseElement
{
    private static $table_name = 'ImageElement';

    private static $singular_name = 'Image';

    private static $plural_name = 'Images';

    private static $description = 'Single image block';

    private static $inline_editable = false;

    private static $icon = 'font-icon-image';

    private static $db = [
        'Caption' => 'Text',
        'Width' => 'Enum("standard,wide,narrow,thin", "standard")'
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
            TextField::create('Caption', 'Caption')
                ->setDescription('Optional caption for this image'),
            ImageOptionsetField::create('Width', 'Select a Width')
                ->setSource([
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
            'Image'
        ]);
    }
}
