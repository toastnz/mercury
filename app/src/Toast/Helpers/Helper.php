<?php

namespace Toast\Helpers;

use SilverStripe\Control\Controller;
use SilverStripe\Control\Director;
use SilverStripe\Security\Security;

class Helper
{

    
    public static function getDirContents($dir, &$results = [])
    {
        $files = scandir($dir);

        foreach ($files as $key => $value) {
            $path = realpath($dir . DIRECTORY_SEPARATOR . $value);
            if (!is_dir($path)) {
                $results[] = $path;
            } else if ($value != '.' && $value != '..') {
                self::getDirContents($path, $results);
                $results[] = $path;
            }
        }
        return $results;
    }


    public static function getTemplates()
    {
        $cwd = str_replace(PUBLIC_DIR, '', getcwd());
        $themeFolder = 'themes/mercury';
        $themesPath = Controller::join_links($cwd, $themeFolder . '/templates');
        $list = self::getDirContents($themesPath);
        $output = [];

        foreach ($list as $each) {
            if (strstr($each, '.ss')) {
                $template = str_replace([$themesPath, '.ss'], '', $each);
                $output[$template] = $template;
            }
        }

        return $output;
    }

    public static function isSuperAdmin()
    {
        if (Director::isDev()) {
            return true;
        }

        if ($currentUser = Security::getCurrentUser()) {
            return strstr($currentUser->Email, '@toast.co.nz');
        }
        return false;
    }
}
