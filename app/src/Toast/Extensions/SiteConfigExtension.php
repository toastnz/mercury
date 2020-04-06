<?php

namespace Toast\Extensions;

use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\TabSet;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\HeaderField;
use SilverStripe\Forms\TextField;
use SilverStripe\Control\Email\Email;
use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Forms\TreeMultiselectField;
use SilverStripe\SiteConfig\SiteConfig;
use SilverStripe\ORM\DataExtension;

class SiteConfigExtension extends DataExtension
{
    private static $db = [
        'HeadCodeInjection' => 'HTMLText',
        'FooterCodeInjection' => 'HTMLText',


        // 'ContactFormEmail' => 'Varchar(255)',
        // 'PostalAddress' => 'Text',
        // 'SubscribeContent' => 'HTMLText',
        // 'FacebookLink' => 'Varchar(255)',
        // 'LinkedInLink' => 'Varchar(255)',
        // 'PinterestLink' => 'Varchar(255)',
        // 'YouTubeLink' => 'Varchar(255)',
        // 'MailChimpAPI' => 'Varchar(255)',
        // 'MailChimpListID' => 'Varchar(255)',
        // 'MailChimpSuccessMessage' => 'Text',
        // 'GoogleMapsApiKey' => 'Varchar(100)',
        // 'GoogleTrackingID' => 'Varchar(100)',
        // 'GoogleTagManagerID' => 'Varchar(100)',
        // 'BHProjectKey' => 'Varchar(100)'
    ];

    public static $defaults = [
        // 'MailChimpSuccessMessage' => 'Your subscription has been received, you will be sent a confirmation email shortly.'
    ];

    public function updateCMSFields(FieldList $fields)
    {


        /** -----------------------------------------
         * Code Injection
         * ----------------------------------------*/

        $fields->findOrMakeTab('Root.CodeInjection');

        $fields->addFieldsToTab('Root.CodeInjection', [
            HeaderField::create('CodeInjection', 'Code Injection'),
            TextareaField::create('HeadCodeInjection', 'Head Code Injection')
            ->setDescription('Enter code that will be injected into the \'head\' tag on every page of your site.'),
            TextareaField::create('FooterCodeInjection', 'Footer Code Injection')
            ->setDescription('Enter code that will be injected into the footer on every page of your site.'),
        ]);

         /** -----------------------------------------
         * Code Injection
         * ----------------------------------------*/

        $fields->findOrMakeTab('Root.CodeInjection');

        $fields->addFieldsToTab('Root.ExternalAPIKeys', [
            HeaderField::create('ExternalAPIKeys', 'External API Keys'),
            TextField::create('GoogleAnalytics', 'Google Analytics Account Number')
            ->setAttribute('placeholder', 'UA-XXXXXX-Y')
            ->setDescription('Enter your <a href="https://support.google.com/analytics/answer/1008080?hl=en#GAID" target="_blank">Google Analytics Account Number</a> to enable Google Analytics on your site.'),
        ]);


        /** -----------------------------------------
         * Footer
         * ----------------------------------------*/

        // $fields->findOrMakeTab('Root.Settings.Subscription');

        // $fields->addFieldsToTab('Root.Settings.Subscription', [
        //     // Mailchimp
        //     HeaderField::create('NewsletterHeading', 'Newsletter Subscription'),
        //     LiteralField::create('MailchimpTooltip', '<p>The API key and list ID are necessary for the Newsletter Subscription form to function. <a href="https://us9.admin.mailchimp.com/account/api-key-popup/" target="_blank"><i>How do I get my MailChimp API Key?</i></a></p>'),
        //     TextField::create('MailChimpAPI', 'API Key'),
        //     TextField::create('MailChimpListID', 'List ID'),
        //     HTMLEditorField::create('SubscribeContent', 'Content')
        //         ->setRows(10)
        //         ->setDescription('Displays in the footer above the subscription form'),
        //     TextareaField::create('MailChimpSuccessMessage', 'Success Message')
        //         ->setRows(2)
        //         ->setDescription('Message displayed when a user has successfully subscribed to a list.')
        // ]);

        /** -----------------------------------------
         * Integrations
         * ----------------------------------------*/

        // $fields->findOrMakeTab('Root.Settings.Integrations');

        // $fields->addFieldsToTab('Root.Settings.Integrations', [

        //     // BugHerd
        //     HeaderField::create('BugherdHeading', 'Bugherd'),
        //     CheckboxField::create('EnableBugherd', 'Enable bugherd?'),
        //     TextField::create('BHProjectKey', 'Bugherd Project Key'),
        //     LiteralField::create('BHTooltip', '<p><a href="https://support.bugherd.com/hc/en-us/articles/204171450-Installing-the-Script" target="_blank"><i>How do I get my BugHerd Project Key?</i></a></p>'),

        //     // Google
        //     HeaderField::create('GoogleHeading', 'Google Tracking'),
        //     TextField::create('GoogleTrackingID', 'Tracking ID')
        //         ->addExtraClass('input-wrap--half')
        //         ->setAttribute('placeholder', 'UA-XXXXXXXX-X'),
        //     TextField::create('GoogleTagManagerID', 'Tag Manager ID')
        //         ->setAttribute('placeholder', 'GTM-XXXXXX')
        //         ->addExtraClass('input-wrap--half input-wrap--half--last'),

        //     // Google Maps
        //     HeaderField::create('GoogleMapsHeading', 'Google Maps'),
        //     TextField::create('GoogleMapsApiKey', 'Google Maps API Key'),

        // ]);
    }
}
