<?php

namespace Toast\Elements\Items;

use SilverStripe\Forms\TextField;
use Toast\Elements\AccordionElement;
use SilverStripe\Forms\RequiredFields;
use SilverStripe\ORM\FieldType\DBField;
use SilverStripe\ORM\FieldType\DBHTMLText;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;

class AccordionItem extends ElementItem
{
    private static $table_name = 'AccordionElementItem';

    private static $singular_name = 'Item';

    private static $plural_name = 'Items';

    private static $default_sort = 'SortOrder';

    private static $db = [
        'Title' => 'Varchar(255)',
        'Content' => 'HTMLText',
        'SortOrder' => 'Int'
    ];

    private static $has_one = [
        'Parent' => AccordionElement::class
    ];

    private static $summary_fields = [
        'Title' => 'Title',
        'Content.Summary' => 'Content'
    ];


    public function DisplayTitle()
    {
        $title = strlen($this->Title) > 20 ? '<span>' . $this->Title . '</span>' : $this->Title;
        return DBField::create_field(DBHTMLText::class, $title);
    }

    public function getCMSFields()
    {
        $this->beforeUpdateCMSFields(function ($fields) {

            $fields->addFieldsToTab('Root.Main', [
                TextField::create('Title', 'Title'),
                HTMLEditorField::create('Content', 'Content')
            ]);
        });

        return parent::getCMSFields();
    }

    public function onBeforeWrite()
    {
        parent::onBeforeWrite();

        if (!$this->SortOrder) {
            $max = (int)AccordionItem::get()->filter(['ParentID' => $this->ParentID])->max('SortOrder');
            $this->setField('SortOrder', $max + 1);
        }
    }

    public function getCMSValidator()
    {
        $required = RequiredFields::create([
            'Heading',
            'Content'
        ]);

        return $required;
    }

    public function getGroupNumber()
    {
        return 'group' . ceil($this->SortOrder / 2);
    }

}
