---
title: JavaScript
---

A callback is a function that is passed as an argument to another function and is executed after its parent function has completed. 

# Libraries
- [[jQuery]]
- Vue.js
- D3.js

JS 实现: ECMAScript + DOM + BOM

# APIs
confirm()
prompt("STRING")
`===`
substring() [a,b)

# identifier
    ^[A-Za-z_$][A-Za-z0-9_$]*

# Types
- Undefined
- Null
- Boolean
- Number
- String
- Object

# for
label
```js
start: for (var propName in window) {
    document.write(propName);
}
```

# switch
```js
switch (expression) {
    case value: statement
    break;
    case value: statement
    break;
    case value: statement
    break;
    case value: statement
    break;
    default: statement}
```

# function
## Arguments
- 不限参数：`arguments`
- 参数(单向)同步：`arguments[0] => name1`, `name1 !=> arguments[0]`
- no `name2`, no `arguments[2]`, value = `undefined`

没有重载


# Variable and scope
只能为引用对象添加属性(因为它才是「字典」)

# Object
an object is a hash.

- object literals
- property attribute
    + `Object.defineProperty` or `Object.defineProperties`
    - data property
        + configurable
        + enumerable
        + writable
        + value
    - accessor property
        + configurable
        + enumerable
        + get
        + set
    + `getOwnPropertyDescriptor`
