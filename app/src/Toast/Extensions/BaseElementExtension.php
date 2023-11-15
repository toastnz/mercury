<?php

namespace Toast\Extensions;

use SilverStripe\Forms\FieldList;
use SilverStripe\ORM\DataExtension;
use SilverStripe\Forms\ReadonlyField;
use SilverStripe\Forms\RequiredFields;

class BaseElementExtension extends DataExtension
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

    public function getCMSValidator()
    {
        return RequiredFields::create([
            'Title'
        ]);
    }

}
