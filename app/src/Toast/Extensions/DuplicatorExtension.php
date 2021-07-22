<?php

namespace Toast\Extensions;

use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\ORM\DataExtension;

class DuplicatorExtension extends DataExtension
{

    public function onBeforeDuplicate($sourceObject, $doWrite, $relations)
    {
        $relations = $sourceObject->config()->get('duplicator_relations');

        if (is_array($relations)) {
            $this->duplicateRelations($sourceObject, $this->owner, $relations);
            // prevent DataObject::duplicateRelations() from being called
            $relations = null;
        }        
    }

    protected function duplicateRelations($sourceObject, $destinationObject, $relations)
    {
        $manyMany = $sourceObject->manyMany();
        $hasMany = $sourceObject->hasMany();
        $hasOne = $sourceObject->hasOne();
        $belongsTo = $sourceObject->belongsTo();

        foreach($relations as $relation) {

            $shouldDuplicate = true;
            
            // Excluding non-existing related objects (covers root level page parents)
            if (!$sourceObject->$relation()->exists()) {
                $shouldDuplicate = false;
            }

            if ($shouldDuplicate) {

                if (in_array($relation, array_keys($manyMany))) {
                    $this->duplicateManyManyRelation($sourceObject, $destinationObject, $relation);

                } elseif (in_array($relation, array_keys($hasMany))) {
                    $this->duplicateHasManyRelation($sourceObject, $destinationObject, $relation);

                } elseif (in_array($relation, array_keys($hasOne))) {
                    $this->duplicateHasOneRelation($sourceObject, $destinationObject, $relation);

                } elseif (in_array($relation, array_keys($belongsTo))) {
                    $this->duplicateBelongsToRelation($sourceObject, $destinationObject, $relation);

                }

            }

        }

    }


    protected function duplicateManyManyRelation($sourceObject, $destinationObject, $relation, $soft = false)
    {

        $extraFieldNames = $sourceObject->getManyManyComponents($relation)->getExtraFields();

        foreach($sourceObject->$relation() as $each) {

            // Force soft duplication if this is a link back to the source object
            if ($each->ClassName == $sourceObject->ClassName && $each->ID == $sourceObject->ID) {
                $soft = true;
            }

            // Force soft if page
            if ($each instanceof SiteTree) {
                $soft = true;
            }

            $extraFields = [];
            foreach ($extraFieldNames as $fieldName => $fieldType) {
                $extraFields[$fieldName] = $each->getField($fieldName);
            }

            if ($soft) {
                $destinationObject->$relation()->add($each, $extraFields);

            } else {
                //$clone = $this->makeClone($each);
                $clone = $each->duplicate(true);
                $destinationObject->$relation()->add($clone, $extraFields);

                if ($each->hasMethod('isPublished')) {
                    if ($each->isPublished()) {
                        $clone->publishSingle();
                    }
                }
            }
        }

    }


    protected function duplicateHasManyRelation($sourceObject, $destinationObject, $relation)
    {
        foreach($sourceObject->$relation() as $each) {
            
            $clone = $each->duplicate(true);
            $destinationObject->$relation()->add($clone);

            if ($each->hasMethod('isPublished')) {
                if ($each->isPublished()) {
                    $clone->publishSingle();
                }
            }            
        }
    }


    protected function duplicateHasOneRelation($sourceObject, $destinationObject, $relation, $soft = false)
    {
        foreach($sourceObject->$relation() as $each) {

            // Force soft duplication if this is a link back to the source object
            if ($each->ClassName == $sourceObject->ClassName && $each->ID == $sourceObject->ID) {
                $soft = true;
            }

            // Force soft if page
            if ($each instanceof SiteTree) {
                $soft = true;
            }

            if ($soft) {
                $destinationObject->setComponent($relation, $each);
            } else {
                //$clone = $this->makeClone($each);
                $clone = $each->duplicate(true);
                $destinationObject->setComponent($relation, $clone);

                if ($each->hasMethod('isPublished')) {
                    if ($each->isPublished()) {
                        $clone->publishSingle();
                    }
                }
            }    
        }
    }

    protected function duplicateBelongsToRelation($sourceObject, $destinationObject, $relation)
    {
        foreach($sourceObject->$relation() as $each) {            
            $destinationObject->setComponent($relation, $each);
        }
    }    


}