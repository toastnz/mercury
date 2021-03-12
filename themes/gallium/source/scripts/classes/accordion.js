import { nodeArray } from '@meteora-digital/helpers';
import ToggleHeight from './toggle-height';

class Accordion {
  constructor(el) {
    this.container = el;
    this.items = nodeArray(this.container.querySelectorAll('.js-accordion--item'));

    this.items.forEach((item) => {
      item.Accordion = {
        trigger: item.querySelector('.js-accordion--trigger'),
        target: item.querySelector('.js-accordion--target'),
      };
    });

    this.items.forEach((item) => {
      item.control = new ToggleHeight(item.Accordion.target);

      if (item.classList.contains('js-active')) {
        item.control.animate('auto');
      }

      item.Accordion.trigger.addEventListener('click', (e) => {
        e.preventDefault();

        this.items.forEach((child) => {
          if (child === item && child.classList.contains('js-active') || child !== item) {
            child.classList.remove('js-active');
            child.control.animate(0);
          } else {
            child.classList.add('js-active');
            child.control.animate('auto');
          }
        });
      });
    });
  }
}

export default Accordion;