(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[1],{

/***/ "./themes/mercury/source/scripts/components/accordionBlock.js":
/*!********************************************************************!*\
  !*** ./themes/mercury/source/scripts/components/accordionBlock.js ***!
  \********************************************************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var jquery__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! jquery */ "./node_modules/jquery/dist/jquery.js");
/* harmony import */ var jquery__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(jquery__WEBPACK_IMPORTED_MODULE_0__);
/*------------------------------------------------------------------
Accordion block
------------------------------------------------------------------*/

/*------------------------------------------------------------------
Variables
------------------------------------------------------------------*/

var $body = jquery__WEBPACK_IMPORTED_MODULE_0___default()('body');
$body.on('click', '.js-accordion-trigger', function (e) {
  e.preventDefault();
  var $accordion = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).closest('.js-accordion-item');

  if ($accordion.hasClass('active')) {
    $accordion.removeClass('active');
    $accordion.find('.js-accordion-target').slideUp();
  } else {
    $accordion.addClass('active');
    $accordion.find('.js-accordion-target').slideDown();
  }
});

/***/ })

}]);
//# sourceMappingURL=1.js.map?id=