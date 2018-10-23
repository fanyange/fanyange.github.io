---
title: Flask
---

## Elementary structure
    
* route

  - param types: `int`, `float`, `path`. ex:
  
  - `app.url_map`
  
  - method:

        app.route('/user/<int:id>')
  
    or 
  
        app.add_url_rule(rule, endpoint, view_func)
        app.add_url_rule('/user/<int:id>', 'user', user)
    
* context

  variables:

  - `current_app`
  - `g`
  - `request`
  - `session`
    
  ```python
  from hello import app
  from flask import current_app

  app_ctx = app.app_context()
  app_ctx.push()
  current_app.name #-> 'hello'
  app_ctx.pop()
  ```

* hook
  * before_first_request
  * before_request
  * after_request
  * teardown_request

* response
  * `return 'HTML', status_code, headers`
  * `Response` object: `make_response('HTML', code, headers)`
  * `redirect(url_for(func))`

## Template

- `render_template(filename, **args)`
- filter: `{{ name | capitalize }}`
  - `safe` actually is unsafe
  - `capitalize`
  - `lower`
  - `upper`
  - `title`
  - `trim` just like strip
  - `striptags`
- control flow
- macro: just like a function
  - and you can import macros from other files: `\{\% import 'macro.html' as macros \%\}`
- `include` code fragments
- `extends` and `super()`
- `url_for(endpoint, _external=True, **queries)`

## Web forms
`request.form`

`flask-wtf`

post redirection

`get_flashed_messages()`

## Database

`app.config`: `SQLALCHEMY_DATABASE_URI`, `sqlalchemy_commit_on_teardown`

`relationship('User', backref='role')`

`ForeignKey('roles.id')`

### CRUD

- read: `User.query.all()`, `User.query.filter_by`
  - `str(query_func)`
- create/ update `session.add`
- destroy: `session.delete`

### python shell integration
`manager.add_command('shell', Shell(make_context=object_dict))`

## User authentication
`from werkzeug.security import generate_password_hash, check_password_hash`

`UserMixin`

user defined callback:

```python
from . import login_manager

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))
```

`validate_*`

Request obj
File upload
cookies
- request.cookies.get()
- resp = make_response(); resp.set_cookie(key, val)

Redirects and Errors
abort(404)
redirect(url_for())

@app.errorhandler(404)
def page_not_found(error):
return render_template(), 404


Response
- (body, status, headers)

Session
- escape()
- session.pop(key, val)
- app.secrect_key = os.urandom(30)

Flash
- flash()
- get_flashed_messages()

Logging
- app.logger.debug()
- app.logger.warning()
- app.logger.error()
