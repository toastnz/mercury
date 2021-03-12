const closest = (el, selector) => {
  let element = el;
  let closest = el.parentNode.querySelector(selector);

  while (closest == null || closest == undefined) {
    element = element.parentNode;
    closest = element.parentNode.querySelector(selector);
  }

  return closest;
}

export default class PlaceholderLabels {
  constructor(form, options = {}) {
    this.form = form;
    this.inputTypes = options.inputTypes || ['text', 'email', 'number', 'file'];

    this.inputTypes.forEach((type) => {
      let typeOfInput = this.form.querySelectorAll(`input[type="${type}"]`);
      for (var i = 0; i < typeOfInput.length; i++) {
        let label = closest(typeOfInput[i], 'label');
        if (label !== null) {
          label.style.display = 'none';
          if (typeOfInput[i].getAttribute('placeholder') == undefined) typeOfInput[i].setAttribute('placeholder', label.innerHTML);
        }
      }
    });
  }
}