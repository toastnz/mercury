/*------------------------------------------------------------------
Import modules
------------------------------------------------------------------*/

import { tns } from "tiny-slider/src/tiny-slider";
import { each } from 'meteora';

/*------------------------------------------------------------------
Sliders
------------------------------------------------------------------*/

each('.js-slider', (slider) => {
  const controller = tns({
    container: slider,
    nav: false,
  });
});