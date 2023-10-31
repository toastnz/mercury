<?php

namespace Toast\Models;

use SilverStripe\Assets\Image;
use SilverStripe\ORM\DataObject;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use Axllent\FormFields\FieldType\VideoLink;
use Axllent\FormFields\Forms\VideoLinkField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Forms\CheckboxField;

class BannerSlide extends DataObject
{

    private static $table_name = 'BannerSlide';

    private static $db = [
        'Content' => 'HTMLText',
        'Overlay' => 'Boolean(0)',
        'BannerVideo' => VideoLink::class,
        'SortOrder' => 'Int'
    ];

    private static $has_one = [
        'BackgroundImage' => Image::class,
        'Parent' => \Page::class
    ];

    private static $owns = [
        'BackgroundImage'
    ];

    private static $summary_fields = [
        'Content.Summary' => 'Content',
        'BackgroundImage.CMSThumbnail' => 'Background Image'
    ];

    public function getCMSFields()
    {

        $fields = parent::getCMSFields();


        $fields->removeByName(['SortOrder', 'ParentID']);


        $fields->addFieldsToTab('Root.Main', [
            HTMLEditorField::create('Content', 'Content')->setRows(6),
            CheckboxField::create('Overlay', 'Show background overlay'),
            VideoLinkField::create('BannerVideo', 'Banner Video')
                ->showPreview('100%'),
            UploadField::create('BackgroundImage', 'Background Image')
                ->setIsMultiUpload(false)
                ->setAllowedExtensions(['jpg'])
                ->setFolderName('Banner Images'),
        ]);

        $fields->changeFieldOrder([
            'Content',
            'BannerVideo',
            'BackgroundImage',
        ]);

        return $fields;
    }
}
