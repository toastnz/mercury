<?php

namespace Toast\Controllers;

use SilverStripe\Assets\File;
use SilverStripe\Control\Controller;
use SilverStripe\ORM\ArrayList;
use SilverStripe\Security\Security;
use SilverStripe\View\ArrayData;
use SilverStripe\SiteConfig\SiteConfig;
use SilverStripe\View\Requirements;
use SilverStripe\Assets\Image;
use SilverStripe\Versioned\Versioned;
use SilverStripe\ORM\FieldType\DBField;
use SilverStripe\ORM\FieldType\DBHTMLText;

class StyleGuideController extends Controller
{

    private static $url_segment = '_styleguide';

    private static $allowed_actions = [
        'index'
    ];

    public function init()
    {

        $image = File::find('Placeholder.jpg');

        if (!$image) {
            $file = Image::create();
            $file->setFromLocalFile('themes/mercury/dist/images/standard/Placeholder.jpg', 'Placeholder.jpg');
            $file->write();
            if (class_exists(Versioned::class)) {
                $file->copyVersionToStage(Versioned::DRAFT, Versioned::LIVE);
            }
        }

        parent::init();
    }

    public function TextBlock()
    {
        $arrayData = new ArrayData([
            'Content' => DBField::create_field(DBHTMLText::class, '<h1>This is an H1, the most important heading on a page</h1>
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
                <p>
                <a href="#" onclick="event.preventDefault();" class="button button--rounded">Normal Button Rounded</a>
                <a href="#" onclick="event.preventDefault();" class="button button--secondary button--rounded">Secondary Button Rounded</a>
                <a href="#" onclick="event.preventDefault();" class="button button--outline button--rounded">Outline Button Rounded</a>
                <p>&nbsp;</p>
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
        return $arrayData->renderWith('Toast\Blocks\Block');
    }

    public function TabbedContentBlock()
    {
        $Tabs = new ArrayList([
            new ArrayData([
                'Title' => 'Dolor sit dolor',
                'Content' => DBField::create_field(DBHTMLText::class, '<h4>Aute amet sit ex mollit non dolor do tempor do dolor culpa.</h4><p>Qui voluptate culpa in cupidatat incididunt occaecat amet amet aliqua est cillum culpa proident sunt. Esse minim eiusmod aliquip elit est incididunt et. Consectetur laborum irure eu amet non.</p><p>Qui voluptate culpa in cupidatat incididunt occaecat amet amet aliqua est cillum culpa proident sunt. Esse minim eiusmod aliquip elit est incididunt et. Consectetur laborum irure eu amet non.</p>'),
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
            'Tabs' => $Tabs
        ]);

        return $arrayData->renderWith('Toast\Blocks\TabbedContentBlock');
    }

    public function LinkBlock()
    {
        $Items = new ArrayList([
            new ArrayData([
                'Image' => Image::find('Placeholder.jpg'),
                'Title' => 'Dolor sit dolor',
                'Summary' => 'Esse officia consectetur sit proident ipsum mollit fugiat amet veniam ipsum velit.'
            ]),
            new ArrayData([
                'Image' => Image::find('Placeholder.jpg'),
                'Title' => 'Adipisicing sunt',
                'Summary' => 'Voluptate aliqua aliqua do occaecat eiusmod qui ut fugiat non in nisi occaecat ut aliquip.'
            ]),
            new ArrayData([
                'Image' => Image::find('Placeholder.jpg'),
                'Title' => 'Occaecat eiusmod qui',
                'Summary' => 'Adipisicing sunt fugiat tempor elit Lorem ullamco mollit sit veniam.'
            ]),
            new ArrayData([
                'Image' => Image::find('Placeholder.jpg'),
                'Title' => 'Dolor sit dolor',
                'Summary' => 'Esse officia consectetur sit proident ipsum mollit fugiat amet veniam ipsum velit.'
            ]),
            new ArrayData([
                'Image' => Image::find('Placeholder.jpg'),
                'Title' => 'Adipisicing sunt',
                'Summary' => 'Voluptate aliqua aliqua do occaecat eiusmod qui ut fugiat non in nisi occaecat ut aliquip.'
            ]),
            new ArrayData([
                'Image' => Image::find('Placeholder.jpg'),
                'Title' => 'Occaecat eiusmod qui',
                'Summary' => 'Adipisicing sunt fugiat tempor elit Lorem ullamco mollit sit veniam.'
            ]),
        ]);

        $arrayData = new ArrayData([
            'Items' => $Items
        ]);


        return $arrayData->renderWith('Toast\Blocks\LinkBlock');
    }


    public function index()
    {
        if (is_null(Security::getCurrentUser())) {
            return $this->redirect('Security/login?BackURL=_styleguide');
        } else {
            return $this->renderWith(['StyleGuideController', 'Page']);
        }
    }


    public function TestimonialBlock()
    {
        $accordionItems = new ArrayList([
            new ArrayData([
                'Testimonial' => 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.',
                'Attribution' => 'First name, Last Name',
            ]),
            new ArrayData([
                'Testimonial' => 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.',
                'Attribution' => 'First name, Last Name',
            ]),
            new ArrayData([
                'Testimonial' => 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.',
                'Attribution' => 'First name, Last Name',
            ]),
        ]);

        $arrayData = new ArrayData([
            'Testimonials' => $accordionItems
        ]);


        return $arrayData->renderWith('Toast\Blocks\TestimonialBlock');
    }

    public function VideoBlock()
    {
        $arrayData = new ArrayData([
            'VideoType' => 'youtube',
            'Video'     => 'ScMzIvxBSi4',
            'Caption'   => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, ipsum dolor sit amet.',
            'ThumbnailID' => 12,
            'Thumbnail' => Image::find('Placeholder.jpg')
        ]);
        return $arrayData->renderWith('Toast\Blocks\VideoBlock');
    }

    public function ImageBlock()
    {
        $arrayData = new ArrayData([
            'Image'   => Image::find('Placeholder.jpg'),
            'Caption' => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, ipsum dolor sit amet.',
        ]);
        return $arrayData->renderWith('Toast\Blocks\ImageBlock');
    }


    public function ImageTextBlock()
    {
        $arrayData = new ArrayData([
            'Image'   => Image::find('Placeholder.jpg'),
            'Content'      => DBField::create_field(DBHTMLText::class, '<h3>Ipsum dolor sit</h3><p>Pellentesque habitant morbi <strong>tristique</strong> senectus et <i>netus</i> et <u>malesuada</u> fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p><p><a href="#" class="button">READ MORE</a></p>')
        ]);
        return $arrayData->renderWith('Toast\Blocks\ImageTextBlock');
    }


    public function ImageTextBlockReversed()
    {
        $arrayData = new ArrayData([
            'Image'   => Image::find('Placeholder.jpg'),
            'Content'      => DBField::create_field(DBHTMLText::class, '<h3>Adipiscing elit</h3><p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p><p><a href="#" class="button">READ MORE</a></p>'),
            'ReverseLayout' => true
        ]);
        return $arrayData->renderWith('Toast\Blocks\ImageTextBlock');
    }

    public function AccordionBlock()
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

        return $arrayData->renderWith('Toast\Blocks\AccordionBlock');
    }



    public function DownloadBlock()
    {
        $files     = new ArrayList([
            new ArrayData([
                'File' => Image::find('Placeholder.jpg'),
            ]),
            new ArrayData([
                'File' => Image::find('Placeholder.jpg'),
            ]),
            new ArrayData([
                'File' => Image::find('Placeholder.jpg'),
            ])
        ]);
        $arrayData = new ArrayData([
            'Items' => $files
        ]);
        return $arrayData->renderWith('Toast\Blocks\DownloadBlock');
    }

    public function SplitBlock()
    {
        $arrayData = new ArrayData([
            'LeftContent'  => 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.',
            'RightContent' => 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.',
            'LeftWidth'    => '200px',
            'RightWidth'   => '200px'
        ]);
        return $arrayData->renderWith('Toast\Blocks\SplitBlock');
    }

    public function getTags()
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
