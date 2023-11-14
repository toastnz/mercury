<?php

namespace Toast\Elements;

use SilverStripe\ORM\GroupedList;
use SilverStripe\Forms\LiteralField;
use UncleCheese\Forms\ImageOptionsetField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\GridField\GridField;
use Toast\Elements\Items\AccordionElementItem;
use SilverStripe\Forms\GridField\GridFieldDeleteAction;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;
use SilverStripe\Forms\GridField\GridFieldAddExistingAutocompleter;

class AccordionElement extends BaseElement
{
    private static $table_name = 'AccordionElement';

    private static $singular_name = 'Accordion';

    private static $plural_name = 'Accordions';

    private static $description = 'Accordion block';

    private static $inline_editable = false;

    private static $db = [
        'Width' => 'Enum("standard,wide,narrow,thin", "standard")'
    ];

    private static $has_many = [
        'Items' => AccordionElementItem::class
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->removeByName([
            'Items'
        ]);

        $fields->addFieldsToTab('Root.Main', [
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

            $fields->addFieldsToTab('Root.Items',  [
                GridField::create('Items', 'Items', $this->Items(), $itemsConfig)
            ]);

        } else {
            $fields->addFieldsToTab('Root.Main', [
                LiteralField::create('', '<div class="message">Save this block to show additional options.</div>')
            ]);
        }

        return $fields;
    }

    public function getGroupedItems()
    {
        return GroupedList::create($this->Items());
    }
}
