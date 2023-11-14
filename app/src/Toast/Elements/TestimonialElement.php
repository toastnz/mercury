<?php

namespace Toast\Elements;

use Toast\Blocks\Block;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\LiteralField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\GridField\GridField;
use Toast\Blocks\Items\TestimonialBlockItem;
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

    private static $db = [
        'Heading' => 'Varchar(255)'
    ];

    private static $has_many = [
        'Items' => TestimonialElementItem::class
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->removeByName([
            'Items'
        ]);

        $fields->addFieldsToTab('Root.Main', [
            TextField::create('Heading', 'Heading')
        ]);

        if ($this->exists()) {
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

        } else {
            $fields->addFieldsToTab('Root.Main', [
                LiteralField::create('', '<div class="message">Save this block to see more options.</div>')
            ]);
        }

        return $fields;
    }
}
