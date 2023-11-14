<?php

namespace Toast\Elements;

use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\TextareaField;

class CodeElement extends BaseElement
{
    private static $table_name = 'CodeElement';

    private static $singular_name = 'Code';

    private static $plural_name = 'Code';

    private static $description = 'Insert raw code into the page';

    private static $inline_editable = true;

    private static $db = [
        'Content' => 'Text'
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        
        $fields->addFieldsToTab('Root.Main', [
            TextareaField::create('Content', 'Content')
                ->setRows(20)
                ->setAttribute('style', 'font-family: Courier, monospace;')
        ]);
        
    }
}
