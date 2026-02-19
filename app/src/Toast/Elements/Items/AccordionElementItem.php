<?php

namespace Toast\Elements\Items;

use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\Validation\CompositeValidator;
use SilverStripe\Forms\Validation\RequiredFieldsValidator;
use SilverStripe\ORM\FieldType\DBField;
use SilverStripe\ORM\FieldType\DBHTMLText;
use Toast\Elements\AccordionElement;

class AccordionElementItem extends ElementItem
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
        $fields = parent::getCMSFields();
        
        $fields->addFieldsToTab('Root.Main', [
            TextField::create('Title', 'Title'),
            HTMLEditorField::create('Content', 'Content')
        ]);

        return $fields;
    }

    public function onBeforeWrite()
    {
        parent::onBeforeWrite();

        if (!$this->SortOrder) {
            $max = (int)self::get()->filter('ParentID', $this->ParentID)->max('SortOrder');
            $this->setField('SortOrder', $max + 1);
        }
    }

    public function getCMSCompositeValidator(): CompositeValidator
    {
        return parent::getCMSCompositeValidator()
            ->addValidator(RequiredFieldsValidator::create([
                'Title',
                'Content'
            ]));
    }

    public function getGroupNumber()
    {
        return 'group' . ceil($this->SortOrder / 2);
    }

}
