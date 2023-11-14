<?php

namespace Toast\Elements;

use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\RequiredFields;
use UncleCheese\Forms\ImageOptionsetField;
use SilverStripe\AssetAdmin\Forms\UploadField;

class ImageElement extends BaseElement
{
    private static $table_name = 'ImageElement';

    private static $singular_name = 'Image';

    private static $plural_name = 'Images';

    private static $description = 'Single image block';

    private static $inline_editable = true;

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

    public function getCMSFields()
    {

        $fields = parent::getCMSFields();

        $fields->removeByName(['Image', 'Caption', 'Width']);

        $fields->addFieldsToTab('Root.Main', [
            UploadField::create('Image', 'Image')
                ->setAllowedFileCategories('image/supported')
                ->setFolderName('elements/images'),
            TextField::create('Caption', 'Caption')
                ->setDescription('Optional caption for this image'),
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
            'Image'
        ]);
    }
}
