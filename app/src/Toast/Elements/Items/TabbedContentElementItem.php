<?php

namespace Toast\Elements\Items;

use SilverStripe\Forms\TextField;
use Toast\Elements\TabbedContentElement;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;

class TabbedContentElementItem extends ElementItem
{
    private static $table_name = 'TabbedContentElementItem';

    private static $singular_name = 'Item';

    private static $plural_name = 'Items';

    private static $default_sort = 'SortOrder';

    private static $db = [
        'Title' => 'Varchar(255)',
        'Content' => 'HTMLText',
        'SortOrder' => 'Int'
    ];

    private static $has_one = [
        'Parent' => TabbedContentElement::class
    ];

    private static $summary_fields = [
        'Title' => 'Heading',
        'Content.LimitCharacters(100)' => 'Content'
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldsToTab('Root.Main', [
            TextField::create('Title', 'Title'),
            HTMLEditorField::create('Content', 'Content')
                ->setRows(15)
        ]);

        return $fields;
    }

}
