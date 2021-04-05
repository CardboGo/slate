---
title: Cardbo API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - python
  - javascript

toc_footers:
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

search: true

code_clipboard: true
---

# Cardbo API Document

![v5.5](https://img.shields.io/badge/version-v5.5-blue)

## API Environment

Environment | Domain
----------- | ------
Production  | `https://prodapi.cardbo.info`
Beta        | `https://betaapi.cardbo.info`
Development | `https://devapi.cardbo.info`

# API Responses

Key       | Type   | Description
--------- | ------ | -----------
code      | int    | status code
message   | string | message string
result    | {}     | result value
timestamp | int    | current timestamp in 16 digits

## HTTP status codes

### Successful requests

Status code   | Description
------------- | -----------
`200 Ok`      | The request succeeded.
`201 Created` | A `POST` method successfully created a resource. If the resource was already created by a previous execution of the same method, for example, the server returns the HTTP `200 OK` status code.

### Failed requests

Status code                 | Description
--------------------------- | -----------
`400 Bad Request`           | `INVALID_REQUEST`. Request is not well-formed, syntactically incorrect, or violates schema.
`401 Unauthorized`          | `UNAUTHORIZED_REQUEST`. Request does not authorized, or authorization is timeout.
`404 Not Found`             | `RESOURCE_NOT_FOUND`. The specified resource does not exist.
`500 Internal Server Error` | `INTERNAL_SERVER_ERROR`. An internal server error has occurred.

### Response codes

Code    | Description
------- | -----------
`200`   | SUCCESS
`400`   | INVALID_PARAMS
`500`   | ERROR_INTERNAL
`40010` | DATA_IN_PENDING
`10000` | ERROR_AUTH_TOKEN_FAIL
`10001` | ERROR_AUTH_TOKEN_TIMEOUT
`10002` | ERROR_AUTH_PERMISSION_DENIED

# Authentication

## Administrator

> Login administrator:

```shell
curl --request POST \
  --url https://prodapi.cardbo.info/api/v5/auth/administrator \
  -H 'Content-Type: application/json' \
  --data '{
    "account": "{account}",
    "password": "{password}"
  }'
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/auth/administrator'
data = {
  'account': '{account}',
  'password': '{password}'
}
response = requests.post(url, json=data)
```

```javascript
const axios = require('axios');

axios.post('https://prodapi.cardbo.info/api/v5/auth/administrator', {
    account: '{account}',
    password: '{password}'
  })
  .then(function (response) {
    console.log(response);
  })
  .catch(function (error) {
    console.log(error);
  });
```

> Response example:

```json
{
  "code": 200,
  "message": "Ok",
  "result": {
    "administrator_id": "5fa79ec32ba2dfe2db67ae2c",
    "administrator_name": "Harrison Peng",
    "level": 3,
    "access_token": "meowmeowmeowaccess",
    "refresh_token": "meowmeowmeowrefresh"
  },
  "timestamp": 1617601542000
}
```

Administrator authentication is used to login admnistrator and get administrator API token.

### HTTP Request

`POST https://prodapi.cardbo.info/api/v5/auth/administrator`

### Query Parameters

Parameter | Required | Description
--------- | -------- | -----------
account   | true     | Administrator account
password  | true     | Administrator password

### Response

#### Success

Key                | Type   | Description
------------------ | ------ | -----------
access_token       | string | access token
refresh_token      | string | refresh token
administrator_id   | string | administrator id
administrator_name | string | administrator name
level              | int    | administrator level {1: employee, 2: manager, 3: admin}

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## LineBot

> Login linebot:

```shell
curl --request POST \
  --url https://prodapi.cardbo.info/api/v5/auth/linebot \
  -H 'Content-Type: application/json' \
  --data '{
    "source": 1,
    "user_id": "{user_id}"
  }'
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/auth/linebot'
data = {
  'source': 1,
  'user_id': '{user_id}'
}
response = requests.post(url, json=data)
```

```javascript
const axios = require('axios');

axios.post('https://prodapi.cardbo.info/api/v5/auth/linebot', {
    source: 1,
    user_id: '{user_id}'
  })
  .then(function (response) {
    console.log(response);
  })
  .catch(function (error) {
    console.log(error);
  });
```

> Response example:

```json
{
  "code": 200,
  "message": "Ok",
  "result": {
    "access_token": "meowmeowmeowaccess",
    "refresh_token": "meowmeowmeowrefresh"
  },
  "timestamp": 1617601542000
}
```

Linebot authentication is used to login linebot and get API auth token.

### HTTP Request

`POST https://prodapi.cardbo.info/api/v5/auth/linebot`

### Query Parameters

Parameter | Required | Description
--------- | -------- | -----------
source    | true     | Request source {1: app, 2: saas, 3: linebot, 4: internal tool}
user_id   | true     | User line id

### Response

#### Success

Key                | Type   | Description
------------------ | ------ | -----------
access_token       | string | access token
refresh_token      | string | refresh token

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Line Login

> Login from LINE:

```shell
curl --request POST \
  --url https://prodapi.cardbo.info/api/v5/auth/line \
  -H 'Content-Type: application/json' \
  --data '{
    "source": 1,
    "access_token": "{access_token}"
  }'
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/auth/line'
data = {
  'source': 1,
  'access_token': '{access_token}'
}
response = requests.post(url, json=data)
```

```javascript
const axios = require('axios');

axios.post('https://prodapi.cardbo.info/api/v5/auth/line', {
    source: 1,
    access_token: '{access_token}'
  })
  .then(function (response) {
    console.log(response);
  })
  .catch(function (error) {
    console.log(error);
  });
```

> Response example:

```json
{
  "code": 200,
  "message": "Ok",
  "result": {
    "access_token": "meowmeowmeowaccess",
    "refresh_token": "meowmeowmeowrefresh"
  },
  "timestamp": 1617601542000
}
```

Line authentication is used to login from LINE and get API auth token.

### HTTP Request

`POST https://prodapi.cardbo.info/api/v5/auth/line`

### Query Parameters

Parameter    | Required | Description
------------ | -------- | -----------
source       | true     | Request source {1: app, 2: saas, 3: linebot, 4: internal tool}
access_token | true     | Access token from LINE Login

### Response

#### Success

Key                | Type   | Description
------------------ | ------ | -----------
access_token       | string | access token
refresh_token      | string | refresh token

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Auth Refresh

> Refresh auth token:

```shell
curl --request POST \
  --url https://betaapi.cardbo.info/api/v5/auth/refresh \
  -H 'Authorization: Bearer meowmeowmeowrefresh' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/auth/refresh'
headers = {'Authorization': 'Bearer meowmeowmeowrefresh'}
response = requests.post(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {'Authorization': 'Bearer meowmeowmeowrefresh'}
axios.post('https://prodapi.cardbo.info/api/v5/auth/refresh', {
    headers: headers
  })
  .then(function (response) {
    console.log(response);
  })
  .catch(function (error) {
    console.log(error);
  });
```

> Response example:

```json
{
  "code": 200,
  "message": "Ok",
  "result": {
    "access_token": "meowmeowmeowaccess",
    "refresh_token": "meowmeowmeowrefresh"
  },
  "timestamp": 1617601542000
}
```

Refresh authentication is used to refresh your API auth token by refresh token.

<aside class="notice">
You must replace <code>meowmeowmeowrefresh</code> with your personal API refresh token.
</aside>

### HTTP Request

`POST https://prodapi.cardbo.info/api/v5/auth/refresh`

### Query Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API refresh token

### Response

#### Success

Key                | Type   | Description
------------------ | ------ | -----------
access_token       | string | access token
refresh_token      | string | refresh token

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# User

## Get user profile

> Get user profile:

```shell
curl --request GET \
  --url https://betaapi.cardbo.info/api/v5/user \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/user'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
axios.get('https://prodapi.cardbo.info/api/v5/user', {
    headers: headers
  })
  .then(function (response) {
    console.log(response);
  })
  .catch(function (error) {
    console.log(error);
  });
```

> Response example:

```json
{
  "code": 200,
  "message": "Ok",
  "result": {
    "user_id": "5fa79ec32ba2dfe2db67ae2c",
    "line_id": "Udchd7f131dvvhdbe166692206a12335c",
    "username": "Harrison Peng",
    "image": "https://image.com/image.png",
    "email": "",
    "phone_number": "",
    "cardbo_point": 0,
    "cards": [
      {
        "card_id": "5fdb2ff546a97b49dac8a6ad",
        "name": "永豐幣倍卡",
        "bank": {
          "bank_id": "5f756d85c2349d9139648a7d",
          "name": "永豐銀行",
          "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/sinopac-bank.png",
          "image": "https://i.imgur.com/1g5nYEN.png",
          "code": "807"
        },
        "level": 5,
        "image": "https://storage.googleapis.com/cardbo-images/card/5fdb2ff546a97b49dac8a6ad-1.png",
        "issuer": "MASTERCARD"
      }
    ],
    "mobilepays": [
      {
        "mobilepay_id": "5f9a747f10c24bf3d4a54d4e",
        "name": "Apple Pay",
        "image": "https://storage.googleapis.com/cardbo-images/mobile-pay/apple-pay.png",
        "user_has": false
      }
    ],
    "user_level": 1,
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "last_login": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Get user profile by user's API auth token

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://prodapi.cardbo.info/api/v5/user`

### Query Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API refresh token

### Response

#### Success

Key          | Type        | Description
------------ | ----------- | -----------
user_id      | string      | User id
line_id      | string      | LINE id
username     | string      | Username
image        | string      | User image
email        | string      | Email
phone_number | string      | Phone number
cardbo_point | int         | Cardbo point (useless)
cards        | []Card      | User own card array
mobilepays   | []Mobilepay | User own mobile pay array
user_level   | int         | User level {1: general, 2: vip, 3: developer}
created_at   | int         | User create time in 16 digits timestamp
updated_at   | int         | User update time in 16 digits timestamp
last_login   | int         | User last login time in 16 digits timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message
