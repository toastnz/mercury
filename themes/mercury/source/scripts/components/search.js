import $ from 'jquery';

$(() => {

    let $body = $('body'); 

    $body.on('click', '.js-toggle-search', function (e) {
        e.preventDefault();
        $body.addClass('searchActive');
    });

    $body.on('click', '.js-close-search', function (e) {
        e.preventDefault();
        $body.removeClass('searchActive');
    });

    $(document).on('keydown', (e) => {
        if (e.keyCode === 27) $body.removeClass('searchActive');
    });

});