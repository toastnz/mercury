if (process.env.NODE_ENV !== 'production') {
    console.log("\n%c Mercury extended scripts", "color:#fff;font-size:12px; padding:0.45rem 0.75rem; margin: 0rem auto 1rem auto; font-family: Helvetica, sans-serif; border: 2px solid #0dd8d8; border-radius: 4px;font-weight: 100;background-size: cover;background-repeat: no-repeat;border: double 1px transparent;background-image: linear-gradient(#282828, #282828), radial-gradient(circle at top left, #2563EB, #82a0e2);background-origin: border-box;background-clip: padding-box, border-box;")
}

/*------------------------------------------------------------------ 
Import styles
------------------------------------------------------------------*/

import '../styles/extended.scss';

/*------------------------------------------------------------------ 
Import scripts
------------------------------------------------------------------*/

import { $, $$ } from '@/utilities/helpers';

/*------------------------------------------------------------------
Include any additional scripts here that may not be required on 
all pages - this will help your page speed score
------------------------------------------------------------------*/

document.addEventListener('DOMContentLoaded', () => {

});