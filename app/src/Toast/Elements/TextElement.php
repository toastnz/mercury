<?php

namespace Toast\Elements;

use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\RequiredFields;
use UncleCheese\Forms\ImageOptionsetField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;

class TextElement extends BaseElement
{
    private static $table_name = 'TextElement';

    private static $singular_name = 'Text';

    private static $plural_name = 'Text';

    private static $description = 'Text block';

    private static $inline_editable = true;

    private static $db = [
        'Content' => 'HTMLText',
        'BackgroundColour' => 'Enum("white,off-white,primary", "white")',
        'Width' => 'Enum("standard,wide,narrow,thin", "standard")'
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldsToTab('Root.Main', [
            HTMLEditorField::create('Content', 'Content'),
            DropdownField::create('BackgroundColour', 'Background Colour', singleton(self::class)->dbObject('BackgroundColour')->enumValues()),
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
            'Content'
        ]);
    }
}
