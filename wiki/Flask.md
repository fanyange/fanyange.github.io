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
  
        app.add_url_rule()
    
* context
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
  - and you can import macros from other files: `{% import 'macro.html' as macros %}`
- `include` code fragments
- `extends` and `super()`
- `url_for('func', _external=True, **queries)`

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
