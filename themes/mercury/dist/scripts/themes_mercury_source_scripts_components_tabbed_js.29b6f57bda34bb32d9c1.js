"use strict";
(self["webpackChunkmercury"] = self["webpackChunkmercury"] || []).push([["themes_mercury_source_scripts_components_tabbed_js"],{

/***/ "./themes/mercury/source/scripts/components/tabbed.js":
/*!************************************************************!*\
  !*** ./themes/mercury/source/scripts/components/tabbed.js ***!
  \************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony import */ var jquery__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! jquery */ "./node_modules/jquery/dist/jquery.js");
/* harmony import */ var jquery__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(jquery__WEBPACK_IMPORTED_MODULE_0__);
/*------------------------------------------------------------------
Import external
------------------------------------------------------------------*/

/*------------------------------------------------------------------
Menu toggle
------------------------------------------------------------------*/

var $body = jquery__WEBPACK_IMPORTED_MODULE_0___default()('body');
/*------------------------------------------------------------------
Tabbed Content
------------------------------------------------------------------*/

/**
 * updateIndicator
*/

var updateIndicator = function updateIndicator($tab, $indicator) {
  var position = $tab.position();
  $indicator.css({
    top: position.top,
    height: $tab.outerHeight()
  });
};
/**
 * updateTabs
*/


var updateTabs = function updateTabs($block, $currentTab) {
  $block.find('.js-tabs-link,.js-tabs-item').removeClass('active');
  $currentTab.addClass('active');
  $block.find('.js-tabs-item').eq($currentTab.index() - 1).addClass('active');
};

document.addEventListener('DOMContentLoaded', function () {
  jquery__WEBPACK_IMPORTED_MODULE_0___default()('.js-tabs').each(function (index, element) {
    var $this = jquery__WEBPACK_IMPORTED_MODULE_0___default()(element);
    var $indicator = $this.find('.js-tabbed-indicator');
    var $currentTab = $this.find('.js-tabs-link.active');
    updateIndicator($currentTab, $indicator);
    $this.on('click', '.js-tabs-link', function (e) {
      e.preventDefault();
      var $tab = jquery__WEBPACK_IMPORTED_MODULE_0___default()(e.currentTarget);
      $currentTab = $tab;
      updateIndicator($currentTab, $indicator);
      updateTabs($this, $currentTab);
    });
    window.addEventListener('resize', updateIndicator($currentTab, $indicator));
  });
});

/***/ })

}]);
//# sourceMappingURL=themes_mercury_source_scripts_components_tabbed_js.29b6f57bda34bb32d9c1.js.map?id=[query]