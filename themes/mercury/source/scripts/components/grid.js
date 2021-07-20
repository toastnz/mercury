/*------------------------------------------------------------------
Debug Grid
------------------------------------------------------------------*/

document.addEventListener('keydown', (e) => {
    if ((window.navigator.platform.match('Mac') ? e.metaKey : e.ctrlKey) && e.code === 'KeyG') {
        e.preventDefault();
        document.querySelector('.js-debug-grid').classList.toggle('active');
    }
}, false);
