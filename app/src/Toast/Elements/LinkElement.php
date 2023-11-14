<?php

namespace Toast\Elements;

use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\DropdownField;
use Toast\Elements\Items\LinkElementItem;
use UncleCheese\Forms\ImageOptionsetField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\GridField\GridField;
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

    private static $db = [
        'Columns' => 'Enum("2, 3, 4", "3")',
        'Width' => 'Enum("standard,wide,narrow,thin", "standard")',
    ];

    private static $has_many = [
        'Items' => LinkElementItem::class
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->removeByName([
            'Items'
        ]);

        $fields->addFieldsToTab('Root.Main', [
            DropdownField::create('Columns', 'How many columns across', singleton(self::class)->dbObject('Columns')->enumValues()),
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
