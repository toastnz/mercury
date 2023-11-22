<?php

use SilverStripe\Security\Member;
use SilverStripe\Security\Security;
use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\SiteConfig\SiteConfig;
use SilverStripe\Security\PasswordValidator;
use SilverStripe\View\Parsers\ShortcodeParser;
use SilverStripe\ORM\Search\FulltextSearchable;
use SilverStripe\Forms\HTMLEditor\TinyMCEConfig;

$validator = PasswordValidator::create();
Member::set_password_validator($validator);

$formats = [
    [
        'title'    => 'Headings',
        'items'    => [
            [
                'title'    => 'Heading 1',
                'classes'   => 'h1',
                'inline'         => 'span',
            ],
            [
                'title'    => 'Heading 2',
                'classes'   => 'h2',
                'inline'         => 'span',
            ],
            [
                'title'    => 'Heading 3',
                'classes'   => 'h3',
                'inline'         => 'span',
            ],
            [
                'title'    => 'Heading 4',
                'classes'   => 'h4',
                'inline'         => 'span',
            ],
            [
                'title'    => 'Heading 5',
                'classes'   => 'h5',
                'inline'         => 'span',
            ],
            [
                'title'    => 'Heading 6',
                'classes'   => 'h6',
                'inline'         => 'span',
            ],
        ]
    ],
    [
        'title'          => 'Colour - Primary',
        'inline'         => 'span',
        'classes'        => 'colour--primary',
        'wrapper'        => true,
        'merge_siblings' => false
    ],
    [
        'title'          => 'Colour - Secondary ',
        'inline'         => 'span',
        'classes'        => 'colour--secondary',
        'merge_siblings' => false
    ],
    [
        'title'          => 'Colour - White ',
        'inline'         => 'span',
        'classes'        => 'colour--white',
        'merge_siblings' => false
    ],
    [
        'title'    => 'Button - Primary',
        'selector' => 'a, button',
        'classes'  => 'button',
        'wrapper'  => false,
    ],
    [
        'title'    => 'Button - Secondary',
        'selector' => 'a, button',
        'classes'  => 'button button--secondary',
        'wrapper'  => false,
    ],
    [
        'title'    => 'Button - Outline',
        'selector' => 'a, button',
        'classes'  => 'button button--outline',
        'wrapper'  => false,
    ]
];

TinyMCEConfig::get('cms')->enablePlugins(['hr', 'anchor']);

try {
    $config = SiteConfig::current_site_config();

    $data = $config->typeCSS ?: '';

    $primaryColour = substr($data, strpos($data, '--primary-colour:') + 17, 7);
    $secondaryColour = substr($data, strpos($data, '--secondary-colour:') + 19, 7);
    TinyMCEConfig::get('cms')
        ->addButtonsToLine(2, 'styles')
        ->setOptions([
            'importcss_append' => true,
            'style_formats' => $formats,
            'content_style' =>
            '.colour--primary {color: ' . $primaryColour . '; } '
                . '.colour--secondary {color: ' . $secondaryColour . '; } '
                . '.colour--white {color: #bbbbbb; } '
                . '.button--rounded {padding:5px 10px !important;border-radius:100rem; color:' . $primaryColour . ';border: 1px solid ' . $primaryColour . '; border-radius:100rem;} '
                . '.button {padding:5px 10px !important;color:white;background: ' . $primaryColour . '; } '
                . '.button--secondary {padding:5px 10px !important;color:white;background: ' . $secondaryColour . '; } '
                . '.button--outline {padding:5px 10px !important;background:transparent;color:' . $primaryColour . ';border: 1px solid ' . $primaryColour . '; } '
                . '.text-center {text-align:center;} '
                . '.text-right {text-align:right;} '
                . 'h1,.h1 {font-size:2.4em;margin-top: .2em;margin-bottom: .2em;} '
                . 'h2,.h2 {font-size:2.2em;margin-top: .2em;margin-bottom: .2em;} '
                . 'h3,.h3 {font-size:2.0em;margin-top: .2em;margin-bottom: .2em;} '
                . 'h4,.h4 {font-size:1.8em;margin-top: .2em;margin-bottom: .2em;} '
                . 'h5,.h5 {font-size:1.4em;margin-top: .2em;margin-bottom: .2em;} '
                . 'h6,.h6 {font-size:1.2em;margin-top: .2em;margin-bottom: .2em;} '
                . 'p {font-size:1em;margin-top: 1em;margin-bottom: 1em;line-height:1.4 !important} '
        ]);
} catch (\Exception $e) {
}

try {
    FulltextSearchable::enable([SiteTree::class]);
} catch (\Exception $e) {
    user_error($e->getMessage(), E_USER_NOTICE);
}


ShortcodeParser::get('default')->register('element', ['Page', 'ElementShortCode']);
