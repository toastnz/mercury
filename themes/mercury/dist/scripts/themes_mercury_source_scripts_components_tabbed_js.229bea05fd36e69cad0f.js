(self["webpackChunkmercury"] = self["webpackChunkmercury"] || []).push([["themes_mercury_source_scripts_components_tabbed_js"],{

/***/ "./themes/mercury/source/scripts/components/tabbed.js":
/*!************************************************************!*\
  !*** ./themes/mercury/source/scripts/components/tabbed.js ***!
  \************************************************************/
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
Tabbed Content
------------------------------------------------------------------*/

var updateTabbedContent = function updateTabbedContent(indicator, currentTab) {
  currentTab.classList.add('active');
  var rect = currentTab.getBoundingClientRect();
  indicator.style.height = "".concat(rect.height, "px");
  indicator.style.top = "".concat(currentTab.offsetTop, "px");
};

_toConsumableArray(queryAll('.js-tabs')).forEach(function (tabbedContent) {
  var indicator = tabbedContent.querySelector('.js-tabbed-indicator');
  var currentTab = tabbedContent.querySelector('.js-tabs-link.active');

  _toConsumableArray(queryAll('.js-tabs-link', tabbedContent)).forEach(function (tabbedContentLink) {
    tabbedContentLink.addEventListener('click', function (e) {
      e.preventDefault();
      currentTab.classList.remove('active');
      currentTab = tabbedContentLink;
      updateTabbedContent(indicator, currentTab);
    });
  });

  updateTabbedContent(indicator, currentTab);
});

/***/ })

}]);
//# sourceMappingURL=themes_mercury_source_scripts_components_tabbed_js.229bea05fd36e69cad0f.js.map?id=[query]