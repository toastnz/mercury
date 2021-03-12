import { nodeArray } from '@meteora-digital/helpers';

function each(selector, func) {
  const array = nodeArray(document.querySelectorAll(selector));
  if (func && typeof func === 'function') array.forEach((el,i) => func(el,i));
  return array;
}

export default each;
