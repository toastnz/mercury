const query = document.querySelector.bind(document);
const queryAll = document.querySelectorAll.bind(document);

document.addEventListener('DOMContentLoaded', () => {

    [...queryAll('.js-toggle-search')].forEach(toggleSearch => {
        toggleSearch.addEventListener('click', (e) => {
            e.preventDefault();
            document.body.classList.add('searchActive');
        });
    });

    [...queryAll('.js-close-search')].forEach(toggleSearch => {
        toggleSearch.addEventListener('click', (e) => {
            e.preventDefault();
            document.body.classList.remove('searchActive');
        });
    });

    document.onkeydown = (e) => {
        if (e.keyCode === 27) document.body.classList.remove('searchActive');
    };

});