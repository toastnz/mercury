import { Event } from 'meteora';

export default class ScrollLocker {
  constructor(el) {
    this.body = document.querySelector('html');
    this.el = el;
    this.y = 0;
  }

  lock() {
    this.y = window.pageYOffset;

    this.el.style.height = window.innerHeight + 'px';
    this.el.style.overflow = 'hidden';
    this.el.scrollTop = this.y;
    window.dispatchEvent(new Event('resize'));
  }

  unlock() {
    this.el.style.height = 'auto';
    this.el.style.overflow = 'visible';
    this.body.scrollTop = this.y;
    window.dispatchEvent(new Event('resize'));
  }
}