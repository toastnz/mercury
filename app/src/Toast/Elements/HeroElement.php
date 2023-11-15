<?php

namespace Toast\Elements;

use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Assets\Image;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;

class HeroElement extends BaseElement
{
    private static $table_name = 'HeroElement';

    private static $singular_name = 'Hero block';

    private static $plural_name = 'Hero blocks';

    private static $description = 'Hero block with content and background image';

    private static $inline_editable = false;

    private static $icon = 'font-icon-block-banner';

    private static $db = [
        'Content' => 'HTMLText'
    ];

    private static $has_one = [
        'BackgroundImage' => Image::class
    ];

    private static $owns = [
        'BackgroundImage'
    ];

    public function getType()
    {
        return self::$singular_name;
    }

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldsToTab('Root.Main', [
            HTMLEditorField::create('Content', 'Content')
                ->setRows(5),
            UploadField::create('BackgroundImage', 'Background Image')
                ->setFolderName('elements/images')
        ]);

        return $fields;
    }
}
