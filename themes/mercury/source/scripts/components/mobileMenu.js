/*------------------------------------------------------------------
Mega Menu
------------------------------------------------------------------*/

import $ from 'jquery';

let $body = $('body');
let enableMobileMenu = true;

/*------------------------------------------------------------------
Variables
------------------------------------------------------------------*/
$(() => {

    $body.on('click', '.js-toggle-menu', function (e) {
        e.preventDefault();
        $body.toggleClass('mobileMenuActive');
    });

    let $topLevel = $('.js-top-level');

    $topLevel.on('click', (e) => {

        /*------------------------------------------------------------------
        If the user didnt click on the span in side
        ------------------------------------------------------------------*/

        if (e.target !== 'span') {
            let $this = $(e.currentTarget);
            if (!$this.hasClass('active')) {
                $topLevel.removeClass('active');
                $('.js-second-level').slideUp();
                $this.next('.js-second-level').slideToggle();
                setTimeout(() => $this.addClass('active'), 100);
            } else {
                $topLevel.removeClass('active');
                $('.js-second-level').slideUp();
            }
        }
    });

});
