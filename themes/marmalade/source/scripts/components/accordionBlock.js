/*------------------------------------------------------------------
Helpers
------------------------------------------------------------------*/

const query = document.querySelector.bind(document);
const queryAll = document.querySelectorAll.bind(document);


/*------------------------------------------------------------------
Variables
------------------------------------------------------------------*/

const slideUp = (container) => {
    container.style.height = "0px"
    container.addEventListener('transitionend', () => {
        container.classList.remove('active')
    }, { once: true })
};

const slideDown = (container) => {
    container.classList.add('active')
    container.style.height = 'auto'
    let height = container.clientHeight + 'px'
    container.style.height = '0px'
    setTimeout(() => container.style.height = height, 0)
};

[...queryAll('.js-accordion-trigger')].forEach(accordionTrigger => {
    accordionTrigger.addEventListener('click', (e) => {
        e.preventDefault();

        accordion = accordionTrigger.closest('.js-accordion-item');

        if (accordion.classList.contains('active')) {
            accordion.classList.remove('active');
            slideUp(accordion.querySelector('.js-accordion-target'));
        } else {
            accordion.classList.add('active');
            slideDown(accordion.querySelector('.js-accordion-target'));
        }
    });
});