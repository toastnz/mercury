/*------------------------------------------------------------------
Import external
------------------------------------------------------------------*/

import $ from 'jquery';

/*------------------------------------------------------------------
Menu toggle
------------------------------------------------------------------*/

let $body = $('body');

/*------------------------------------------------------------------
Tabbed Content
------------------------------------------------------------------*/


/**
 * updateIndicator
*/
const updateIndicator = ($tab, $indicator) => {
    let position = $tab.position();
    $indicator.css({ top: position.top, height: $tab.outerHeight() });
};

/**
 * updateTabs
*/ 
const updateTabs = ($block, $currentTab) => {
    $block.find('.js-tabs-link,.js-tabs-item').removeClass('active');
    $currentTab.addClass('active');
    $block.find('.js-tabs-item').eq($currentTab.index() - 1).addClass('active');
};

document.addEventListener('DOMContentLoaded', () => {

    $('.js-tabs').each((index, element) => {

        let $this = $(element);
        let $indicator = $this.find('.js-tabbed-indicator');
        let $currentTab = $this.find('.js-tabs-link.active');

        updateIndicator($currentTab, $indicator);

        $this.on('click', '.js-tabs-link', (e) => {
            e.preventDefault();
            let $tab = $(e.currentTarget);
            $currentTab = $tab;
            updateIndicator($currentTab, $indicator);
            updateTabs($this, $currentTab);
        });
 
        window.addEventListener('resize', updateIndicator($currentTab, $indicator));

    });

});

