import { $, $$, debounce } from '@/utilities/helpers';
import EmblaCarousel from 'embla-carousel';

export class Slider {
    constructor(element, speed = 5000) {
        this.element = element;
        this.speed = speed;
        this.viewport = this.element.querySelector('.embla__viewport');
        this.count = this.element.querySelector('.embla__count');
        this.dotsNode = this.element.querySelector('.embla__dots');
        this.prevButton = this.element.querySelector('.embla__prev');
        this.nextButton = this.element.querySelector('.embla__next');

        this.autoplayInterval = null;
        this.progressBarInterval = null;
        this.dots = [];

        this.init();
    }

    /**
     * Initialize the slider and its components
     */
    init() {
        this.embla = EmblaCarousel(this.viewport, { loop: true });

        this._setupNavigation();
        this._addDots();
        this._startAutoplay();

        this.embla.on('select', () => {
            this._updateProgressBar();
            this._updateCount();
        });

        this.embla.on('init', () => {
            this._updateProgressBar();
            this._updateCount();
        });

        this.embla.on('pointerDown', this._stopAutoplay.bind(this));
    }

    /**
     * Setup navigation buttons
     */
    _setupNavigation() {
        this.prevButton.addEventListener('click', () => this.embla.scrollPrev());
        this.nextButton.addEventListener('click', () => this.embla.scrollNext());
    }

    /**
     * Add dots navigation and attach related functionality
     */
    _addDots() {
        const snapList = this.embla.scrollSnapList();

        this.dots = snapList.map((_, index) => {
            const dot = document.createElement('button');
            dot.className = 'embla__dot banner__dot';
            dot.setAttribute('aria-label', `Go to slide ${index + 1}`);

            const progressBar = document.createElement('div');
            progressBar.className = 'embla__progress';
            dot.appendChild(progressBar);

            dot.addEventListener('click', () => {
                this._stopAutoplay();
                this.embla.scrollTo(index);
                this._startAutoplay();
            });

            this.dotsNode.appendChild(dot);
            return { dot, progressBar };
        });

        const updateDots = this._updateDots.bind(this);
        this.embla.on('select', updateDots);
        this.embla.on('init', updateDots);
    }

    /**
     * Update dots state based on the current slide
     */
    _updateDots() {
        const selectedSnap = this.embla.selectedScrollSnap();
        this.dots.forEach(({ dot, progressBar }, index) => {
            dot.classList.toggle('is-selected', index === selectedSnap);
            progressBar.style.width = '0%';
        });
    }

    /**
     * Start autoplay functionality
     */
    _startAutoplay() {
        this.autoplayInterval = setInterval(() => {
            this.embla.scrollNext();
        }, this.speed);
    }

    /**
     * Stop autoplay functionality
     */
    _stopAutoplay() {
        clearInterval(this.autoplayInterval);
        clearInterval(this.progressBarInterval);
    }

    /**
     * Update the progress bar for the current slide
     */
    _updateProgressBar() {
        clearInterval(this.progressBarInterval);

        const selectedSnap = this.embla.selectedScrollSnap();
        const progressBar = this.dots[selectedSnap]?.progressBar;

        this.dots.forEach(({ progressBar }, index) => {
            progressBar.style.width = index === selectedSnap ? '0%' : '0%';
        });

        let currentProgress = 0;
        this.progressBarInterval = setInterval(() => {
            if (currentProgress < 100) {
                currentProgress += 100 / (this.speed / 100);
                if (progressBar) {
                    progressBar.style.width = `${currentProgress}%`;
                }
            } else {
                clearInterval(this.progressBarInterval);
                if (progressBar) {
                    progressBar.style.width = '0%';
                }
            }
        }, 100);
    }

    /**
     * Update slide count display
     */
    _updateCount() {
        const slide = this.embla.selectedScrollSnap() + 1;
        const totalSlides = this.embla.scrollSnapList().length;
        if (this.count) {
            this.count.textContent = `${slide} / ${totalSlides}`;
        }
    }
}
