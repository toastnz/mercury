/*------------------------------------------------------------------
This class can be used to make ajax filtering relatively easy
------------------------------------------------------------------*/

/*------------------------------------------------------------------
Import External Modules
------------------------------------------------------------------*/

import { ajax, nodeArray, objectAssign, loopObject, containsClass } from 'meteora';

/*------------------------------------------------------------------
Import Internal Modules
------------------------------------------------------------------*/

import getParam from '../functions/get-param';

/*------------------------------------------------------------------
Filters
------------------------------------------------------------------*/

export default class Filters {
  constructor(container, options = {}) {
    this.section = container;
    this.url = this.section.getAttribute('data-api-url');
    this.timeout = null;
    this.filters = {};
    this.api = {};

    this.settings = objectAssign({
      class: 'js-filter',
      prettyURL: true,
      success: false,
    }, options);

    this.parameters = nodeArray(this.section.querySelectorAll(`.${this.settings.class}--parameter`));
    this.content = this.section.querySelector(`.${this.settings.class}--content`);

    // This loop will grab all the filters we have, and their names, and organise an object for us to use later
    this.parameters.forEach((parameter) => {
      this.filters[parameter.getAttribute('data-filter-name')] = {
        type: parameter.getAttribute('data-filter-type') || false,
        value: [],
        controllers: {
          links: nodeArray(parameter.querySelectorAll(`.${this.settings.class}--link`)),
          selects: nodeArray(parameter.querySelectorAll(`.${this.settings.class}--select`)),
          queries: nodeArray(parameter.querySelectorAll(`.${this.settings.class}--query`)),
        }
      }
    });

    loopObject(this.filters, (name, settings) => {
      // Grab the current page loaded filters
      try {
        settings.value = getParam(name).split(',');
      }catch(err) {
        settings.value = [];
      }

      settings.controllers.links.forEach((link) => {
        link.addEventListener('click', (e) => {
          e.preventDefault();

          // Reset the filter value
          settings.value = [];

          // If we allow for multiple values
          if (settings.type === 'multiple') {

            // Disabling the filter
            if (containsClass(link, `${this.settings.class}--active`)) {
              link.classList.remove(`${this.settings.class}--active`);
              link.blur();
            }
            // Enabling the filter
            else {
              link.classList.add(`${this.settings.class}--active`);
            }
          }
          // If it is only a single value
          else {
            settings.controllers.links.forEach((l) => {
              // Disabling the filter
              if (link !== l) {
                l.classList.remove(`${this.settings.class}--active`);
              // Enabling the filter
              } else {
                l.classList.add(`${this.settings.class}--active`);
              }
            });
          }

          // Get all the active filters
          settings.controllers.links.forEach((l) => {
            if (containsClass(l, `${this.settings.class}--active`)) settings.value.push(l.getAttribute('data-value'));
          });

          this.applyFilter();
        })
      });

      settings.controllers.selects.forEach((select) => {

        select.addEventListener('change', (e) => {
          e.preventDefault();
          settings.value = [];

          // If we allow for multiple values
          if (settings.type === 'multiple') {
            // Get all the active filters
            for (var i = 0; i < select.selectedOptions.length; i++) {
              settings.value.push(select.selectedOptions[i].value);
            }
          } else {
            // Get all the active filters
            settings.value.push(select.value);
          }

          this.applyFilter();
        });
      });

      settings.controllers.queries.forEach((query) => {
        query.addEventListener('keyup', (e) => {
          settings.value = [];
          settings.value.push(query.value);
          // Only apply the filter with a minimum search length or by pressing enter
          if (e.keyCode == '13') this.applyFilter();
        });
      })
    });
  }

  applyFilter() {
    clearTimeout(this.timeout);


    // Indicates the page is about to load
    this.content.classList.add(`${this.settings.class}--waiting`);

    // Throttle the requests
    this.timeout = setTimeout(() => {
      // update our API parameters
      this.updateAPI();

      // Ajax in the results
      ajax({
        url: this.api.url,
        success: (response) => {
          // grab the response
          this.response = response;

          // update the page url
          this.updateURL((this.settings.prettyURL) ? this.api.segmentURL : this.api.url);

          // Add the loading class
          this.content.classList.add(`${this.settings.class}--loading`);

          // Wait for the transition of the class
          setTimeout(() => {
            // call the user callback function
            if (this.settings.success && typeof this.settings.success === 'function') this.settings.success(this.response);

            // Indicates the page has loaded
            setTimeout(() => {
              this.content.classList.remove(`${this.settings.class}--waiting`);
              this.content.classList.remove(`${this.settings.class}--loading`);
            }, 500);
          }, 300);
        }
      });
    }, 500);
  }

  clearFilter() {
    // loop through all filters and empty the value array
    loopObject(this.filters, (name, settings) => settings.value = []);

    // Apply the filter;
    this.applyFitler();
  }

  updateAPI() {
    this.api.index = (this.url.indexOf('?') >= 0) ? 1 : 0;
    this.api.prefix = '?';
    this.api.url = this.url;
    this.api.segmentURL = window.location.origin + window.location.pathname;

    // Generate the URL based on the current filters
    loopObject(this.filters, (name, settings) => {
      this.api.prefix = (this.api.index === 0) ? '?' : '&';

      if (settings.value.length) {
        this.api.url += `${this.api.prefix + name}=${settings.value.join(',')}`;
        this.api.segmentURL += `${this.api.prefix + name}=${settings.value.join(',')}`;
        this.api.index += 1;
      };
    });

    return this.api;
  }

  updateURL(url) {
    window.history.replaceState({}, "filters", url);
  }
}
