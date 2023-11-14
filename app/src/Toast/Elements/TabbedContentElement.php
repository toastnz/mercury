<?php

namespace Toast\Elements;

use SilverStripe\Forms\LiteralField;
use UncleCheese\Forms\ImageOptionsetField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\GridField\GridField;
use Toast\Elements\Items\TabbedContentElementItem;
use SilverStripe\Forms\GridField\GridFieldDeleteAction;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;
use SilverStripe\Forms\GridField\GridFieldAddExistingAutocompleter;

class TabbedContentElement extends BaseElement
{
    private static $table_name = 'TabbedContentElement';

    private static $singular_name = 'Tabbed Content';

    private static $plural_name = 'Tabbed Content';

    private static $description = 'Tabbed content block';

    private static $inline_editable = false;

    private static $db = [
        'Width' => 'Enum("standard,wide,narrow,thin", "standard")',
    ];

    private static $has_many = [
        'Tabs' => TabbedContentElementItem::class
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
