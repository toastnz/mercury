<?php

namespace Toast\Elements;

use SilverStripe\Forms\TextField;
use SilverStripe\Forms\LiteralField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\GridField\GridField;
use Toast\Elements\Items\TestimonialElementItem;
use SilverStripe\Forms\GridField\GridFieldDeleteAction;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;
use SilverStripe\Forms\GridField\GridFieldAddExistingAutocompleter;

class TestimonialElement extends BaseElement
{
    private static $table_name = 'TestimonialElement';

    private static $singular_name = 'Testimonial';

    private static $plural_name = 'Testimonials';

    private static $description = 'Add one or more testimonials';

    private static $inline_editable = false;

    private static $icon = 'font-icon-block-quote';

    private static $db = [
        'Heading' => 'Varchar(255)'
    ];

    private static $has_many = [
        'Items' => TestimonialElementItem::class
    ];

    public function getType()
    {
        return self::$singular_name;
    }

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldsToTab('Root.Main', [
            TextField::create('Heading', 'Heading')
        ]);

        $itemsConfig = GridFieldConfig_RelationEditor::create()
            ->addComponents([
                GridFieldOrderableRows::create('SortOrder'),
                GridFieldDeleteAction::create(false)
            ])
            ->removeComponentsByType([
                GridFieldDeleteAction::class,
                GridFieldAddExistingAutocompleter::class
            ]);

        $fields->addFieldsToTab('Root.Items', [
            GridField::create('Items', 'Items', $this->Items(), $itemsConfig)
        ]);

        return $fields;
    }
}
