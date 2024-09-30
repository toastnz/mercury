/**
 * A shorthand function for `document.querySelector`.
 * 
 * This function allows you to select the first element within the document
 * that matches the specified selector or group of selectors.
 * 
 * Example usage:
 * 
 * ```javascript
 * const element = $('.my-class');
 * ```
 * 
 * @param {string} selector - A string containing one or more CSS selectors separated by commas.
 * @returns {Element|null} The first element within the document that matches the specified selector(s), or null if no matches are found.
 */
export const $ = document.querySelector.bind(document);


/**
 * A utility function that selects all elements in the document that match a specified CSS selector.
 * This is a shorthand for `document.querySelectorAll`.
 * 
 * Example usage:
 * 
 * ```javascript
 * const elements = $$('.my-class');
 * ```
 * 
 * @param {string} selector - A string containing one or more CSS selectors to match.
 * @returns {NodeList} A non-live NodeList of all elements in the document that match the specified group of selectors.
 */
export const $$ = document.querySelectorAll.bind(document);