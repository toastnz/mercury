/*------------------------------------------------------------------
Import modules
------------------------------------------------------------------*/

import Template from '@meteora-digital/template';
import { objectAssign, relativeTarget } from 'meteora';

/*------------------------------------------------------------------
Modal Class
------------------------------------------------------------------*/

export default class Modal {
	constructor(content = false, options = {}) {
		this.modal = {};
		this.content = content;
		this.settings = objectAssign({
			class: 'modal',
		}, options);

		// Create our modal template
		this.template = new Template([
			{
				tagName: 'div',
				classList: this.settings.class,
				innerHTML: [
					{
						tagName: 'div',
						classList: `${this.settings.class}__wrapper`,
						innerHTML: [
							{
								tagName: 'div',
								classList: `${this.settings.class}__content`,
							}
						]
					}
				]
			}
		]);

		// initialise the modal object
		this.modal.container = this.template.html;
		this.modal.wrapper = this.modal.container.querySelector(`.${this.settings.class}__wrapper`);
		this.modal.content = this.modal.container.querySelector(`.${this.settings.class}__content`);

		// if there is content, add it to the modal
		if (this.content) this.modal.content.innerHTML = this.content;

		// Make sure the modal is hidden by default;
		this.modal.container.display = 'none';

		// Close the modal if we click away from it
		this.modal.container.addEventListener('click', (e) => {
			if (relativeTarget(this.modal.content) != e.target) this.close();
		});
	}

	open() {
		// Append the modal when opened;
		document.body.appendChild(this.modal.container);

		// Display the modal
		this.modal.container.style.display = 'block';

		setTimeout(() => {
			// Add our active class
			this.modal.container.classList.add(`${this.settings.class}--active`);
		}, 50);
	}

	close() {
		// Remove our active class
		this.modal.container.classList.remove(`${this.settings.class}--active`);

		setTimeout(() => {
			// Remove the modal
			this.modal.container.remove();
		}, 300);
	}
}