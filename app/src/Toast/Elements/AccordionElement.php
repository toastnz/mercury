<?php

namespace Toast\Elements;

use SilverStripe\ORM\GroupedList;
use SilverStripe\Forms\LiteralField;
use UncleCheese\Forms\ImageOptionsetField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\GridField\GridField;
use Toast\Elements\Items\AccordionElementItem;
use SilverStripe\Core\Manifest\ModuleResourceLoader;
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

    private static $icon = 'font-icon-block-accordion';

    private static $db = [
        'Width' => 'Enum("standard,wide,narrow,thin", "standard")'
    ];

    private static $has_many = [
        'Items' => AccordionElementItem::class
    ];

    private static $defaults = [
        'Width' => 'standard'
    ];

    public function getType()
    {
        return self::$singular_name;
    }

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldsToTab('Root.Main', [
            ImageOptionsetField::create('Width', 'Select a Width')
                ->setSource([
                    'wide' => ModuleResourceLoader::resourceURL('themes/mercury/dist/elements/wide.svg'),
                    'standard' => ModuleResourceLoader::resourceURL('themes/mercury/dist/elements/standard.svg'),
                    'narrow' => ModuleResourceLoader::resourceURL('themes/mercury/dist/elements/narrow.svg'),
                    'thin' => ModuleResourceLoader::resourceURL('themes/mercury/dist/elements/thin.svg')
                ])
                ->setImageWidth(100)
                ->setImageHeight(100)
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

        $fields->addFieldsToTab('Root.Items',  [
            GridField::create('Items', 'Items', $this->Items(), $itemsConfig)
        ]);

        return $fields;
    }

    public function getGroupedItems()
    {
        return GroupedList::create($this->Items());
    }
}
