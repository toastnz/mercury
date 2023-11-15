<?php

namespace Toast\Elements\Items;

use SilverStripe\Forms\TextField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\RequiredFields;
use Toast\Elements\TestimonialElement;

class TestimonialElementItem extends ElementItem
{
    private static $table_name = 'TestimonialElementItem';

    private static $singular_name = 'Item';

    private static $plural_name = 'Items';

    private static $default_sort = 'SortOrder';

    private static $db = [
        'Testimonial' => 'Text',
        'Author' => 'Varchar(255)',
        'Description' => 'Varchar(512)',
        'SortOrder' => 'Int'
    ];

    private static $has_one = [
        'Parent' => TestimonialElement::class
    ];

    private static $summary_fields = [
        'Testimonial' => 'Testimonial',
        'Author' => 'Author',
        'Description' => 'Description',
    ];


    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldsToTab('Root.Main', [
            TextareaField::create('Testimonial', 'Testimonial'),
            TextField::create('Author', 'Author'),
            TextField::create('Description', 'Description')
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

    public function getCMSValidator()
    {
        return RequiredFields::create([
            'Testimonial'
        ]);
    }


}
