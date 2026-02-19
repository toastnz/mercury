<?php

namespace Toast\Extensions;

use Toast\Helpers\Helper;
use SilverStripe\Assets\File;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\HeaderField;
use SilverStripe\Core\Extension;
use SilverStripe\LinkField\Form\LinkField;
use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\LinkField\Models\Link;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;

class SiteConfigExtension extends Extension
{
    private static $db = [
        'HeadCodeInjection' => 'Text',
        'FooterCodeInjection' => 'Text',
        'BodyCodeInjection' => 'Text',
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
                TextareaField::create('BodyCodeInjection', 'Body Code Injection')
                    ->setDescription('Enter code that will be injected into the body on every page of your site.'),
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

    }
}
