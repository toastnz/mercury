/*------------------------------------------------------------------
Debug Grid
------------------------------------------------------------------*/

import Combokeys from 'combokeys';

document.addEventListener('DOMContentLoaded', () => {
    let combokeys = new Combokeys(document.documentElement);
    let el = document.querySelector('.js-debug-grid');


    combokeys.bind(['command+g', 'ctrl+g'], () => {
        el.classList.toggle('active');
        return false;
    });
});
