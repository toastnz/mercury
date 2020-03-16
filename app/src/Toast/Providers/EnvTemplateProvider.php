<?php

use SilverStripe\Core\Environment;
use SilverStripe\ORM\FieldType\DBField;
use SilverStripe\View\TemplateGlobalProvider;

class EnvTemplateProvider implements TemplateGlobalProvider
{
    public static function get_template_global_variables()
    {
        return [
            'ENV'
        ];
    }

    public static function ENV($variable)
    {        
        return DBField::create_field('Text', Environment::getEnv($variable));
    }

}

