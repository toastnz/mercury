<?php

namespace Toast\Controllers;

use SilverStripe\Assets\File;
use SilverStripe\Assets\Image;
use SilverStripe\ORM\ArrayList;
use SilverStripe\View\ArrayData;
use SilverStripe\Security\Security;
use SilverStripe\View\Requirements;
use SilverStripe\Control\Controller;
use SilverStripe\Versioned\Versioned;
use SilverStripe\ORM\FieldType\DBField;
use SilverStripe\SiteConfig\SiteConfig;
use SilverStripe\ORM\FieldType\DBHTMLText;
use SilverStripe\Core\Manifest\ModuleResourceLoader;

class StyleGuideController extends Controller
{

    private static $url_segment = '_styleguide';

    private static $allowed_actions = [
        'index'
    ];

    public function init()
    {

        $image = File::find('placeholder.jpg');

        if (!$image) {
            $file = Image::create();
            $file->setFromLocalFile('_resources/themes/mercury/dist/images/standard/placeholder.jpg', 'placeholder.jpg');
            $file->write();
            if (class_exists(Versioned::class)) {
                $file->copyVersionToStage(Versioned::DRAFT, Versioned::LIVE);
            }
        }

        parent::init();
    }


    // public function Slider()
    // {
    //     $Slides = new ArrayList([
    //         new ArrayData([
    //             'Image' => Image::find('placeholder.jpg'),
    //             'Title' => DBField::create_field(DBHTMLText::class, 'Slider Block Heading'),
    //             'Content' => DBField::create_field(DBHTMLText::class, 'Et indigna praefecti custodiam protectoribus mandaverat.'),
    //         ]),
    //         new ArrayData([
    //             'Image' => Image::find('placeholder.jpg'),
    //             'Title' => DBField::create_field(DBHTMLText::class, 'Slider Block Heading'),
    //             'Content' => DBField::create_field(DBHTMLText::class, 'Et indigna praefecti custodiam protectoribus mandaverat.'),
    //         ]),
    //         new ArrayData([
    //             'Image' => Image::find('placeholder.jpg'),
    //             'Title' => DBField::create_field(DBHTMLText::class, 'Slider Block Heading'),
    //             'Content' => DBField::create_field(DBHTMLText::class, 'Et indigna praefecti custodiam protectoribus mandaverat.'),
    //         ]),
    //         new ArrayData([
    //             'Image' => Image::find('placeholder.jpg'),
    //             'Title' => DBField::create_field(DBHTMLText::class, 'Slider Block Heading'),
    //             'Content' => DBField::create_field(DBHTMLText::class, 'Et indigna praefecti custodiam protectoribus mandaverat.'),
    //         ])
    //     ]);

    //     $arrayData = new ArrayData([
    //         'Heading' => 'A Slider block for slides',
    //         'Slides' => $Slides
    //     ]);

    //     return $arrayData->renderWith('Toast\Elements\Slider');
    // }



    public function Banner()
    {
        $BannerSlides = new ArrayList([
            new ArrayData([
                'BackgroundImage' => Image::find('placeholder.jpg'),
                'Content' => DBField::create_field(DBHTMLText::class, '<h1 class="colour--white">A simple narrow text block.</h1><p class="colour--white">If you are wanting to grab the attention of your user, you are best to keep it short and sharp to avoid confusion.</p>'),
            ]),
            new ArrayData([
                'BackgroundImage' => Image::find('placeholder.jpg'),
                'Content' => DBField::create_field(DBHTMLText::class, '<h1 class="colour--white">A simple narrow text block.</h1><p class="colour--white">If you are wanting to grab the attention of your user, you are best to keep it short and sharp to avoid confusion.</p>'),
            ]),
            new ArrayData([
                'BackgroundImage' => Image::find('placeholder.jpg'),
                'Content' => DBField::create_field(DBHTMLText::class, '<h1 class="colour--white">A simple narrow text block.</h1><p class="colour--white">If you are wanting to grab the attention of your user, you are best to keep it short and sharp to avoid confusion.</p>'),
            ])
        ]);

        $arrayData = new ArrayData([
            'BannerSlides' => $BannerSlides
        ]);

        return $arrayData->renderWith('Toast\Includes\Banner');
    }

    public function IntroElement()
    {
        $arrayData = new ArrayData([
            'Content' => DBField::create_field(DBHTMLText::class, '<h2 class="text-center">A simple narrow text block.</h2><p class="text-center">If you are wanting to grab the attention of your user, you are best to keep it short and sharp to avoid confusion.</p>'),
            'Width' => 'thin'
        ]);
        return $arrayData->renderWith('Toast\Elements\TextElement');
    }


    public function TextBlock()
    {
        $arrayData = new ArrayData([
            'Content' => DBField::create_field(DBHTMLText::class, '<h1>This is an H1, an important heading</h1>
            <h2>This is an H2, the second most important heading on a page</h2>
            <h3>This is an H3, the third most important heading on a page</h3>
            <h4>This is an H4, the fourth most important heading on a page</h4>
            <h5>This is an H5, the fifth most important heading on a page</h5>
            <h6>This is an H6, the sixth most important heading on a page</h6>
            <p>
                <strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper.
                <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed,
                <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui.
                <a href="#">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>
                <p>&nbsp;</p>
                <p>
                <a href="#" onclick="event.preventDefault();" class="button">Normal Button</a>
                <a href="#" onclick="event.preventDefault();" class="button button--secondary">Secondary Button</a>
                <a href="#" onclick="event.preventDefault();" class="button button--outline">Outline Button</a>
                </p>
                <br>
                <ul>
                    <li>This is an unordered list item</li>
                    <li>This is an unordered list item that has a slightly longer amount of text that may run over more than one line</li>
                    <li>This is an unordered list item
                        <ul>
                            <li>This is an unordered list item</li>
                            <li>This is an unordered list item that has a slightly longer amount of text that may run over more than one line</li>
                            <li>This is an unordered list item</li>
                            <li>This is an unordered list item</li>
                        </ul>
                    </li>
                    <li>This is an unordered list item</li>
                </ul>

                <ol>
                    <li>This is an unordered list item</li>
                    <li>This is an unordered list item that has a slightly longer amount of text that may run over more than one line</li>
                    <li>This is an unordered list item
                        <ol>
                            <li>This is an unordered list item</li>
                            <li>This is an unordered list item that has a slightly longer amount of text that may run over more than one line</li>
                            <li>This is an unordered list item</li>
                            <li>This is an unordered list item</li>
                        </ol>
                    </li>
                    <li>This is an unordered list item</li>
                </ol>
                <p>&nbsp;</p>
                <table>
                    <thead>
                        <tr>
                            <th>Table head th</th>
                            <th>Table head th</th>
                            <th>Table head th</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Table body td</td>
                            <td>Table body td</td>
                            <td>Table body td</td>
                        </tr>
                        <tr>
                            <td>Table body td</td>
                            <td>Table body td</td>
                            <td>Table body td</td>
                        </tr>
                        <tr>
                            <td>Table body td</td>
                            <td>Table body td</td>
                            <td>Table body td</td>
                        </tr>
                        <tr>
                            <td>Table body td</td>
                            <td>Table body td</td>
                            <td>Table body td</td>
                        </tr>
                    </tbody>
                </table>
                ')
        ]);
        return $arrayData->renderWith('Toast\Elements\TextElement');
    }

    public function TabbedElement()
    {
        $Tabs = new ArrayList([
            new ArrayData([
                'Title' => 'Dolor sit dolor',
                'Content' => DBField::create_field(DBHTMLText::class, '<h4>A tabbed content block helps show a lot of information in a small area</h4><p>Qui voluptate culpa in cupidatat incididunt occaecat amet amet aliqua est cillum culpa proident sunt. Esse minim eiusmod aliquip elit est incididunt et. Consectetur laborum irure eu amet non.</p><p>Qui voluptate culpa in cupidatat incididunt occaecat amet amet aliqua est cillum culpa proident sunt. Esse minim eiusmod aliquip elit est incididunt et. Consectetur laborum irure eu amet non.</p>'),
            ]),
            new ArrayData([
                'Title' => 'Adipisicing sunt',
                'Content' => DBField::create_field(DBHTMLText::class, '<h4>Deserunt enim laboris ipsum culpa id pariatur.</h4><p>In enim sint nisi ea laborum nisi minim fugiat ullamco. Aliquip eu officia ullamco veniam. Amet qui laboris consectetur commodo commodo et sit adipisicing non ad laboris culpa esse. Est consectetur quis enim ad deserunt occaecat mollit mollit amet ut adipisicing. Elit occaecat ad consectetur occaecat velit cupidatat nulla dolore do velit ad cupidatat sit in. Consequat duis dolor ea nisi fugiat laboris est id cupidatat minim aliquip occaecat consequat ut.</p><p>Qui voluptate culpa in cupidatat incididunt occaecat amet amet aliqua est cillum culpa proident sunt. Esse minim eiusmod aliquip elit est incididunt et. Consectetur laborum irure eu amet non.</p>'),
            ]),
            new ArrayData([
                'Title' => 'Occaecat eiusmod qui eiusmod sit dolor',
                'Content' => DBField::create_field(DBHTMLText::class, '<h4>Occaecat magna esse nulla duis eu elit velit eiusmod exercitation nostrud.</h4><p>Do ullamco consectetur exercitation elit ipsum ad commodo. Ullamco irure occaecat in laboris. Incididunt sunt nostrud ex aliquip fugiat dolor in voluptate sit dolor officia. Officia nostrud mollit eu dolor laboris cupidatat excepteur minim sint do labore. Mollit duis eiusmod occaecat pariatur sit. Ut mollit minim laborum tempor ex id elit adipisicing pariatur sint quis non excepteur et. In mollit ullamco aliquip cupidatat magna ut qui.</p><p>Qui voluptate culpa in cupidatat incididunt occaecat amet amet aliqua est cillum culpa proident sunt. Esse minim eiusmod aliquip elit est incididunt et. Consectetur laborum irure eu amet non.</p>'),
            ]),
            new ArrayData([
                'Title' => 'Dolor sit dolor',
                'Content' => DBField::create_field(DBHTMLText::class, '<h4>Fugiat mollit et labore magna elit enim.</h4><p>Qui voluptate culpa in cupidatat incididunt occaecat amet amet aliqua est cillum culpa proident sunt. Esse minim eiusmod aliquip elit est incididunt et. Consectetur laborum irure eu amet non.</p><p>Qui voluptate culpa in cupidatat incididunt occaecat amet amet aliqua est cillum culpa proident sunt. Esse minim eiusmod aliquip elit est incididunt et. Consectetur laborum irure eu amet non.</p>'),
            ]),
            new ArrayData([
                'Title' => 'Adipisicing sunt',
                'Content' => DBField::create_field(DBHTMLText::class, '<h4>Ad aliquip aliquip fugiat occaecat pariatur aliqua do eu amet ullamco duis consequat mollit in.</h4><p>Qui voluptate culpa in cupidatat incididunt occaecat amet amet aliqua est cillum culpa proident sunt. Esse minim eiusmod aliquip elit est incididunt et. Consectetur laborum irure eu amet non.</p><p>Qui voluptate culpa in cupidatat incididunt occaecat amet amet aliqua est cillum culpa proident sunt. Esse minim eiusmod aliquip elit est incididunt et. Consectetur laborum irure eu amet non.</p>'),
            ]),
            new ArrayData([
                'Title' => 'Occaecat eiusmod qui',
                'Content' => DBField::create_field(DBHTMLText::class, '<h4>Eu ex nisi laborum sunt eu incididunt deserunt tempor.</h4><p>Qui voluptate culpa in cupidatat incididunt occaecat amet amet aliqua est cillum culpa proident sunt. Esse minim eiusmod aliquip elit est incididunt et. Consectetur laborum irure eu amet non.</p><p>Qui voluptate culpa in cupidatat incididunt occaecat amet amet aliqua est cillum culpa proident sunt. Esse minim eiusmod aliquip elit est incididunt et. Consectetur laborum irure eu amet non.</p>'),
            ]),
        ]);

        $arrayData = new ArrayData([
            'Items' => $Tabs
        ]);

        return $arrayData->renderWith('Toast\Elements\TabbedElement');
    }

    public function LinkElement()
    {
        $Items = new ArrayList([
            new ArrayData([
                'Image' => Image::find('placeholder.jpg'),
                'Title' => 'Dolor sit dolor',
                'Summary' => 'Esse officia consectetur sit proident ipsum mollit fugiat amet veniam ipsum velit.'
            ]),
            new ArrayData([
                'Image' => Image::find('placeholder.jpg'),
                'Title' => 'Adipisicing sunt',
                'Summary' => 'Voluptate aliqua aliqua do occaecat eiusmod qui ut fugiat non in nisi occaecat ut aliquip.'
            ]),
            new ArrayData([
                'Image' => Image::find('placeholder.jpg'),
                'Title' => 'Occaecat eiusmod qui',
                'Summary' => 'Adipisicing sunt fugiat tempor elit Lorem ullamco mollit sit veniam.'
            ]),
            new ArrayData([
                'Image' => Image::find('placeholder.jpg'),
                'Title' => 'Dolor sit dolor',
                'Summary' => 'Esse officia consectetur sit proident ipsum mollit fugiat amet veniam ipsum velit.'
            ]),
            new ArrayData([
                'Image' => Image::find('placeholder.jpg'),
                'Title' => 'Adipisicing sunt',
                'Summary' => 'Voluptate aliqua aliqua do occaecat eiusmod qui ut fugiat non in nisi occaecat ut aliquip.'
            ]),
            new ArrayData([
                'Image' => Image::find('placeholder.jpg'),
                'Title' => 'Occaecat eiusmod qui',
                'Summary' => 'Adipisicing sunt fugiat tempor elit Lorem ullamco mollit sit veniam.'
            ]),
        ]);

        $arrayData = new ArrayData([
            'Items' => $Items
        ]);


        return $arrayData->renderWith('Toast\Elements\LinkElement   ');
    }


    public function index()
    {
        if (is_null(Security::getCurrentUser())) {
            return $this->redirect('Security/login?BackURL=_styleguide');
        } else {
            return $this->renderWith(['StyleGuideController', 'Page']);
        }
    }

    public function decodedTypeCSS()
    {
        $config = SiteConfig::current_site_config();
        return $this->internetExplorerFallback(@unserialize($config->typeCSS));
    }


    function internetExplorerFallback($css)
    {
        preg_match_all('/^\s*([^:]+)(:\s*(.+))?;\s*$/m', str_replace(';', ";\n", $css), $matches, PREG_SET_ORDER);
        foreach ($matches as $match) {
            if (count($match) >= 4) {
                $orig = $match[0];
                $attr = trim($match[1]);
                $value = trim($match[3]);
                if (in_array($attr, ['color', 'background', 'background-color', '--primary-colour', '--secondary-colour'])) {
                    if (strstr($value, '#') && (strlen($value) > 7)) {
                        $newValue = substr($value, 0, -2);
                        $css = str_replace($orig, $attr . ': ' . $newValue . ';' . $orig, $css);
                    }
                }
            }
        }
        $css = preg_replace('/[\s\+]/', ' ', $css);
        return $css;
    }

    public function TestimonialElement()
    {
        $accordionItems = new ArrayList([
            new ArrayData([
                'Testimonial' => 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.',
                'Author' => 'First name, Last Name',
                'Description' => 'Description',
            ]),
            new ArrayData([
                'Testimonial' => 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.',
                'Author' => 'First name, Last Name',
                'Description' => 'Description',
            ]),
            new ArrayData([
                'Testimonial' => 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.',
                'Author' => 'First name, Last Name',
                'Description' => 'Description',
            ]),
        ]);

        $arrayData = new ArrayData([
            'Width'       => 'standard',
            'Items' => $accordionItems
        ]);


        return $arrayData->renderWith('Toast\Elements\TestimonialElement');
    }

    public function VideoElement()
    {
        $arrayData = new ArrayData([
            'Width'       => 'standard',
            'Video' => new ArrayData([
                'Service'     => 'youtube',
                'VideoID'     => 'EngW7tLk6R8'
            ]),
            'Caption'     => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, ipsum dolor sit amet.',
            'ThumbnailID' => 12,
            'Thumbnail'   => Image::find('placeholder.jpg')
        ]);
        return $arrayData->renderWith('Toast\Elements\VideoElement');
    }

    public function ImageElement()
    {
        $arrayData = new ArrayData([
            'Image'   => Image::find('placeholder.jpg'),
            'Width'   => 'standard',
            'Sizes'   => '320,480,768,1024,1280,1920',
            'Caption' => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, ipsum dolor sit amet.',
        ]);
        return $arrayData->renderWith('Toast\Elements\ImageElement');
    }



    public function HeroElement()
    {
        $arrayData = new ArrayData([
            'Width'           => 'full',
            'BackgroundImage' => Image::find('placeholder.jpg'),
            'Content'         => DBField::create_field(DBHTMLText::class, '<h2 class="text-center colour--white">Now a hero block</h2><p class="text-center colour--white">An abstratc image <b>doesn\'t distract</b> the user from reading what is in this text box. You now have their attention to tell them anything that may be <i>important</i> to your brand mission.</p><p class="text-center"><a href="#" class="button">READ MORE</a></p>')
        ]);
        return $arrayData->renderWith('Toast\Elements\HeroElement   ');
    }

    public function ImageTextElement()
    {
        $arrayData = new ArrayData([
            'Width'   => 'wide',
            'Image'   => Image::find('placeholder.jpg'),
            'Content' => DBField::create_field(DBHTMLText::class, '<h3>An image and text block to show a page or service</h3><p>Pellentesque habitant morbi <strong>tristique</strong> senectus et <i>netus</i> et <u>malesuada</u> fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p><p><a href="#" class="button">READ MORE</a></p>'),
            'Alignment'     => 'image-right'
        ]);
        return $arrayData->renderWith('Toast\Elements\ImageTextElement');
    }


    public function ImageTextElementReversed()
    {
        $arrayData = new ArrayData([
            'Width'         => 'wide',
            'Image'         => Image::find('placeholder.jpg'),
            'Content'       => DBField::create_field(DBHTMLText::class, '<h3>Or a an image on the other side</h3><p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p><p><a href="#" class="button">READ MORE</a></p>'),
            'Alignment'     => 'image-left'
        ]);
        return $arrayData->renderWith('Toast\Elements\ImageTextElement');
    }

    public function AccordionElement()
    {

        $accordionItems = new ArrayList([
            new ArrayData([
                'Title' => 'Accordion Heading 1',
                'Content'      => DBField::create_field(DBHTMLText::class, '<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>')
            ]),
            new ArrayData([
                'Title' => 'Accordion Heading 2',
                'Content'      => DBField::create_field(DBHTMLText::class, '<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>')
            ]),
            new ArrayData([
                'Title' => 'Accordion Heading 3',
                'Content'      => DBField::create_field(DBHTMLText::class, '<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>')
            ]),
        ]);

        $arrayData = new ArrayData([
            'Items' => $accordionItems
        ]);

        return $arrayData->renderWith('Toast\Elements\AccordionElement  ');
    }



    public function DownloadElement()
    {
        $files = new ArrayList([
            new ArrayData([
                'File' => Image::find('placeholder.jpg'),
            ]),
            new ArrayData([
                'File' => Image::find('placeholder.jpg'),
            ]),
            new ArrayData([
                'File' => Image::find('placeholder.jpg'),
            ])
        ]);
        $arrayData = new ArrayData([
            'Items' => $files
        ]);
        return $arrayData->renderWith('Toast\Elements\DownloadElement   ');
    }

    public function SplitBlock()
    {
        $arrayData = new ArrayData([
            'LeftContent'  => 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.',
            'RightContent' => 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.',
            'LeftWidth'    => '200px',
            'RightWidth'   => '200px'
        ]);
        return $arrayData->renderWith('Toast\Elements\SplitElement  ');
    }

    public function getTypeTags()
    {
        return  new ArrayList([
            new ArrayData(['Selector' => 'h1', 'Name' => 'Heading 1']),
            new ArrayData(['Selector' => 'h2', 'Name' => 'Heading 2']),
            new ArrayData(['Selector' => 'h3', 'Name' => 'Heading 3']),
            new ArrayData(['Selector' => 'h4', 'Name' => 'Heading 4']),
            new ArrayData(['Selector' => 'h5', 'Name' => 'Heading 5']),
            new ArrayData(['Selector' => 'h6', 'Name' => 'Heading 6']),
            new ArrayData(['Selector' => 'p', 'Name' => 'Paragraph'])
        ]);
    }
    public function appendSizeVariants($sValue)
    {
        return  $sValue . ':100,300,400,500,600,700,800,900';
    }

    public function decodedFonts()
    {
        $config = SiteConfig::current_site_config();
        return json_encode(array_map(array($this, 'appendSizeVariants'), array_values(array_unique(json_decode($config->typeFonts)))));
    }
}
