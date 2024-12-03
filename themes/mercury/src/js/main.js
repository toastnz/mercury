console.log("\n%c Mercury 2.0.0", "color:#fff;font-size:12px; padding:0.45rem 0.75rem; margin: 0rem auto 1rem auto; font-family: Helvetica, sans-serif; border: 2px solid #0dd8d8; border-radius: 4px;font-weight: 100;background-size: cover;background-repeat: no-repeat;border: double 1px transparent;background-image: linear-gradient(#282828, #282828), radial-gradient(circle at top left, #2563EB, #82a0e2);background-origin: border-box;background-clip: padding-box, border-box;")


/*------------------------------------------------------------------ 
Import styles
------------------------------------------------------------------*/

import '../styles/main.scss';

/*------------------------------------------------------------------ 
Import scripts
------------------------------------------------------------------*/

import { $, $$ } from '@/utilities/helpers';

/*------------------------------------------------------------------
Start the app
------------------------------------------------------------------*/

document.addEventListener('DOMContentLoaded', () => {

    /*------------------------------------------------------------------
    Intersection observers for animation styles
    ------------------------------------------------------------------*/
    const observer = new IntersectionObserver(entries => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('inview');
            }
        });
    }, {
        root: null, // Use the viewport as the root
        rootMargin: '-5% 0px' // Trigger when the element is in the middle of the page
    });

    setTimeout(() => $$('.js-inview').forEach(element => observer.observe(element)), 10);

    /*------------------------------------------------------------------
    Sliders
    ------------------------------------------------------------------*/

    if ($('.embla')) {
        import('@/components/slider')
            .then(module => $$('.embla').forEach(element => new module.Slider(element)))
            .catch(error => console.error("Slider video component failed to load", error));
    }

    /*------------------------------------------------------------------
    Banner Video
    ------------------------------------------------------------------*/


    if ($('.js-banner-video')) {
        import('@/components/banner-video')
            .catch(error => console.error("Banner video component failed to load", error));
    }

    /*------------------------------------------------------------------
    Accordion Elements
    ------------------------------------------------------------------*/


    if ($('.js-accordion-element')) {
        import('@/components/accordion')
            .then(module => $$('.js-accordion-element').forEach(element => new module.Accordion(element)))
            .catch(error => console.error("Accordion component failed to load", error));
    }


    /*------------------------------------------------------------------
    Video Elements
    ------------------------------------------------------------------*/

    if ($('.js-video-element')) {
        import('@/components/video')
            .then(module => $$('.js-video-element').forEach(element => new module.Video(element)))
            .catch(error => console.error("Video component failed to load", error));
    }


    /*------------------------------------------------------------------
    Post Load classname removal:
    This removes the class `js-postload` from elements after the page 
    has loaded, to prevent any unwanted animations.
    ------------------------------------------------------------------*/

    $$('.js-postload').forEach(element => {
        element.classList.remove('js-postload');
    });


    /*------------------------------------------------------------------
    Sticky header:
    It hides/shows the header when scrolling up and down
    ------------------------------------------------------------------*/

    // Initialize the previous scroll position to 0
    let previousScrollPosition = 0;

    // Define the scroll delta to determine significant scroll changes
    const scrollDelta = 5;

    // Select the header element
    const header = document.querySelector('.header');

    // Calculate the header height, defaulting to 0 if the header is not found
    const headerHeight = header ? header.clientHeight / 3 : 0;

    /**
     * Function to handle the sticky header behavior based on scroll position.
     */
    const stickyHeader = () => {
        // If no header is found, exit the function
        if (!header) return;

        // Get the current scroll position
        let currentScroll = window.scrollY;

        // If the scroll change is less than the defined delta, exit the function
        if (Math.abs(previousScrollPosition - currentScroll) <= scrollDelta) return;

        // If at the top of the page, remove any navigation classes
        if (currentScroll === 0) {
            header.classList.remove('nav-down', 'nav-up');
        }
        // If scrolling down and past the header height, hide the header
        else if (currentScroll > previousScrollPosition && currentScroll > headerHeight) {
            header.classList.remove('nav-down');
            header.classList.add('nav-up');
        }
        // If scrolling up and not at the bottom of the page, show the header
        else {
            if (currentScroll + window.innerHeight < document.body.clientHeight) {
                header.classList.add('nav-down');
                header.classList.remove('nav-up');
            }
        }

        // Update the previous scroll position
        previousScrollPosition = currentScroll;
    };

    // Use requestAnimationFrame for smoother scroll event handling
    let isScrolling = false;

    // Add a scroll event listener to the window
    window.addEventListener('scroll', () => {
        // If not already scrolling, use requestAnimationFrame to call stickyHeader
        if (!isScrolling) {
            window.requestAnimationFrame(() => {
                stickyHeader();
                isScrolling = false;
            });
            isScrolling = true;
        }
    });
});

