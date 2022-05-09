/*------------------------------------------------------------------
Imports
------------------------------------------------------------------*/

import inView from 'in-view';

document.addEventListener('DOMContentLoaded', () => {
    inView('.js-in-view').on('enter', el => { el.classList.add('inView') })
});
