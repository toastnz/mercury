<?php

use Toast\Helpers\Helper;
use Toast\Models\BannerSlide;

use SilverStripe\Assets\Image;
use SilverStripe\Forms\FieldGroup;
use SilverStripe\Security\Security;
use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Security\Permission;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldDeleteAction;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;

class Page extends SiteTree
{
    private static $db = [
        'CustomTemplateFile' => 'Varchar(1024)',
        'CustomTemplateType' => 'Enum("Layout,main","Layout")'
    ];

    private static $has_many = [
        'BannerSlides' => BannerSlide::class
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->removeByName(['Content']);

        $config = GridFieldConfig_RelationEditor::create(10);
        $config->addComponent(GridFieldOrderableRows::create('SortOrder'))
            ->removeComponentsByType(GridFieldDeleteAction::class)
            ->addComponent(new GridFieldDeleteAction(false));

        $gridField = GridField::create(
            'BannerSlides',
            'BannerSlides',
            $this->owner->BannerSlides(),
            $config
        );

        $fields->addFieldsToTab('Root.Banner', [
            $gridField
        ]);


        return $fields;
    }

    public function getSettingsFields()
    {
        $fields = parent::getSettingsFields();
        $fields->addFieldsToTab('Root.Settings', [
            FieldGroup::create(
                DropdownField::create('CustomTemplateFile', 'Override template', Helper::getTemplates())
                    ->setEmptyString('- none -'),
                DropdownField::create('CustomTemplateType', 'Type of template', [
                    'Layout' => 'Layout',
                    'main' => 'Main'
                ])
            )
        ]);
        return $fields;
    }
}

class PageController extends ContentController
{

    public function getViewer($action)
    {
        $viewer = parent::getViewer($action);
        if ($this->CustomTemplateType && $this->CustomTemplateFile) {
            $viewer->setTemplateFile($this->CustomTemplateType, getcwd() . $this->CustomTemplateFile);
        }
        return $viewer;
    }

    public function getIsSuperAdmin()
    {
        return Helper::isSuperAdmin();
    }
}
