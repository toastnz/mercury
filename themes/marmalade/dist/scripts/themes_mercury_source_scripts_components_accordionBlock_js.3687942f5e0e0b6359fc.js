(self["webpackChunkmercury"] = self["webpackChunkmercury"] || []).push([["themes_mercury_source_scripts_components_accordionBlock_js"],{

/***/ "./themes/mercury/source/scripts/components/accordionBlock.js":
/*!********************************************************************!*\
  !*** ./themes/mercury/source/scripts/components/accordionBlock.js ***!
  \********************************************************************/
/***/ (() => {

function _toConsumableArray(arr) { return _arrayWithoutHoles(arr) || _iterableToArray(arr) || _unsupportedIterableToArray(arr) || _nonIterableSpread(); }

function _nonIterableSpread() { throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _iterableToArray(iter) { if (typeof Symbol !== "undefined" && iter[Symbol.iterator] != null || iter["@@iterator"] != null) return Array.from(iter); }

function _arrayWithoutHoles(arr) { if (Array.isArray(arr)) return _arrayLikeToArray(arr); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

/*------------------------------------------------------------------
Helpers
------------------------------------------------------------------*/
var query = document.querySelector.bind(document);
var queryAll = document.querySelectorAll.bind(document);
/*------------------------------------------------------------------
Variables
------------------------------------------------------------------*/

var slideUp = function slideUp(container) {
  container.style.height = "0px";
  container.addEventListener('transitionend', function () {
    container.classList.remove('active');
  }, {
    once: true
  });
};

var slideDown = function slideDown(container) {
  container.classList.add('active');
  container.style.height = 'auto';
  var height = container.clientHeight + 'px';
  container.style.height = '0px';
  setTimeout(function () {
    return container.style.height = height;
  }, 0);
};

_toConsumableArray(queryAll('.js-accordion-trigger')).forEach(function (accordionTrigger) {
  accordionTrigger.addEventListener('click', function (e) {
    e.preventDefault();
    accordion = accordionTrigger.closest('.js-accordion-item');

    if (accordion.classList.contains('active')) {
      accordion.classList.remove('active');
      slideUp(accordion.querySelector('.js-accordion-target'));
    } else {
      accordion.classList.add('active');
      slideDown(accordion.querySelector('.js-accordion-target'));
    }
  });
});

/***/ })

}]);
//# sourceMappingURL=themes_mercury_source_scripts_components_accordionBlock_js.3687942f5e0e0b6359fc.js.map?id=[query]