<?php

namespace Toast\Extensions;

use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\ReadonlyField;
use SilverStripe\ORM\DataExtension;
use SilverStripe\Taxonomy\TaxonomyTerm;
use SilverStripe\View\Parsers\URLSegmentFilter;


class TaxonomyTermExtension extends DataExtension
{
    private static $db = [
        'Title' => 'Varchar(255)',
        'Sort' => 'Int',
        'URLSegment' => 'Varchar(255)'
    ];

    public function updateCMSFields(FieldList $fields)
    {
        $fields->removeByName(['Sort', 'Title', 'FileTracking', 'LinkTracking']);
        $fields->replaceField('URLSegment', ReadonlyField::create('URLSegment', 'URL Segment'));
    }

    public function onBeforeWrite()
    {
        parent::onBeforeWrite();

        $this->owner->setField('Title', $this->owner->getField('Name'));
        $filter = URLSegmentFilter::create();
        $this->owner->setField('URLSegment', $filter->filter($this->owner->getTitle()));    
    }

    public function getDisplayTitle()
    {
        $title = $this->owner->Name;
        if ($this->owner->Type()) {
            $title .= ' (' . $this->owner->Type()->getTitle() . ')';
        }
        return $title;
    }
}

