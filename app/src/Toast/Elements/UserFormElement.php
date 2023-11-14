<?php

namespace Toast\Elements;

use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Control\Controller;
use SilverStripe\UserForms\Form\UserForm;
use UncleCheese\Forms\ImageOptionsetField;
use SilverStripe\UserForms\Model\UserDefinedForm;

class UserFormElement extends BaseElement
{
    private static $table_name = 'UserFormElement';

    private static $singular_name = 'User defined form';

    private static $plural_name = 'User defined forms';

    private static $description = 'Add to a User Defined Form page to populate the form in a specific position';

    private static $inline_editable = true;

    private static $db = [
        'Width' => 'Enum("standard,wide,narrow,thin", "standard")',
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

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

}
