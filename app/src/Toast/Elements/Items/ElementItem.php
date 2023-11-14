<?php

namespace Toast\Elements\Items;

use SilverStripe\ORM\DataObject;

class ElementItem extends DataObject
{
    private static $table_name = 'ElementItem';

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->removeByName([
            'ParentID',
            'SortOrder',
            'FileTracking',
            'LinkTracking'
        ]);

        return $fields;
    }

    public function canView($member = null)
    {
        if ($this->hasMethod('Parent')) {
            return $this->Parent()->canView($member);
        }

        return parent::canView($member);
    }

    public function canEdit($member = null)
    {
        if ($this->hasMethod('Parent')) {
            return $this->Parent()->canEdit($member);
        }

        return parent::canEdit($member);
    }

    public function canDelete($member = null)
    {
        if ($this->hasMethod('Parent')) {
            return $this->Parent()->canDelete($member);
        }

        return parent::canEdit($member);
    }

    public function canCreate($member = null, $context = [])
    {
        if ($this->hasMethod('Parent')) {
            return $this->Parent()->canCreate($member, $context);
        }

        return parent::canCreate($member, $context);
    }    

}