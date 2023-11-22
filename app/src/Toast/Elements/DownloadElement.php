<?php

namespace Toast\Elements;

use SilverStripe\Forms\LiteralField;
use UncleCheese\Forms\ImageOptionsetField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\GridField\GridField;
use Toast\Elements\Items\DownloadElementItem;
use SilverStripe\Core\Manifest\ModuleResourceLoader;
use SilverStripe\Forms\GridField\GridFieldDeleteAction;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;
use SilverStripe\Forms\GridField\GridFieldAddExistingAutoCompleter;

class DownloadElement extends BaseElement
{
    private static $table_name = 'DownloadElement';

    private static $singular_name = 'Download';

    private static $plural_name = 'Downloads';

    private static $description = 'Download one or more files';

    private static $inline_editable = false;

    private static $icon = 'font-icon-p-download';

    private static $db = [
        'Width' => 'Enum("standard,full,wide,narrow,thin", "standard")'
    ];

    private static $has_many = [
        'Items' => DownloadElementItem::class
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
                    'full' => ModuleResourceLoader::resourceURL('themes/mercury/dist/elements/full.svg'),
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
}
