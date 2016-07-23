---
title: Python
---
* TOC
{:toc}

### More Topics

- [[Standard Library]]
- [[Modules]]
- Implemetations
  - PyPy
- [[Web Scraping]]
- [[IPython]]

## PEP8
80 chars a line. more chars should be written after a '\\' char and a line break.

## Numbers and Expressions
浮点数除法

`1e8` is also a float

`int('11.1')` will raise an `ValueError`

```python
from decimal import Decimal
a = Decimal('1.345')
b = Decimal('0.01')
a.quantize(b)
```

```python
from fractions import Fraction
fractions.gcd(24, 16) #=> 8
```

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
`list` 更像链表而非数组

`array(typecode, initializer)`

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
  - 小于起始位置的偏移量会被当做0，大于终止位置的偏移量会被当做-1
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
- `append`, `count`, `extend(+ or slice)`, `index(indexNum or ValueError)`, `insert`, `pop([offset])`, `remove`(only once), `reverse`(or `reversed()` or `l[::-1]`), `sort(cmp)`(or `sorted()`)
- copy a list:
  - `list[:]`
  - `copy()`
  - `list()`
- compare: `cmp`, `key=len`, `reverse=True`

- append + pop(-1) ~ stack
- append + pop(0) ~ queue

`in` statement is better used in `set`.

In Python the default arguments are evaluated once when the function is defined, not each time the function is called.

    def add_to(num, target=[]):
        target.append(num)
        return target

    add_to(1)
    # Output: [1]

    add_to(2)
    # Output: [1, 2]

    add_to(3)
    # Output: [1, 2, 3]
    
change to this:

    def add_to(element, target=None):
        if target is None:
            target = []
        target.append(element)
        return target

`enumerate(list, n)`

Tuple
`1,2,3` => `(1,2,3)`

`3 * (40+2,)`

`tuple(sequence)`

## String

```python
str.find('string')
str.rfind('string')
str.count('string')
str.isdigit('123')
```

```python
str.center(30)
str.ljust(30)
str.rjust(30)
```

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

### unicode
<http://www.unicode.org/charts/>

`\uffff`, `\Uffff`, `\N{name}`

`unicodedata`: `name()` , `lookup()`

### encode & decode

- `encode('ascii', 'ignore')`
- `encode('ascii', 'replace')`
- `encode('ascii', 'backslashreplace')`

### formatting

old:

`%%`

`'%-10.4s'`

new:

增加填充字符(after `:`)、对齐字符(`>`, `<`, `^`): `'{0:!^20s}'.format('BIG SALE')`

### bytes and bytearray

```python
blist = [1, 2, 3, 255]
the_bytes = bytes(blist)
the_bytes #-> b'\x01\x02\x03\xff'

the_byte_array = bytearray(blist)
the_byte_array #-> bytearray(b'\x01\x02\x03\xff')
```

#### struct

`pack()` and `unpack('>LL', bytes)`

## Dict
sequence -> (list, tuple, string, ...)
mapping -> dict

`dict(seq)`, `dict([(key, val)])`, `dict(key=val)`

```python
dict(['ab', 'cd', 'ef']) #=> {'a': 'b', 'c': 'd', 'e': 'f'}
```

formatting: `"%(key)s"`

a key `in` a dict

methods:

- `clear`
- `copy` and `deepcopy(d)`
- `dict.fromkeys(['key1','key2'], val)`
- `get(key, return)` and `setdefualt(key, val)`
  - `import defaultdict`
- `has_key`
- `items` and `iteritems`
- `keys` and `iterkeys` => `dict_keys` in Python3, no `iterkeys`
- `values` and `itemvalues` => `dict_values` in Python3, no `itervalues`
- `pop(key)` and `popitem`
- `update`

## Code structure

`while ... else ...`

`zip(lista, listb, listc)`

- ends after the shortest sequence has been iterated over.
- example: `dict(zip(lista, listb))`

list / dict / set / generator comprehension


## Functions
Keyword parameters / arguments

You can directly use keyword arguments when calling a function. For example:

```python
def say(name, sex, age):
    return name, sex, age

say(sex='male', age =18, name='Mao')
```

`sum()`

target: Abstarct

`callable(func)`

doc: `func.__doc__`

parameters and arguments

scope: `vars()`

`locals()`, `globals()`

`global x`: you can access `x` out of current function scope. (在函数外定义的变量本来就可以被函数内访问到)

Don't write this: `a = 1; def addA(): a += 1`

    a = 1
    def change_a():
        global a
        a += 100
    
    print(a) # => 101

unpacking: `*params` & `**kwds`

FP: `map(func, seq)`, `filter(func, seq)`, `reduce()`

`isalnum`, `isupper`

`apply(func[, args[, kwargs]])`

## Class

Python is strong typed

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

> Do, or do not. There is no try.

引发异常： `raise Exception(msg)`

异常类： `dir(exceptions)`

捕捉多个异常： `except (Exception1, Exception2, ...), e:`(or `as e` in Python3)

`else`, `finally`

`@classmethod; def(cls)` and `cls.attr`

`@staticmethod`

### namedtuple
`._replace()`

## Magic methods
`super(SubClass, self).__init__()`

`super().__init__(*args)`

protocol:

sequence and map: `__len__(self)`, `__getitem__(self,key)`, `__setitem(self,key,val)`, `__del__(self)`


`property(fget, fset, fdel, doc)`

iterator and iterable: `next()` and `__iter__`, `iter(obj)`

generator: `yield` and `send()`, `throw()`, `close()`

You can only iterate over generator once.

### decorator
    from functools import wrap
    @wrap(func)
    
### frequently used methods:

| Method Name        | Usage  |
| :----------------- | :----- |
| `__eq__`           | ==     |
| `__ne__`           | !=     |
| `__lt__`           | <      |
| `__gt__`           | >      |
| `__le__`           | <=     |
| `__ge__`           | >=     |
| `__add__`          | +      |
| `__sub__`          | -      |
| `__mul__`          | *      |
| `__floordiv__`     | //     |
| `__truediv__`      | /      |
| `__mod__`          | %      |
| `__pow__`          | **     |

## Modules
when to import a module in the begining of a file and when to do it in a function

`sys.path.append(os.path.expanduser('~/python'))`

'' in `sys.path`

`reload`(deleted in Python3)

`export PYTHONPATH=$PYTHONPATH:~/hello`

`sys.prefix` and `.pth` file


package:
```python
# pkg/__init__.py
# pgk/mod.py
import pkg
import pkg.mod
```

grok:

- introspection:
  - `dir(mod)`
  - `dir()`
  - `id(obj)`
  - `inspect.getmembers(obj)`
- `__all__`
- source file: `__file__`

### sys
- `argv`
- `exit`
- `modules`
- `path`
- `platform`
- `stdin`
- `stdout`
- `stderr`

### os
- `environ`
- `system`
- `sep` -> /
- `pathsep` -> :
- `linesep` -> \n
- `urandom`

### fileinput
- `input(inplace=True)`
- `lineno`
- `filelineno`
- `isfirstline`
- `isstdin`
- `nextfile`
- `close`

### collections
set(just like a dict without values)

- `{}` or `set()`
- `&`, `|`, `-`, `^`
- `<=`, `<`

`defaultdict(func)`

- `tree = lambda: defaultdict(tree)`

namedtuple

- `namedtuple('Animal', 'name age type')`
- `._asdict()`

enum.Enum

heapq

- `heappush(heap, x)`
- `heappop`
- `heapify(seq)`
- `heapreplace(heap, new_value)`
- `nlargest(n, iter)`
- `nsmallest(n, iter)`

deque

- `deque(maxlen=30)`
 - `appendleft`
 - `popleft`
 - `rotate`

`Counter`

- `counter.most_common`
- just like a set: `counter_a ( + / - / & / | ) counter_b`

### time
- `asctime`
- `localtime`
- `mktime`
- `strptime`
- `strftime`
- `time`

### random
- `random`
- `randinit`
- `randrange`
- `uniform`
- `choice`
- `sample`

### re
- `compile`
- `search`
- `match`
- `findall`
- `split`
- `sub`

`MatchObject`:
  - `group(group)`
  - `start(group)`
  - `end(group)`
  - `span(group)`

pattern:

| pattern            | match                      |
| :-----------       | :------------              |
| `prev{m}`          | m 个连续的 prev            |
| `prev(?=next)`     | 如果后面为 next，返回 prev |
| `prev(?!next)`     | 如果后面非 next，返回 prev |
| `(?<=prev)next`    | 如果前面为 prev，返回 next |
| `(?<!prev)next`    | 如果前面非 prev，返回 next |
| `(?P< name >expr)` | `m.group('name')`          |

`excecfile`

### PyYaml
`safe_load()`

```yaml
e: !!str 123

# 多行字符串可以使用|保留换行符，也可以使用>折叠换行。
this: |
  Foo
  Bar
that: >
  Foo
  Bar
# JS: { this: 'Foo\nBar\n', that: 'Foo Bar\n' }

# +表示保留文字块末尾的换行，-表示删除字符串末尾的换行。
s1: |
  Foo

s2: |+
  Foo

s3: |-
  Foo
# JS: { s1: 'Foo\n', s2: 'Foo\n\n\n', s3: 'Foo' }
```

### standard library
- http.server
- json.tool
- argparse

    parser = argparse.ArgumentParse()
    parser.add_argument('--number', required=True, type=int, help='number to perform calculation')
    params = parser.parse_args()
    number = params.number

- http.cookiejar.CookieJar()
- urllib.requests.HTTPCookieProcessor(cookie)
- urllib.requests.build_opener(handler)

- string
  - .ascii_letters
  - .punctuation
- collections
  - OderedDict
- ConfigParser
- Logger
- functools
- difflib
- hashlib
- [x] csv
  - 处理标题行: `csv.DictReader`
  - 处理空值
- timeit, profile, trace
- datetime
- itertools
  - `chain`(`.from_iterable`)
  - `cycle`
  - `accumulate([func])`
  - `groupby(iterable, key=keyfunc)`

    ```python
    from itertools import groupby
    from urllib.urlparse import urlsplit

    def paths(url):
        path = urlsplit(url).path.strip('/')
        return path.split('/')[:-1]
    
    g = groupby(sorted(urls, key=paths), paths)
    r = [(key, list(val)) for key, val in g]
    ```

- logging
- getopt, optparse
- cmd

template: `Template`

## IO
`oepn(name[, mode[, buffering]])` -> `file`

`StringIO`, `BytesIO`

`io.open('filename', 'mode', encoding='utf8')`

mode:
- r
- w
- a
- **x**
- +
- b

`print(str, file=io, sep='', end='')`

`tell()` and `seek(offset, origin)`(origin: 0/1/2 or io.SEEK_SET/io.SEEK_CUR/io.SEEK_END)

`os.linesep`

类文件对象: `read`, `readline`, `readlines`

- `sys.stdin`
- `sys.stdout`
- `sys.stderr`

随机访问：`seek`, `tell`

- `read`, `readline`, `readlines`
- `write`, `writelines(iter)`

## GUI
wxpython

## Database
connection:

`connect(dsn, user, password, host, database)`

- `close`
- `commit`
- `rollback`
- `cursor`

cursor:

- `execute` (处理空值不太方便)
- `description`
- `fetchall`

## Web
tidy

- Popen
    p = Popen([args], stdin=PIPE, stdout=PIPE, stderr=PIPE)
    p.wait()
    p.stdin.write('cmd')
    p.stdout.read()
- PIPE

xpath

HTMLParser

BeautifulSoup

### CGI(Common Gateway Interface)
`../cgi-bin/..`
`.cgi`
`cgitb`

## Test
- requirements introduction
- coverage(trace.py)

`doctest.testmod(modname)`

`unittest`

- `unittest.main()`

`nose`

- `failUnless`
- `failIf`
- `failUnlessEqual`
- `failIfEqual`

`pylint -rn modname`

### Profiling
`profile.run('function()')`

`pstats.Stats('profile.profile')`

`timeit`

## Package
```python
# -*- coding: utf-8 -*-
import sys
from distutils.core import setup

setup(name='Hello',
        version='1.0',
        description='A simple example',
        author='Magnus Lie Hetland',
        py_modules=['hello'])
```
`distutils` and `setuptools`(eggs)

    python setup.py install
    python setup.py bdist --help-formats
    python setup.py sdist --formats=zip
    python setup.py build_ext --inplace

## Happy
- prototyping
- configuring
- logging


