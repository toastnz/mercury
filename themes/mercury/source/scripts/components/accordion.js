export class Accordion {

    /**
     * 
     * Constructor
     * 
     * @param {element} element accordion parent
     */
    constructor(element) {

        this.accordion = element;
        this.trigger = this.accordion.querySelector('.js-trigger');
        this.content = this.accordion.querySelector('.js-content');

        // Initialise the accordion
        this.init();
    }


    /**
     * 
     * Initialise the accordion item
     * 
     */
    init() {

        // Get the initial state of the accordion
        this.getState();

        // Add the click event handler to the accordion
        this.addEventListeners();
    }


    /**
     * 
     * Get the current state of the accordion
     * 
     */
    getState() {
        this.is_open = this.accordion.classList.contains('active');
    }


    /**
    * 
    * Toggle the current state of the accordion
    * 
    */
    toggle() {
        (this.is_open) ? this.close() : this.open();
    }

    /**
     * 
     * Add the click event handler to the accordion
     * 
     */
    addEventListeners() {
        this.accordion.addEventListener('click', () => this.toggle());
    }


    /**
     * 
     * Add the click event handler to the accordion
     * 
     */
    updateState(state) {

        // Update the current state
        this.is_open = state;

        // Update the aria-expanded attribute
        this.trigger.setAttribute('aria-expanded', state);

    }


    /**
     * 
     * Open the accordion
     * 
     */
    open() {

        // Add active class to the accordion
        this.accordion.classList.add('active');

        // Quickly get the height we want to animate to
        this.content.style.height = 'auto';
        var height = this.content.clientHeight + 'px';

        // Revert the heioght back to nothing
        this.content.style.height = 0;

        // Animate the height once the calculations are done
        setTimeout(() => this.content.style.height = height, 0);

        // Update the current state
        this.updateState(true);

    }

    /**
     * 
     * Close the accordion
     * 
     */
    close() {

        // Revert the height back to nothing
        this.content.style.height = 0;

        // Remove the active class once animations are over
        this.content.addEventListener('transitionend', () => {
            this.accordion.classList.remove('active');
        }, { once: true });

        // Update the current state
        this.updateState(false);

    }
}

