<?php

namespace Toast\Elements;

use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\DropdownField;
use Toast\Elements\Items\LinkElementItem;
use UncleCheese\Forms\ImageOptionsetField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Core\Manifest\ModuleResourceLoader;
use SilverStripe\Forms\GridField\GridFieldDeleteAction;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;
use SilverStripe\Forms\GridField\GridFieldAddExistingAutocompleter;

class LinkElement extends BaseElement
{
    private static $table_name = 'LinkElement';

    private static $singular_name = 'Link';

    private static $plural_name = 'Links';

    private static $description = 'Add one or more links to the page';

    private static $inline_editable = false;

    private static $icon = 'font-icon-link';

    private static $db = [
        'Columns' => 'Enum("2, 3, 4", "3")',
        'Width' => 'Enum("standard,wide,narrow,thin", "standard")',
    ];

    private static $has_many = [
        'Items' => LinkElementItem::class
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
            DropdownField::create('Columns', 'How many columns across', singleton(self::class)->dbObject('Columns')->enumValues()),
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

        $fields->addFieldsToTab('Root.Items', [
            GridField::create('Items', 'Items', $this->Items(), $itemsConfig)
        ]);

        return $fields;
    }
}
