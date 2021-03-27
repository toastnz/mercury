import { offset } from 'meteora';

function lastInRow(array, i) {
  let top = offset(array[i]).y;
  let elements = array.slice(i);
  let last = array[i];

  for (var i = 0; i < elements.length; i++) {
    if (offset(elements[i]).y > top) {
      break;
    }else {
      last = elements[i];
    }
  }

  return last;
}

export default lastInRow;