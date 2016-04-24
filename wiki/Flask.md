---
title: Flask
---

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
