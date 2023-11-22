<?php

namespace Toast\Elements;

use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\RequiredFields;
use UncleCheese\Forms\ImageOptionsetField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Core\Manifest\ModuleResourceLoader;

class TextElement extends BaseElement
{
    private static $table_name = 'TextElement';

    private static $singular_name = 'Text';

    private static $plural_name = 'Text';

    private static $description = 'Text block';

    private static $inline_editable = false;

    private static $icon = 'font-icon-block-content';

    private static $db = [
        'Content' => 'HTMLText',
        'BackgroundColour' => 'Enum("none,white,off-white,primary", "none")',
        'Width' => 'Enum("standard,full,wide,narrow,thin", "standard")'
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
            HTMLEditorField::create('Content', 'Content'),
            DropdownField::create('BackgroundColour', 'Background Colour', singleton(self::class)->dbObject('BackgroundColour')->enumValues()),
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
            'Content'
        ]);
    }
}
