<?php

namespace Toast\Elements;

use SilverStripe\Forms\TextField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\DropdownField;

class MarqueeElement extends BaseElement
{
    private static $table_name = 'MarqueeElement';

    private static $singular_name = 'Marquee';

    private static $plural_name = 'Marquee';

    private static $description = 'Insert Marquee into the page';

    private static $inline_editable = false;

    private static $icon = 'font-icon-block-a';

    private static $db = [
        'Content' => 'Text',
        'Speed' => 'Varchar(12)',
        'Direction' => 'Enum("left,right", "left")'
    ];

    private static $defaults = [
        'Speed' => '10'
    ];

    public function getType()
    {
        return self::$singular_name;
    }

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldsToTab('Root.Main', [
            TextField::create('Content', 'Content'),
            TextField::create('Speed', 'Speed')->setDescription('Speed of the marquee in seconds'),
            DropdownField::create('Direction', 'Direction', $this->dbObject('Direction')->enumValues())
        ]);

        return $fields;
    }
}
