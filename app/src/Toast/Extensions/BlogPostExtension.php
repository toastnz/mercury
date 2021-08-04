<?php

namespace Toast\Extensions;

use SilverStripe\ORM\DataExtension;

class BlogPostExtension extends DataExtension
{

    public function updateCMSFields($fields)
    {
        $fields->removeByName([
            'CustomSummary',
            'Tags'
        ]);
    }
}
