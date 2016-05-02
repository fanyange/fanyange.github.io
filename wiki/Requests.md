---
title: Requests
---

## Basic
`res.url`

`res.raw`

`res.iter_content(chunk_size)`

request method parameters:

- `headers = {}`
- `json={}`
- `files={'file': ...}`

  ```python
  files = {'file': ('report.xls', open('report.xls', 'rb'), 'application/vnd.ms-excel', {'Expires': '0'})}
  files = {'file': ('report.csv', 'some,data,to,send\nanother,row,to,send\n')}
  ```
- `allow_redirects`
- `timout`

`~/.netrc`

status:

- `requests.codes.ok`
- `raise_for_status`

`res.headers.get('content-type')`

http basic authentication

    auth = HTTPBasicAuth('username', 'password')
    rq.post(url, auth=auth)

## Advanced

### session

`s = requests.Session()`

persisted time

`with requests.Session() as s: s.get(...)`
