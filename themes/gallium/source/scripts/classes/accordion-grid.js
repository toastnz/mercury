// -----------------------------------------
// External Imports
// -----------------------------------------

import { nodeArray, attach, offset } from 'meteora';

// -----------------------------------------
// Internal Imports
// -----------------------------------------

import ToggleHeight from './toggle-height';
import lastInRow from '../functions/last-in-row';

// -----------------------------------------
// Accordion Grid
// -----------------------------------------

class AccordionGrid {
  constructor(el) {
    // The container element
    this.container = el;
    // All the grid elements
    this.elements = nodeArray(this.container.querySelectorAll('.js-accordion-grid--item'));

    // This will become a list of AccordionGridItem's
    this.items = [];

    // Used to throttle the accordion function
    this.timeout = null;

    // Grab all the items and apply events
    this.init();

    attach(window, 'resize', () => this.closeAll(), 500);
  };

  init() {
    this.elements.forEach((item) => {
      // Add a new AccordionGridItem to our list of items
      this.items.push(new AccordionGridItem(item));
    });

    // For each item, check if they have details and apply click handler
    this.items.forEach((item, index) => {
      item.prev = (index > 0) ? this.items[index - 1] : false;

      if (item.details) {
        item.link.addEventListener('click', (e) => {
          e.preventDefault();

          // Close existing items;
          this.items.filter((i) => i != item).forEach((i) => this.close(i));

          // Open this item;
          (item.open) ? this.close(item) : this.open(item, index);
        });
      }
    });
  }

  close(item) {
    // Check the item is actually open
    if (item.open) {
      // Remove active status
      item.open = false;
      item.item.classList.remove('js-active');
      // Animate the details height to close it;
      item.height.animate(0);
      // After the accordion has closed, remove the details from the dom
      setTimeout(() => {
        try {
          item.details.parentNode.removeChild(item.details);
        } catch(err) {
          console.warn(err);
        }
      }, 300);
    }
  }

  closeAll() {
    this.items.forEach((item) => this.close(item));
  }

  open(item, index) {
    // Check the item is closed
    if (item.open === false) {
      // Determines where to append the details to
      if (item.item.nextElementSibling == null || item.item.nextElementSibling == undefined) {
        this.container.appendChild(item.details);
      }else {
        item.item.parentNode.insertBefore(item.details, lastInRow(this.elements, index).nextElementSibling);
      }

      // Set active status
      item.open = true;
      item.item.classList.add('js-active');

      // Reveal the details with an opening animation
      item.height.animate();

      // Scroll to the top of the item
      if (item.prev && offset(item.link).y != offset(item.prev.link).y) window.ScrollController.scrollTo(offset(item.prev.link).y + item.prev.link.offsetHeight, 400);
    }
  }
};

class AccordionGridItem {
  constructor(item) {
    this.item = item;
    this.link = this.item.querySelector('.js-accordion-grid--link') || false;
    this.details = this.item.querySelector('.js-accordion-grid--details') || false;
    this.height = null;
    this.open = false;

    if (this.details) {
      this.height = new ToggleHeight(this.details);
      this.details.parentNode.removeChild(this.details);
    };
  }
}

export default AccordionGrid;
