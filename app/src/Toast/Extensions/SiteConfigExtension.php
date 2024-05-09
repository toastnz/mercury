<?php

namespace Toast\Extensions;

use Toast\Helpers\Helper;
use SilverStripe\Assets\File;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\HeaderField;
use SilverStripe\ORM\DataExtension;
use Sheadawson\Linkable\Models\Link;
use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\TextareaField;
use Sheadawson\Linkable\Forms\LinkField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;

class SiteConfigExtension extends DataExtension
{
    private static $db = [
        'HeadCodeInjection' => 'HTMLText',
        'FooterCodeInjection' => 'HTMLText',
        'GoogleAnalytics' =>  'Varchar(64)',
        'GoogleTagManagerID' =>  'Varchar(64)',
        'BugherdProjectKey' => 'Varchar(64)',
        'GoogleMapsApiKey' => 'Varchar(64)',
        'MakeHeaderFullWidth' => 'Boolean',
        'FacebookPage' => 'Varchar(255)',
        'LinkedinPage' => 'Varchar(255)',
        'PinterestPage' => 'Varchar(255)',
        'InstagramPage' => 'Varchar(255)',
        'YoutubePage' => 'Varchar(255)',
        'TwitterPage' => 'Varchar(255)',
        'ShowPopup' => 'Boolean',
        'PopupHeading' => 'HTMLText',
        'PopupCopy' => 'HTMLText',
        'ShowNotification' => 'Boolean',
        'NotificationCanBeClosed' => 'Boolean',
        'NotificationCopy' => 'HTMLText',
    ];

    private static $has_one = [
        'Logo' => File::class,
        'TermsLink' => Link::class,
        'PrivacyLink' => Link::class,
        'NotificationLink' => Link::class,
    ];

    private static $owns = [
        'Logo'
    ];

    public function updateCMSFields(FieldList $fields)
    {

        /** -----------------------------------------
         * Branding
         * ----------------------------------------*/

        $fields->addFieldsToTab('Root.Links', [
            LinkField::create('TermsLinkID', 'Terms and Conditions Page'),
            LinkField::create('PrivacyLinkID', 'Privacy Policy Page'),
            TextField::create('FacebookPage', 'Facebook Page'),
            TextField::create('LinkedinPage', 'Linkedin Page'),
            TextField::create('PinterestPage', 'Pinterest Page'),
            TextField::create('InstagramPage', 'Instagram Page'),
            TextField::create('YoutubePage', 'Youtube Page'),
            TextField::create('TwitterPage', 'Twitter Page'),
        ]);

        /** -----------------------------------------
         * Theme
         * ----------------------------------------*/

        if (Helper::isSuperAdmin()) {

            $fields->addFieldsToTab('Root.Theme', [
                UploadField::create('Logo', 'Logo')
                    ->setDescription('Upload an SVG logo for your site')
            ]);
        }

        /** -----------------------------------------
         * Code Injection & Theme
         * ----------------------------------------*/

        if (Helper::isSuperAdmin()) {

            $fields->addFieldsToTab('Root.CodeInjection', [
                HeaderField::create('CodeInjection', 'Code Injection'),
                TextareaField::create('HeadCodeInjection', 'Head Code Injection')
                    ->setDescription('Enter code that will be injected into the \'head\' tag on every page of your site.'),
                TextareaField::create('FooterCodeInjection', 'Footer Code Injection')
                    ->setDescription('Enter code that will be injected into the footer on every page of your site.'),
                LiteralField::create('CodeInjectionWarning', '<div class="message warning"><strong>Note:</strong> Only <strong>Default Admin</strong> can view these settings</div>')
            ]);

            $fields->addFieldsToTab('Root.Theme', [
                CheckboxField::create('MakeHeaderFullWidth', 'Make Header Full Width')
            ]);
        }

        /** -----------------------------------------
         * Popup
         * ----------------------------------------*/

        $fields->addFieldsToTab('Root.Popup', [
            HeaderField::create('Popup', 'Site wide popup'),
            CheckboxField::create('ShowPopup', 'Show popup'),
            TextField::create('PopupHeading', 'Popup heading'),
            HTMLEditorField::create('PopupCopy', 'Popup content')
                ->setRows(5)
                ->setDescription('Enter the content of your popup here.'),
        ]);

        /** -----------------------------------------
         * Notification
         * ----------------------------------------*/

        $fields->addFieldsToTab('Root.Notification', [
            HeaderField::create('Notification', 'Site wide notification'),
            CheckboxField::create('ShowNotification', 'Show notification'),
            CheckboxField::create('NotificationCanBeClosed', 'Can this notification be closed?'),
            TextareaField::create('NotificationCopy', 'Notification content'),
            LinkField::create('NotificationLinkID', 'Notification link (optional)'),
        ]);

        /** -----------------------------------------
         * Keys
         * ----------------------------------------*/

        if (Helper::isSuperAdmin()) {

            $fields->addFieldsToTab('Root.APIKeys', [
                HeaderField::create('APIKeys', 'External API Keys'),
                TextField::create('GoogleAnalytics', 'Google Analytics Measurement ID or GTM ID')
                    ->setAttribute('placeholder', 'G-XXXXXXXXXXX or GTM-XXXXXX')
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
