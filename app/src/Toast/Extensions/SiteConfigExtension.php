<?php

namespace Toast\Extensions;

use SilverStripe\AssetAdmin\Forms\UploadField;
use Toast\Helpers\Helper;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\HeaderField;
use SilverStripe\ORM\DataExtension;
use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Assets\File;

class SiteConfigExtension extends DataExtension
{
    private static $db = [
        'HeadCodeInjection' => 'HTMLText',
        'FooterCodeInjection' => 'HTMLText',
        'GoogleAnalytics' =>  'Varchar(64)',
        'GoogleTagManagerID' =>  'Varchar(64)',
        'BugherdProjectKey' => 'Varchar(64)',
        'GoogleMapsApiKey' => 'Varchar(64)'
    ];

    private static $has_one = [
        'Logo' => File::class
    ];

    private static $owns = [
        'Logo'
    ];

    public function updateCMSFields(FieldList $fields)
    {


        /** -----------------------------------------
         * Branding
         * ----------------------------------------*/

        if (Helper::isSuperAdmin()) {

            $fields->findOrMakeTab('Root.Theme');

            $fields->addFieldsToTab('Root.Theme', [
                UploadField::create('Logo', 'Logo')
                ->setDescription('Upload an SVG logo for your site')
            ]);
        }

        /** -----------------------------------------
         * Code Injection
         * ----------------------------------------*/

        if (Helper::isSuperAdmin()) {

            $fields->findOrMakeTab('Root.CodeInjection');

            $fields->addFieldsToTab('Root.CodeInjection', [
                HeaderField::create('CodeInjection', 'Code Injection'),
                TextareaField::create('HeadCodeInjection', 'Head Code Injection')
                    ->setDescription('Enter code that will be injected into the \'head\' tag on every page of your site.'),
                TextareaField::create('FooterCodeInjection', 'Footer Code Injection')
                    ->setDescription('Enter code that will be injected into the footer on every page of your site.'),
                LiteralField::create('CodeInjectionWarning', '<div class="message warning"><strong>Note:</strong> Only <strong>Default Admin</strong> can view these settings</div>')
            ]);
        }

        /** -----------------------------------------
         * Code Injection
         * ----------------------------------------*/

        if (Helper::isSuperAdmin()) {
            $fields->findOrMakeTab('Root.APIKeys');

            $fields->addFieldsToTab('Root.APIKeys', [
                HeaderField::create('APIKeys', 'External API Keys'),
                TextField::create('GoogleAnalytics', 'Google Analytics Account Number')
                    ->setAttribute('placeholder', 'UA-XXXXXX-Y')
                    ->setDescription('Enter your <a href="https://support.google.com/analytics/answer/1008080?hl=en#GAID" target="_blank">Google Analytics Account Number</a> to enable Google Analytics on your site.'),
                TextField::create('GoogleTagManagerID', 'Google Tag Manager ID')
                    ->setAttribute('placeholder', 'GTM-XXXXXX')
                    ->setDescription('Enter your <a href="https://support.google.com/analytics/answer/1008080?hl=en#GAID" target="_blank">Google Tag Manager ID</a> to enable Google Tag Manager on your site.'),
                TextField::create('BugherdProjectKey', 'Bugherd Project Key')
                    ->setAttribute('placeholder', 'xxxxxxxxxxxxxxxxxxxxxx')
                    ->setDescription('Enter your <a href="https://support.bugherd.com/hc/en-us/articles/204171450-Installing-the-Script" target="_blank">Bugherd Project Key</a> to enable Bugherd tracking for you site.'),
                TextField::create('GoogleMapsApiKey', 'Google Maps API Key')
                    ->setAttribute('placeholder', 'xxxxxxxxxxxxxxxxxxxxxx')
                    ->setDescription('Enter your <a href="https://developers.google.com/maps/documentation/javascript/get-api-key" target="_blank">Google Maps API Key</a> to be able to display maps on your site.'),
                LiteralField::create('APIKeysWarning', '<div class="message warning"><strong>Note:</strong> Only <strong>Default Admin</strong> can view these settings</div>')
            ]);
        }
    }
}
