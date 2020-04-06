<?php

use Toast\Helpers\Helper;
use SilverStripe\Forms\FieldGroup;
use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Forms\DropdownField;
use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\Assets\Image;
use SilverStripe\AssetAdmin\Forms\UploadField;

class Page extends SiteTree
{
    private static $db = [
        'CustomTemplateFile' => 'Varchar(1024)',
        'CustomTemplateType' => 'Enum("Layout,main","Layout")'
    ];

    private static $has_one = [
        'BannerImage' => Image::class
    ];

    private static $owns = [
        'BannerImage'
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->removeByName(['Content']);

        $fields->addFieldsToTab(
            'Root.Banner',
            [UploadField::create('BannerImage', 'Banner Image')->setDescription('This is optional')]
        );

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


}
