// /*------------------------------------------------------------------
// Sticky header
// ------------------------------------------------------------------*/

import { nodeArray, serialize } from 'meteora';

export default class FormValidation {
  constructor(form) {
    // If no form cancel here.
    if (!form) return false;

    // grab the form
    this.form = form;
    this.valid = false;

    let inputs = nodeArray(this.form.querySelectorAll('input, textarea'));

    // Grab all our fields
    this.fields = {
      inputs: inputs.filter((item) => item.type !== 'submit' && item.type !== 'hidden'),
      selects: nodeArray(this.form.querySelectorAll('select')),
    };

    // Here we declear our tests.
    this.test = {
      text: (field) => {
        return (field.value.length >= 1 && field.required || !field.required);
        // this.validate(field, (field.value.length >= 1), field.required);
      },
      email: (field) => {
        const pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;

        let valid = true;

        if (field.required && field.value.length === 0) {
          valid = false;
        }else if (field.value.length >= 1) {
          valid = (pattern.test(field.value));
        }

        return valid;
        // this.validate(field, pattern.test(field.value), field.required);
      },
      option: (field) => {
        let valid = true;
        if (field.required && field.checked === false) valid = false;
        return valid;
        // this.validate(field, valid, field.required);
      },
      select: (field) => {
        let valid = false;

        if (field.required) {
          let options = nodeArray(field.querySelectorAll('option'));
          for (let i = 0; i < options.length; i++) {
            if (options[i].selected && options[i].value !== '') {
              valid = true;
              break;
            }
          }
        }else {
          valid = true;
        }

        return valid;
      }
    }

    // Loop our regular inputs and apply the tests depending on the input.type
    this.fields.inputs.forEach((field) => {
      if (field.type === 'checkbox' || field.type === 'radio') {
        field.addEventListener('change', () => this.validate(field, this.test.option(field)));
      }else {
        field.addEventListener('blur', () => {
          switch(field.type) {
            case 'email':
              this.validate(field, this.test.email(field));
              break;
            case 'number':
              this.validate(field, this.test.text(field));
              break;
            default:
              this.validate(field, this.test.text(field));
          }
        });

        field.addEventListener('focus', () => this.validate(field, true));
      }
    });

    // Loop our selects and apply the select test
    this.fields.selects.forEach((field) => {
      field.addEventListener('change', () => {
        this.validate(field, this.test.select(field));
      });
    });

    // Add in an element where we can display our validation messages
    for (let key in this.fields)  {
      this.fields[key].forEach((field) => {
        let p = document.createElement('p');
        p.classList.add('js-form-message');
        p.addEventListener('click', () => field.focus());

        if (field.type !== 'submit') {
          field.parentNode.appendChild(p);
        }
      });
    }
  }

  validate(field, valid = false) {
    let message = field.parentNode.querySelector('.js-form-message');

    if (valid) {
      // message.innerHTML = '';
      message.classList.remove('error');
      field.classList.remove('error');
    }else {
      message.innerHTML = this.message(field);
      message.classList.add('error');
      field.classList.add('error');
    }
  }

  message(field) {
    let name = field.name.replace(/([A-Z]+)/g, ' $1').replace(/^ /, '');
    let label = field.parentNode.parentNode.querySelector('label');
    let message = (label !== null) ? label.innerHTML : name;

    if (field.type === 'email') {
      if (field.required) {
        message += (field.value.length) ? ' is not valid' : ' is required';
      }else {
        message += ' is not valid';
      }
    }else {
      message += ' is required';
    }

    return message;
  }

  submit(func) {
    this.valid = true;

    // ====================================================
    // Create validation messages
    // ====================================================

    // Loop our regular inputs and apply the tests depending on the input.type
    this.fields.inputs.forEach((field) => {
      switch(field.type) {
        case 'checkbox':
          this.validate(field, this.test.option(field));
          break;
        case 'radio':
          this.validate(field, this.test.option(field));
          break;
        case 'email':
          this.validate(field, this.test.email(field));
          break;
        default:
          this.validate(field, this.test.text(field));
      }
    });

    // Loop our selects and apply the select test
    this.fields.selects.forEach((field) => {
      // field.required = true;
      this.validate(field, this.test.select(field));
    });

    // ====================================================
    // Check if the form is valid
    // ====================================================

    for (let i = 0; i < this.fields.inputs.length; i++) {
      switch(this.fields.inputs[i].type) {
        case 'checkbox':
          this.valid = this.test.option(this.fields.inputs[i]);
          break;
        case 'radio':
          this.valid = this.test.option(this.fields.inputs[i]);
          break;
        case 'email':
          this.valid = this.test.email(this.fields.inputs[i]);
          break;
        default:
          this.valid = this.test.text(this.fields.inputs[i]);
      };

      if (this.valid === false) {
        break;
      }
    }

    if (this.valid) {
      for (let i = 0; i < this.fields.selects.length; i++) {
        this.valid = this.test.select(this.fields.selects[i]);

        if (this.valid === false) {
          break;
        }
      }
    }

    if (this.valid) submit({
      url: this.form.action,
      data: serialize(this.form),
      success: (e) => {
        this.form.reset();
        func(e);
      },
    });
  }
}
