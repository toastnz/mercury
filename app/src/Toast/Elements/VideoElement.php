<?php

namespace Toast\Elements;

use SilverStripe\Assets\Image;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\RequiredFields;
use UncleCheese\Forms\ImageOptionsetField;
use Axllent\FormFields\FieldType\VideoLink;
use Axllent\FormFields\Forms\VideoLinkField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\AssetAdmin\Forms\UploadField;

class VideoElement extends BaseElement
{
    private static $table_name = 'VideoElement';

    private static $singular_name = 'Video';

    private static $plural_name = 'Videos';

    private static $description = 'Vimeo or Youtube video';

    private static $inline_editable = true;

    private static $db = [
        'Caption' => 'Varchar(255)',
        'Video' => VideoLink::class,
        'Width' => 'Enum("standard,wide,narrow,thin", "standard")'
    ];

    private static $has_one = [
        'Thumbnail' => Image::class
    ];

    private static $owns = [
        'Thumbnail'
    ];

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
                    'wide' => 'app/dist/icons/wide.svg',
                    'standard' => 'app/dist/icons/standard.svg',
                    'narrow' => 'app/dist/icons//narrow.svg',
                    'thin' => 'app/dist/icons/thin.svg'    
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
