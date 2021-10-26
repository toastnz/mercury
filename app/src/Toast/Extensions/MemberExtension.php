<?php

use SilverStripe\Security\Permission;
use SilverStripe\ORM\DataExtension;

class MemberExtension extends DataExtension 
{
    /**
    * Modify the field set to be displayed in the CMS detail pop-up
    */
    public function updateCMSFields( $fields) 
    {
        // Only show the additional fields on an appropriate kind of use 
        if(Permission::checkMember($this->owner->ID, "VIEW_FORUM")) {

            // get current fieldsname and add the data attr to all of them to prevent auto populate
            $dataFieldNames = $fields->dataFieldNames();
            foreach($dataFieldNames as $fieldname){
                $fields->dataFieldByName($fieldname)
                ->setAttribute("data-lpignore","true");
            }
        }

    }


}