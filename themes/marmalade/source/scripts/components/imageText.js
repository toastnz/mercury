const query = document.querySelector.bind(document);
const queryAll = document.querySelectorAll.bind(document);

let parallaxItems = [];

const scrollHandler = () => {
    let windowHeight = window.innerHeight;
    parallaxItems.forEach((item) => {
        let ratio = parseFloat(item.getAttribute('data-parallax'));
        let rect = item.getBoundingClientRect();

        if (rect.top < window.innerHeight && rect.bottom > 0) {
            let normalized = (rect.top - windowHeight) / (rect.top - rect.bottom - windowHeight);
            normalized = Math.max(0, Math.min(1, normalized));
            let y = normalized * ratio * rect.height;
            item.style.webkitTransform = 'translate(0, ' + y + 'px)';
            item.style.msTransform = 'translate(0, ' + y + 'px)';
            item.style.transform = 'translate(0, ' + y + 'px)';
        }
    });
}

document.addEventListener('DOMContentLoaded', () => {

    parallaxItems = [...queryAll('[data-parallax]')];

    scrollHandler();

    window.addEventListener('scroll', scrollHandler);

});