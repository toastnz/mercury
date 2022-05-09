/*------------------------------------------------------------------
Helpers
------------------------------------------------------------------*/

const query = document.querySelector.bind(document);
const queryAll = document.querySelectorAll.bind(document);


/*------------------------------------------------------------------
Variables
------------------------------------------------------------------*/
document.addEventListener('DOMContentLoaded', () => {

    document.querySelector('.js-toggle-menu').addEventListener('click', (e) => {
        e.preventDefault();
        document.body.classList.toggle('mobileMenuActive');
    });
});
