import Template from '@meteora-digital/template';

export default class Uploader {
  constructor(field) {
    this.field = field;
    this.faux = new Template([
      {
        tagName: 'div',
        classList: 'faux-upload',
        innerHTML: 'Upload file'
      }
    ]);

    this.field.parentNode.appendChild(this.faux.html, this.field);

    this.field.addEventListener('change', (e) => {
      this.faux.html.innerHTML = this.field.value.replace(/^.*\\/, "");
      this.faux.html.classList.add('js-active');
    });
  }
}
