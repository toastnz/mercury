"use strict";
(self["webpackChunkmercury"] = self["webpackChunkmercury"] || []).push([["themes_mercury_source_scripts_components_accordion_js"],{

/***/ "./themes/mercury/source/scripts/components/accordion.js":
/*!***************************************************************!*\
  !*** ./themes/mercury/source/scripts/components/accordion.js ***!
  \***************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   Accordion: () => (/* binding */ Accordion)
/* harmony export */ });
function _typeof(o) { "@babel/helpers - typeof"; return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, _typeof(o); }
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }
function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, _toPropertyKey(descriptor.key), descriptor); } }
function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }
function _toPropertyKey(arg) { var key = _toPrimitive(arg, "string"); return _typeof(key) === "symbol" ? key : String(key); }
function _toPrimitive(input, hint) { if (_typeof(input) !== "object" || input === null) return input; var prim = input[Symbol.toPrimitive]; if (prim !== undefined) { var res = prim.call(input, hint || "default"); if (_typeof(res) !== "object") return res; throw new TypeError("@@toPrimitive must return a primitive value."); } return (hint === "string" ? String : Number)(input); }
var Accordion = /*#__PURE__*/function () {
  /**
   * 
   * Constructor
   * 
   * @param {element} element accordion parent
   */
  function Accordion(element) {
    _classCallCheck(this, Accordion);
    this.accordion = element;
    this.trigger = this.accordion.querySelector('.js-trigger');
    this.content = this.accordion.querySelector('.js-content');

    // Initialise the accordion
    this.init();
  }

  /**
   * 
   * Initialise the accordion item
   * 
   */
  _createClass(Accordion, [{
    key: "init",
    value: function init() {
      this.getState();
      this.addEventListeners();
    }

    /**
     * 
     * Get the current state of the accordion
     * 
     */
  }, {
    key: "getState",
    value: function getState() {
      this.is_open = this.accordion.classList.contains('active');
    }

    /**
    * 
    * Toggle the current state of the accordion
    * 
    */
  }, {
    key: "toggle",
    value: function toggle() {
      this.is_open ? this.close() : this.open();
    }

    /**
     * 
     * Add the click event handler to the accordion
     * 
     */
  }, {
    key: "addEventListeners",
    value: function addEventListeners() {
      var _this = this;
      this.accordion.addEventListener('click', function () {
        return _this.toggle();
      });
    }

    /**
     * 
     * Add the click event handler to the accordion
     * 
     */
  }, {
    key: "updateState",
    value: function updateState(state) {
      // Update the current state
      this.is_open = state;

      // Update the aria-expanded attribute
      this.trigger.setAttribute('aria-expanded', state);
    }

    /**
     * 
     * Open the accordion
     * 
     */
  }, {
    key: "open",
    value: function open() {
      var _this2 = this;
      // Add active class to the accordion
      this.accordion.classList.add('active');

      // Quickly get the height we want to animate to
      this.content.style.height = 'auto';
      var height = this.content.clientHeight + 'px';

      // Revert the heioght back to nothing
      this.content.style.height = 0;

      // Animate the height once the calculations are done
      setTimeout(function () {
        return _this2.content.style.height = height;
      }, 0);

      // Update the current state
      this.updateState(true);
    }

    /**
     * 
     * Close the accordion
     * 
     */
  }, {
    key: "close",
    value: function close() {
      var _this3 = this;
      // Revert the height back to nothing
      this.content.style.height = 0;

      // Remove the active class once animations are over
      this.content.addEventListener('transitionend', function () {
        _this3.accordion.classList.remove('active');
      }, {
        once: true
      });

      // Update the current state
      this.updateState(false);
    }
  }]);
  return Accordion;
}();

/***/ })

}]);
//# sourceMappingURL=themes_mercury_source_scripts_components_accordion_js.js.map