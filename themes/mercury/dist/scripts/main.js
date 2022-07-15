/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./themes/mercury/source/scripts/lib.js":
/*!**********************************************!*\
  !*** ./themes/mercury/source/scripts/lib.js ***!
  \**********************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "$": () => (/* binding */ $),
/* harmony export */   "$$": () => (/* binding */ $$)
/* harmony export */ });
var $ = document.querySelector.bind(document);
var $$ = document.querySelectorAll.bind(document);

/***/ }),

/***/ "./themes/mercury/source/styles/style.scss":
/*!*************************************************!*\
  !*** ./themes/mercury/source/styles/style.scss ***!
  \*************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!**********************************************!*\
  !*** ./themes/mercury/source/scripts/app.js ***!
  \**********************************************/
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _styles_style_scss__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./../styles/style.scss */ "./themes/mercury/source/styles/style.scss");
/* harmony import */ var _lib__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./lib */ "./themes/mercury/source/scripts/lib.js");
/*------------------------------------------------------------------
Web Vitals
------------------------------------------------------------------*/
// import { getLCP, getFID, getCLS } from 'web-vitals';
// getCLS(console.log);
// getFID(console.log);
// getLCP(console.log);

/*------------------------------------------------------------------
Import styles
------------------------------------------------------------------*/


/*------------------------------------------------------------------
Import external
------------------------------------------------------------------*/

document.addEventListener('DOMContentLoaded', function () {
  /*------------------------------------------------------------------
  Post Load classname removal
  ------------------------------------------------------------------*/
  (0,_lib__WEBPACK_IMPORTED_MODULE_1__.$$)('.js-postload').forEach(function (element) {
    element.classList.remove('js-postload');
  });
  /*------------------------------------------------------------------
  Sticky header  
  ------------------------------------------------------------------*/

  var previousScrollPosition = 0;
  var scrollDelta = 5;
  var header = (0,_lib__WEBPACK_IMPORTED_MODULE_1__.$)('.header');
  var headerHeight = header ? header.clientHeight / 3 : 0;

  var stickyHeader = function stickyHeader() {
    var st = window.scrollY;
    if (Math.abs(previousScrollPosition - st) <= scrollDelta) return;

    if (st === 0) {
      header.classList.remove('nav-down');
      header.classList.remove('nav-up');
    } else if (st > previousScrollPosition && st > headerHeight) {
      header.classList.remove('nav-down');
      header.classList.add('nav-up');
    } else {
      if (st + window.innerHeight < document.body.clientHeight) {
        header.classList.add('nav-down');
        header.classList.remove('nav-up');
      }
    }

    previousScrollPosition = st;
  };

  window.addEventListener('scroll', stickyHeader);
});
})();

/******/ })()
;
//# sourceMappingURL=main.js.map