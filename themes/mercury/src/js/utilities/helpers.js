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



/**
 * Creates a throttled function that only invokes the provided callback at most once per every `limit` milliseconds.
 *
 * @param {Function} callback - The function to throttle.
 * @param {number} limit - The number of milliseconds to throttle invocations to.
 * @returns {Function} - Returns the new throttled function.
 */
export const throttle = (callback, limit) => {
    let wait = false;
    return (...args) => {
        if (!wait) {
            callback(...args);
            wait = true;
            setTimeout(() => (wait = false), limit);
        }
    };
};



/**
 * Creates a debounced function that delays invoking the provided callback until after the specified delay.
 *
 * @param {Function} callback - The function to debounce.
 * @param {number} delay - The number of milliseconds to delay.
 * @returns {Function} - Returns the new debounced function.
 */
export const debounce = (callback, delay) => {
    let timeout;
    return (...args) => {
        clearTimeout(timeout);
        timeout = setTimeout(() => callback(...args), delay);
    };
}
