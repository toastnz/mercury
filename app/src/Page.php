<?php

use Toast\Helpers\Helper;
use Toast\Models\BannerSlide;
use SilverStripe\ORM\ArrayList;
use SilverStripe\View\ArrayData;
use SilverStripe\Forms\FieldGroup;
use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Blog\Model\BlogPost;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\ORM\FieldType\DBField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\Forms\GridField\GridFieldDeleteAction;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;

class Page extends SiteTree
{
    private static $db = [
        'CustomTemplateFile' => 'Varchar(1024)',
        'CustomTemplateType' => 'Enum("Layout,main","Layout")',
        'TransparentHeader' => 'Boolean'
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
            CheckboxField::create('TransparentHeader', 'Make the header transparent'),
            $gridField,
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

    public static function ElementShortCode($arguments, $content = null, $parser = null, $tagName = null)
    {
        if (isset($arguments['id'])) {
            if ($id = (int)$arguments['id']) {
                if ($baseElement = BaseElement::get()->byID($id)) {
                    $className = $baseElement->ClassName;
                    if ($element = $className::get()->byID($id)) {
                        return DBField::create_field('HTMLText', $element->forTemplate());
                    }
                }
            }
        }
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

    public function LatestNews($limit = 12)
    {
        return BlogPost::get()->sort('PublishDate DESC')->limit($limit);
    }
}
