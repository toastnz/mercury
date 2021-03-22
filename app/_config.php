<?php

use SilverStripe\Forms\HTMLEditor\TinyMCEConfig;
use SilverStripe\Security\PasswordValidator;
use SilverStripe\Security\Member;
use SilverStripe\SiteConfig\SiteConfig;
use SilverStripe\Security\Security;
use SilverStripe\Core\Environment;
use StevieMayhew\SilverStripeSVG\SVGTemplate;
use SilverStripe\View\SSViewer;
// remove PasswordValidator for SilverStripe 5.0
$validator = PasswordValidator::create();
// Settings are registered via Injector configuration - see passwords.yml in framework
Member::set_password_validator($validator);

$theme = Environment::getEnv('SS_THEME');

// Our Base Theme Folder
SSViewer::config()->set('themes', [
    '$public',
    $theme,
    '$default'
]);

// Theme SVG Folder
SVGTemplate::config()->set('base_path', 'themes/' . $theme . '/dist/images/svg/');

$formats = [
    [
        'title'          => 'Colour - Primary',
        'inline'         => 'span',
        'classes'        => 'colour--primary',
        'wrapper'        => true,
        'merge_siblings' => false
    ],
];


if (Security::database_is_ready()) {

    // $config = SiteConfig::current_site_config();

    // $data = $config->typeCSS;

    // $primaryColour = substr($data, strpos($data, '--primary-colour:') + 17, 7);
    // $secondaryColour = substr($data, strpos($data, '--secondary-colour:') + 19, 7);

    TinyMCEConfig::get('cms')
        ->enablePlugins(['hr', 'anchor'])
        ->addButtonsToLine(2, 'styleselect')
        ->setContentCSS(['/themes/' . $theme . '/dist/styles/editor.css'])
        ->setOptions([
            'importcss_append'        => true,
            'style_formats'           => $formats,
            // 'content_style'   =>
            // '.colour--primary {color: ' . $primaryColour . '; } '
            //     . '.colour--secondary {color: ' . $secondaryColour . '; } '
            //     . '.colour--white {color: #bbbbbb; } '
            //     . '.button {padding:5px 10px !important;color:white;background: ' . $primaryColour . '; } '
            //     . '.button--secondary {padding:5px 10px !important;color:white;background: ' . $secondaryColour . '; } '
            //     . '.button--outline {padding:5px 10px !important;background:transparent;color:' . $primaryColour . ';border: 1px solid ' . $primaryColour . '; } '
        ]);
}
