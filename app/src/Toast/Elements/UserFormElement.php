<?php

namespace Toast\Elements;

use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Control\Controller;
use SilverStripe\UserForms\Form\UserForm;
use UncleCheese\Forms\ImageOptionsetField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\UserForms\Model\UserDefinedForm;
use SilverStripe\Core\Manifest\ModuleResourceLoader;
use SilverStripe\CMS\Controllers\CMSPageEditController;

class UserFormElement extends BaseElement
{
    private static $table_name = 'UserFormElement';

    private static $singular_name = 'User defined form';

    private static $plural_name = 'User defined forms';

    private static $description = 'Add to a User Defined Form page to populate the form in a specific position';

    private static $inline_editable = false;

    private static $icon = 'font-icon-block-form';

    private static $db = [
        'Width' => 'Enum("standard,wide,narrow,thin", "standard")',
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

        return $fields;
    }

    public function Form()
    {
        if ($page = $this->getParentPage()) {
            if ($page->ClassName == UserDefinedForm::class) {
                if (Controller::has_curr()) {
                    $controller = Controller::curr();
                    $form = UserForm::create($controller, 'Form_' . $page->ID);
                    $form->setFormAction(Controller::join_links($page->Link(), 'Form'));
                    $controller->generateConditionalJavascript();
                    return $form;
                }
            }
        }
    }

    public function getIsFinished() 
    {
        if (Controller::has_curr()) {
            if ($request = Controller::curr()->getRequest()) {
                return $request->param('Action') == 'finished';
            }
        }
    }    

    public function getFormSuccessMessage()
    {
        if ($page = $this->getParentPage()) {
            if ($page->ClassName == UserDefinedForm::class) {
                return $page->dbObject('OnCompleteMessage');
            }
        }
    }

    public function getParentPage()
    {
        if ($controller = Controller::curr()) {
            if (!$controller instanceof CMSPageEditController) {
                try {
                    if ($data = $controller->data()) {
                        if ($data->ID) {
                            return SiteTree::get()->byID($data->ID);
                        }
                    }
                } catch (\Exception $e) {
                }
            }
        }
    }

}
