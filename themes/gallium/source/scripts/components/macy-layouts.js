/*------------------------------------------------------------------
Import modules
------------------------------------------------------------------*/

import { nodeArray } from '@meteora-digital/helpers';

/*------------------------------------------------------------------
Requirements
------------------------------------------------------------------*/

const Macy = require('macy');

/*------------------------------------------------------------------
Initialise macy layouts
------------------------------------------------------------------*/

nodeArray(document.querySelectorAll('.js-macy')).forEach((group) => {
  group.Macy = Macy({
    container: group,
    columns: 1,
    trueOrder: true,
    mobileFirst: true,
    breakAt: {
      768: {
        columns: 2,
      },
      1024: {
        columns: 3,
      },
    },

  });
});