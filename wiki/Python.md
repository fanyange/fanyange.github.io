---
title: Python
---
## Numbers and Expressions
浮点数除法

`from __future__ import division`

`$python -Qnew`

整数除法: `1 // 2`

`pow(2,3)` = `2 ** 3`
`round(1.0/2)`
`floor()` ~ `ceil()`
`int()`

拼接字符串:

`"hello" 'world'`

`str` and `repr`

`input` and `raw_input`

    print "hello,\
    world"

`r'hello\n' '\\'`

## List and tuple
Container:

- Sequence
- Dict
- Set
- ...

Sequence methods:

`list(SEQUENCE)`

- index
- slice
  - `tags[9:30]`, `numbers[::-4]`
- add or multiply
  - `[None] * 10`
- member
  - `'w' in 'wrong'`
- length: `len(seq)`
- iteration

List methods:

- change an element
- `del` an element
- assign(slicing)
- `append`, `count`, `extend(+ or slice)`, `index(indexNum or ValueError)`, `insert`, `pop`, `remove`(only once), `reverse`(reversed), `sort(cmp)`(sorted)
- copy a list: `list[:]`
- compare: `cmp`, `key=len`, `reverse=True`

Tuple
`1,2,3` => `(1,2,3)`

`3 * (40+2,)`

`tuple(sequence)`

## String
formatting:

`"hello %.4f %s" % (1, 'world')`

```python
from string import Template
s = Template('Hello, $name!')
d = {'name': "Mao Rui"}
s.substitute(name="Mao Rui")
print s.substitute(d)
```

flags: `-+ 0*.3`

`"%.*s" % (5, 'Guido van Rossum')`

methods:

- `find(target, [start[,end]])` => num or -1
- `join`
- `lower` and `upper`; `title` or `string.capwords`
- `replace(target, using)`
- `strip('abc')`
- `translate(table, to_del)`, `(maketrans(from, to))`

## Dict
sequence -> (list, tuple, string, ...)
mapping -> dict

`dict(seq)`, `dict([(key, val)])`, `dict(key=val)`

formatting: `"%(key)s"`

methods:

- `clear`
- `copy` and `deepcopy(d)`
- `dict.fromkeys(['key1','key2'], val)`
- `get(key, return)` and `setdefualt(key, val)`
- `has_key`
- `items` and `iteritems`
- `keys` and `iterkeys`
- `values` and `itemvalues`
- `pop(key)` and `popitem`
- `update`


## Function
target: Abstarct

`callable(func)`

doc: `func.__doc__`

parameters and arguments

scope: `vars()`

`locals()`, `globals()`

`global x`

unpacking: `*params` & `**kwds`

FP: `map(func, seq)`, `filter(func, seq)`, `reduce()`
`isalnum`

`apply(func[, args[, kwargs]])`

## Class
新式类:
```python
__metaclass__ = type
class Person:
  ...
```

`foo.greet()` -> `Person.greet(foo)`

private methods:
- `__method(self)` -> `_ClassName__method(self)`
- or use `_method(self)`

`issubclass`, `isinstance`

member:

- `ClassName.__bases__`
- `object.__class__` or `type(s)`(New)

interface:
- `hasattr(obj, attr)`
- `getattr(obj, 'method', missingreturn)`
- `setattr(obj, 'method', value)`

get all values(properties): `obj.__dict__`

get information: `import inspect`

## Error handling
引发异常： `raise Exception(msg)`

异常类： `dir(exceptions)`

捕捉多个异常： `except (Exception1, Exception2, ...), e:`(or `as e` in Python3)

`else`, `finally`

# Magic methods
`super(SubClass, self).__init__()`

protocol:

sequence and map: `__len__(self)`, `__getitem__(self,key)`, `__setitem(self,key,val)`, `__del__(self)`


