// If you are transpiling or using ES5 then you need to bundle native-shim for browsers with native Web components support.(https://github.com/webcomponents/custom-elements/blob/master/src/native-shim.js)
// ES5-style classes don't work with native Custom Elements because the HTMLElement constructor uses the value of new.target to look up the custom element definition for the currently called constructor. new.target is only set when new is called and is only propagated via super() calls. super() is not emulatable in ES5. The pattern of SuperClass.call(this)`` only works   when extending other ES5-style classes, and does not propagatenew.target`.
// Check the issue discussion https://github.com/webcomponents/custom-elements/issues/29

/**
 * @license
 * Copyright (c) 2016 The Polymer Project Authors. All rights reserved.
 * This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
 * The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
 * The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
 * Code distributed by Google as part of the polymer project is also
 * subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
 */

/**
 * This shim allows elements written in, or compiled to, ES5 to work on native
 * implementations of Custom Elements v1. It sets new.target to the value of
 * this.constructor so that the native HTMLElement constructor can access the
 * current under-construction element's definition.
 */
(function () {
  if (
    // No Reflect, no classes, no need for shim because native custom elements
    // require ES2015 classes or Reflect.
    window.Reflect === undefined ||
    window.customElements === undefined ||
    // The webcomponentsjs custom elements polyfill doesn't require
    // ES2015-compatible construction (`super()` or `Reflect.construct`).
    window.customElements.polyfillWrapFlushCallback
  ) {
    return;
  }
  const BuiltInHTMLElement = HTMLElement;
  /**
   * With jscompiler's RECOMMENDED_FLAGS the function name will be optimized away.
   * However, if we declare the function as a property on an object literal, and
   * use quotes for the property name, then closure will leave that much intact,
   * which is enough for the JS VM to correctly set Function.prototype.name.
   */
  const wrapperForTheName = {
    HTMLElement: /** @this {!Object} */ function HTMLElement() {
      return Reflect.construct(
        BuiltInHTMLElement,
        [],
        /** @type {!Function} */ (this.constructor)
      );
    },
  };
  window.HTMLElement = wrapperForTheName["HTMLElement"];
  HTMLElement.prototype = BuiltInHTMLElement.prototype;
  HTMLElement.prototype.constructor = HTMLElement;
  Object.setPrototypeOf(HTMLElement, BuiltInHTMLElement);
})();
