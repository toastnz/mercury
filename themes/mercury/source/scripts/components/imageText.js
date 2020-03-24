
let parallaxItems = [];

function scrollHandler() {
    let windowHeight = window.innerHeight;
    parallaxItems.forEach(function (item) {
        let ratio = parseFloat(item.getAttribute('data-parallax'));
        let rect = item.getBoundingClientRect();

        if (rect.top < window.innerHeight && rect.bottom > 0) {
            let normalized = (rect.top - windowHeight) / (rect.top - rect.bottom - windowHeight);
            normalized = Math.max(0, Math.min(1, normalized));
            let y = normalized * ratio * rect.height;
            item.style.webkitTransform = 'translate(0, ' + y + 'px)';
            item.style.MozTransform = 'translate(0, ' + y + 'px)';
            item.style.msTransform = 'translate(0, ' + y + 'px)';
            item.style.OTransform = 'translate(0, ' + y + 'px)';
            item.style.transform = 'translate(0, ' + y + 'px)';
        }
    });
}

function init() {
    let itemsParallax = document.querySelectorAll('[data-parallax]');

    for (let i = 0; i < itemsParallax.length; i++) {
        parallaxItems.push(itemsParallax[i]);
    }

    scrollHandler();
    window.addEventListener('scroll', scrollHandler);
}

window.onload = init;