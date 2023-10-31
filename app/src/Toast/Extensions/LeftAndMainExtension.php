<?php

namespace Toast\Extensions;

use SilverStripe\Admin\CMSMenu;
use SilverStripe\Reports\ReportAdmin;
use SilverStripe\CampaignAdmin\CampaignAdmin;
use SilverStripe\VersionedAdmin\ArchiveAdmin;

class LeftAndMainExtension extends \SilverStripe\Admin\LeftAndMainExtension
{

    public function init()
    {
        $remove = [
            CampaignAdmin::class,
            ReportAdmin::class,
            ArchiveAdmin::class
        ];

        foreach($remove as $item) {
            CMSMenu::remove_menu_class($item);
        }

    }
}