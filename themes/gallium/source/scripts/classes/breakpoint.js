import { attach, nodeArray } from 'meteora';

class Breakpoint {
  constructor(el) {
    this.container = el;
    this.breakpoint = {};
    this.children = this.getChildren();

    if (this.container.getAttribute('data-breakpoint') !== '') {
      setTimeout(() => this.init(), 5);
    } else {
      console.warn('Please add a classname to the data-breakpoint attribute');
    }
  }

  toggleClass() {
  	for (let key in this.breakpoint) {
      (this.container.offsetWidth >= this.breakpoint[key]) ? this.container.classList.remove(`js-breakpoint-${key}`) : this.container.classList.add(`js-breakpoint-${key}`);
  	}
  }

  getChildren() {
    let childHolder = {};
    let allChildren = nodeArray(this.container.querySelectorAll('[data-breakpoint-watch]'));
    let targetArray = this.container.getAttribute('data-breakpoint').split(',');

    targetArray.forEach((id) => {
      this.breakpoint[id] = 250;
      childHolder[id] = [];
      allChildren.forEach((child) => {
        if (this.testChild(child, id)) childHolder[id].push(child);
      });
    });
    return childHolder;
  }

  testChild(child, id) {
    return (child.getAttribute('data-breakpoint-watch')).indexOf(id) > -1;
  }

  init() {
    // Create the breakpoint
    for (let key in this.children) {
      nodeArray(this.children[key]).forEach((child) => {
        this.breakpoint[key] += child.offsetWidth;
        this.breakpoint[key] += parseInt(window.getComputedStyle(child).marginLeft);
        this.breakpoint[key] += parseInt(window.getComputedStyle(child).marginRight);
      });
    }

    this.container.classList.add('js-breakpoint');

    // Init functions
    attach(window, 'resize', () => this.toggleClass(), 100);
  }
}

export default Breakpoint;
