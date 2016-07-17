---
title: jQuery
---
## $() and $.()
differences between:

- jQuery Object methods
  - `$.fn` namespace
- core jQuery methods
  - jQuery namespace(utility method)

## $.(document).ready()
`$.(document).ready()` vs. `$(window).load()`

```js
// Shorthand for $( document ).ready()
$(function() {
    console.log( "ready!" );
});
```

## avoid conflicts
pay attention to whether jQuery library load before or after other libraries.

`var $j = jQuery.noConflict()`

```js
(function($) {
  // your jQuery code here
})(jQuery);
```

```js
jQuery(function($){
  // Your jQuery code here, using the $
});
```

## Attributes
`.attr()`

## Selecting Elements
ref: http://api.jquery.com/category/selectors/

The most basic concept of jQuery is to "select some elements and do something with them." 

Choosing selectors: Too much specificity can be a bad thing. 

`.length`

A selection only fetches the elements that are on the page at the time the selection is made.

filter:
- .has
- .not
- .filter
- .first
- eq

## Working with Selectors
getter(call on first element, except `.text()`) and setter(all the elements)

chaining: `.end()`
