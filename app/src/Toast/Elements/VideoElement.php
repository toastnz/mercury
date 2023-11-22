<?php

namespace Toast\Elements;

use SilverStripe\Assets\Image;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\RequiredFields;
use UncleCheese\Forms\ImageOptionsetField;
use Axllent\FormFields\FieldType\VideoLink;
use DNADesign\Elemental\Models\BaseElement;
use Axllent\FormFields\Forms\VideoLinkField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Core\Manifest\ModuleResourceLoader;

class VideoElement extends BaseElement
{
    private static $table_name = 'VideoElement';

    private static $singular_name = 'Video';

    private static $plural_name = 'Videos';

    private static $description = 'Vimeo or Youtube video';

    private static $inline_editable = false;

    private static $icon = 'font-icon-block-video';

    private static $db = [
        'Caption' => 'Varchar(255)',
        'Video' => VideoLink::class,
        'Width' => 'Enum("standard,full,wide,narrow,thin", "standard")'
    ];

    private static $has_one = [
        'Thumbnail' => Image::class
    ];

    private static $owns = [
        'Thumbnail'
    ];

    private static $defaults = [
        'Width' => 'standard'
    ];

    public function getType()
    {
        return self::$singular_name;
    }

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldsToTab('Root.Main', [
            TextField::create('Caption', 'Caption'),
            VideoLinkField::create('Video')
                ->showPreview(500),
            UploadField::create('Thumbnail', 'Override default Thumbnail')
                ->setFolderName('elements/images')
                ->setDescription('Will automatically use YouTube thumbnail if this image is not uploaded. Ideal size: 960x540'),
            ImageOptionsetField::create('Width', 'Select a Width')
                ->setSource([
                    'full' => ModuleResourceLoader::resourceURL('themes/mercury/dist/elements/full.svg'),
                    'wide' => ModuleResourceLoader::resourceURL('themes/mercury/dist/elements/wide.svg'),
                    'standard' => ModuleResourceLoader::resourceURL('themes/mercury/dist/elements/standard.svg'),
                    'narrow' => ModuleResourceLoader::resourceURL('themes/mercury/dist/elements/narrow.svg'),
                    'thin' => ModuleResourceLoader::resourceURL('themes/mercury/dist/elements/thin.svg')
                ])
                ->setImageWidth(100)
                ->setImageHeight(100)
        ]);

        return $fields;
    }

    public function getCMSValidator()
    {
        return RequiredFields::create([
            'Video'
        ]);
    }
}
