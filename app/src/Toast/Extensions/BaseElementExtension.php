<?php

namespace Toast\Extensions;

use SilverStripe\Core\Extension;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\ReadonlyField;
use SilverStripe\Forms\Validation\CompositeValidator;
use SilverStripe\Forms\Validation\RequiredFieldsValidator;

class BaseElementExtension extends Extension
{
    public function updateCMSFields(FieldList $fields)
    {
        if ($titleField = $fields->dataFieldByName('Title')) {
            $titleField->setDescription('For internal reference only and will not be displayed on the website.');
        }

        $fields->removeByName([
            'ExtraClass'
        ]);

        $fields->addFieldsToTab('Root.Settings', [
            ReadonlyField::create('Shortcode', 'Shortcode', '[element,id=' . $this->owner->ID . ']')
        ]);
    }

    public function getCMSCompositeValidator(): CompositeValidator
    {
        return CompositeValidator::create()
            ->addValidator(RequiredFieldsValidator::create([
                'Title'
            ]));
    }

}
