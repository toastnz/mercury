import { attach } from 'meteora';
import GoogleMaps from '@meteora-digital/google-maps';

const API = document.body.getAttribute('data-maps-api-key') || '';

// Make sure all our content is loaded
window.addEventListener('DOMContentLoaded', (event) => {
  // Each Google Maps Block pushs a new map to the window.maps array
  if (window.maps !== undefined) {
    // Add the API key to the Load function;
    GoogleMaps.Load(API);

    GoogleMaps.Render(() => {
      window.maps.forEach((location) => {
        const block = new GoogleMaps.Controller(document.getElementById(location.id), {
          locations: [location],
          map: {
            zoom: 12
          },
          icon: {
            fillColor: '#d93f41'
          }
        });

        attach(window, 'resize', () => block.map.panTo(location.position), 500);

        block.infoTemplate((location) => {
          return `
            <div class="gm-info">
              <h4 class="gm-info__title">${location.title}</h4>
              <ul class="gm-info__details unstyled">
              ${(location.info) ? `<li class="gm-info__details__item">${location.info}</li>` : ''}
            </ul>
          </div>`;
        });
      });
    });
  };
});
