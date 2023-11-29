"use strict";
/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
(self["webpackChunkmercury"] = self["webpackChunkmercury"] || []).push([["themes_mercury_source_scripts_components_accordion_js"],{

/***/ "./themes/mercury/source/scripts/components/accordion.js":
/*!***************************************************************!*\
  !*** ./themes/mercury/source/scripts/components/accordion.js ***!
  \***************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   Accordion: () => (/* binding */ Accordion)\n/* harmony export */ });\nclass Accordion {\n\n    /**\n     * \n     * Constructor\n     * \n     * @param {element} element accordion parent\n     */\n    constructor(element) {\n\n        this.accordion = element;\n        this.trigger = this.accordion.querySelector('.js-trigger');\n        this.content = this.accordion.querySelector('.js-content');\n\n        // Initialise the accordion\n        this.init();\n    }\n\n\n    /**\n     * \n     * Initialise the accordion item\n     * \n     */\n    init() {\n\n        // Get the initial state of the accordion\n        this.getState();\n\n        // Add the click event handler to the accordion\n        this.addEventListeners();\n    }\n\n\n    /**\n     * \n     * Get the current state of the accordion\n     * \n     */\n    getState() {\n        this.is_open = this.accordion.classList.contains('active');\n    }\n\n\n    /**\n    * \n    * Toggle the current state of the accordion\n    * \n    */\n    toggle() {\n        (this.is_open) ? this.close() : this.open();\n    }\n\n    /**\n     * \n     * Add the click event handler to the accordion\n     * \n     */\n    addEventListeners() {\n        this.accordion.addEventListener('click', () => this.toggle());\n    }\n\n\n    /**\n     * \n     * Add the click event handler to the accordion\n     * \n     */\n    updateState(state) {\n\n        // Update the current state\n        this.is_open = state;\n\n        // Update the aria-expanded attribute\n        this.trigger.setAttribute('aria-expanded', state);\n\n    }\n\n\n    /**\n     * \n     * Open the accordion\n     * \n     */\n    open() {\n\n        // Add active class to the accordion\n        this.accordion.classList.add('active');\n\n        // Quickly get the height we want to animate to\n        this.content.style.height = 'auto';\n        var height = this.content.clientHeight + 'px';\n\n        // Revert the heioght back to nothing\n        this.content.style.height = 0;\n\n        // Animate the height once the calculations are done\n        setTimeout(() => this.content.style.height = height, 0);\n\n        // Update the current state\n        this.updateState(true);\n\n    }\n\n    /**\n     * \n     * Close the accordion\n     * \n     */\n    close() {\n\n        // Revert the height back to nothing\n        this.content.style.height = 0;\n\n        // Remove the active class once animations are over\n        this.content.addEventListener('transitionend', () => {\n            this.accordion.classList.remove('active');\n        }, { once: true });\n\n        // Update the current state\n        this.updateState(false);\n\n    }\n}\n\n\n\n//# sourceURL=webpack://mercury/./themes/mercury/source/scripts/components/accordion.js?");

/***/ })

}]);