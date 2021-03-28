import { each } from 'meteora';
import Filters from '@meteora-digital/filters';

// filters
each('.js-filter', (group) => {
  const filter = new Filters();
  const selects = nodeArray(group.querySelectorAll('.js-filter--select'));

  // For each select
  selects.forEach((select) => {
    // Grab the parameter
    const parameter = select.getAttribute('data-parameter');
    // Add an event listener for when it changes
    select.addEventListener('change', () => {
      // Add a filter object with the parameter: value
      filter.add({
        parameter: parameter,
        value:  select.value,
      });
    });
  });
});