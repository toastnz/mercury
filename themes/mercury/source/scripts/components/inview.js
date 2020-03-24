/*------------------------------------------------------------------
Imports
------------------------------------------------------------------*/

import inView from 'in-view';

setTimeout(() => {
    inView('.js-in-view')
        .on('enter', el => { el.classList.add('inView') })
    // .on('exit', el => el.classList.remove('inView'));
}, 1);
