<?php

namespace Toast\Elements;

use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\RequiredFields;
use UncleCheese\Forms\ImageOptionsetField;
use SilverStripe\AssetAdmin\Forms\UploadField;

class ImageTextElement extends BaseElement
{
    private static $table_name = 'ImageTextElement';

    private static $singular_name = 'Image & Text';

    private static $plural_name = 'Image & Text';

    private static $description = 'Image and text block';

    private static $inline_editable = true;

    private static $db = [
        'Content' => 'HTMLText',
        'Alignment' => 'Enum("standard,reversed", "standard")',
        'Width' => 'Enum("standard,wide,narrow,thin", "standard")',
    ];

    private static $has_one = [
        'Image' => Image::class
    ];

    private static $owns = [
        'Image'
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->removeByName(['Image', 'Alignment', 'Width']);

        $fields->addFieldsToTab('Root.Main', [
            UploadField::create('Image', 'Image')
                ->setAllowedFileCategories('image/supported')
                ->setFolderName('elements/images'),
            DropdownField::create('Alignment', 'Alignment', singleton(self::class)->dbObject('Alignment')->enumValues()),
            ImageOptionsetField::create('Width', 'Select a Width')
                ->setSource([
                    'wide' => 'app/dist/icons/wide.svg',
                    'standard' => 'app/dist/icons/standard.svg',
                    'narrow' => 'app/dist/icons//narrow.svg',
                    'thin' => 'app/dist/icons/thin.svg'    
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
