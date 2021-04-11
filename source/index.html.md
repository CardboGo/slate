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
result    | Object | result value
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

### Request

#### Parameters

Parameter | Required | Type   | Description
--------- | -------- | ------ | -----------
account   | true     | string | Administrator account
password  | true     | string | Administrator password

### Response

#### Success

Key                | Type   | Enums                                             | Description
------------------ | ------ | ------------------------------------------------- | ------------
access_token       | string |                                                   | access token
refresh_token      | string |                                                   | refresh token
administrator_id   | string |                                                   | administrator id
administrator_name | string |                                                   | administrator name
level              | int    | EMPLOYEE: `1` <br/> MANAGER: `2` <br/> ADMIN: `3` | administrator level

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
    "user_id": "5fcd3c76e549avb2805e7fe0"
  }'
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/auth/linebot'
data = {
  'source': 1,
  'user_id': '5fcd3c76e549avb2805e7fe0'
}
response = requests.post(url, json=data)
```

```javascript
const axios = require('axios');

axios.post('https://prodapi.cardbo.info/api/v5/auth/linebot', {
    source: 1,
    user_id: '5fcd3c76e549avb2805e7fe0'
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

### Request

#### Parameters

Parameter | Required | Type   | Enums                                                                | Description
--------- | -------- | ------ | -------------------------------------------------------------------- | -----------
source    | true     | int    | APP: `1` <br/> SAAS: `2` <br/> LINEBOT: `3` <br/> INTERNAL_TOOL: `4` | Request source
user_id   | true     | string |                                                                      | User line id

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

### Request

#### Parameters

Parameter    | Required | Type   | Enums                                                                | Description
------------ | -------- | ------ | -------------------------------------------------------------------- | -----------
source       | true     | int    | APP: `1` <br/> SAAS: `2` <br/> LINEBOT: `3` <br/> INTERNAL_TOOL: `4` | Request source
access_token | true     | string |                                                                      | Access token from LINE Login

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

headers = {Authorization: 'Bearer meowmeowmeowrefresh'}
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

### Request

#### Headers

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

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
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
    "user_id": "5fcd3c76e549avb2805e7fe0",
    "line_id": "Udchd7f131dvvhdbe166692206a12335c",
    "username": "Harrison Peng",
    "image": "https://image.com/image.png",
    "email": "harrison@cardbo.info",
    "phone_number": "0987654321",
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

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key          | Type        | Enums                                            | Description
------------ | ----------- | ------------------------------------------------ | -----------
user_id      | string      |                                                  | User id
line_id      | string      |                                                  | LINE id
username     | string      |                                                  | Username
image        | string      |                                                  | User image
email        | string      |                                                  | Email
phone_number | string      |                                                  | Phone number
cardbo_point | int         |                                                  | Cardbo point (useless)
cards        | []Card      |                                                  | User own card array
mobilepays   | []Mobilepay |                                                  | User own mobile pay array
user_level   | int         | GENERAL: `1` <br/> VIP: `2` <br/> DEVELOPER: `3` | User level
created_at   | int         |                                                  | User create time in 16 digits timestamp
updated_at   | int         |                                                  | User update time in 16 digits timestamp
last_login   | int         |                                                  | User last login time in 16 digits timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Update user information

> Update user information:

```shell
curl --request PUT \
  --url https://betaapi.cardbo.info/api/v5/user \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "username": "Harrison",
    "email": "harrison@cardbo.info",
    "phone_number": "0987654321"
  }'

```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/user'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'username': 'Harrison',
  'email': 'harrison@cardbo.info',
  'phone_number': '0987654321'
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  username: 'Harrison',
  email: 'harrison@cardbo.info',
  phone_number: '0987654321',
}
axios.put('https://prodapi.cardbo.info/api/v5/user', data, {
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
    "user_id": "5fcd3c76e549avb2805e7fe0",
    "line_id": "Udchd7f131dvvhdbe166692206a12335c",
    "username": "Harrison Peng",
    "image": "https://image.com/image.png",
    "email": "harrison@cardbo.info",
    "phone_number": "0987654321",
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

Update user information

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://prodapi.cardbo.info/api/v5/user`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter    | Required | Type   | Description
------------ | -------- | ------ | -----------
username     | false    | string | username
email        | false    | string | email
phone_number | false    | string | phone number

### Response

#### Success

Key          | Type        | Enums                                            | Description
------------ | ----------- | ------------------------------------------------ | -----------
user_id      | string      |                                                  | User id
line_id      | string      |                                                  | LINE id
username     | string      |                                                  | Username
image        | string      |                                                  | User image
email        | string      |                                                  | Email
phone_number | string      |                                                  | Phone number
cardbo_point | int         |                                                  | Cardbo point (useless)
cards        | []Card      | User own card array
mobilepays   | []Mobilepay | User own mobile pay array
user_level   | int         | GENERAL: `1` <br/> VIP: `2` <br/> DEVELOPER: `3` | User level
created_at   | int         |                                                  | User create time in 16 digits timestamp
updated_at   | int         |                                                  | User update time in 16 digits timestamp
last_login   | int         |                                                  | User last login time in 16 digits timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Add user card

> Add card:

```shell
curl --request PUT \
  --url https://betaapi.cardbo.info/api/v5/user/add_card \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card_id": "5fdb2ff846a97b49dac8a6b3",
    "image": "image_1",
    "level": 4,
    "issuer": "JCB"
  }'

```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/user/add_card'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'card_id': '5fdb2ff846a97b49dac8a6b3',
  'image': 'image_1',
  'level': 4,
  'issuer': 'JCB'
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  card_id: '5fdb2ff846a97b49dac8a6b3',
  image: 'image_1',
  level: 4,
  issuer: 'JCB'
}
axios.put('https://prodapi.cardbo.info/api/v5/user/add_card', data, {
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
  "result": "Cards added",
  "timestamp": 1617601542000
}
```

Add a card to user's pocket

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://prodapi.cardbo.info/api/v5/user/add_card`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter | Required | Type   | Enums                                                        | Description
--------- | -------- | ------ | ------------------------------------------------------------ | -----------
card_id   | true     | string |                                                              | card id
image     | true     | string | `image_1`, `image_2`, `image_3`, `image_4`, `image_5`, `image_6`, `image_7`, `image_8`, `image_9`, `image_10`                                                  | card image key
level     | true     | int    | `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`                       | card level
issuer    | true     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | card issuer

### Response

#### Success

Key    | Type   | Description
------ | ------ | -----------
result | string | result message

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Remove user card

> Remove card:

```shell
curl --request PUT \
  --url https://betaapi.cardbo.info/api/v5/user/remove_card \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card_id": "5fdb2ff846a97b49dac8a6b3"
  }'

```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/user/remove_card'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'card_id': '5fdb2ff846a97b49dac8a6b3'
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  card_id: '5fdb2ff846a97b49dac8a6b3'
}
axios.put('https://prodapi.cardbo.info/api/v5/user/remove_card', data, {
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
  "result": "Card removed",
  "timestamp": 1617601542000
}
```

Remove a card from user's pocket

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://prodapi.cardbo.info/api/v5/user/remove_card`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter | Required | Type   | Description
--------- | -------- | ------ | -----------
card_id   | true     | string | card id

### Response

#### Success

Key    | Type   | Description
------ | ------ | -----------
result | string | result message

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Update user mobile pays

> Update mobile pays:

```shell
curl --request PUT \
  --url https://betaapi.cardbo.info/api/v5/user/mobilepays \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '[
    {
      "mobilepay_id": "5f9a747f10c24bf3d4a54d4e"
    }
  ]'

```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/user/mobilepays'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = [
  {
    'mobilepay_id': '5f9a747f10c24bf3d4a54d4e'
  }
]
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = [
  {
    mobilepay_id: "5f9a747f10c24bf3d4a54d4e"
  }
]
axios.put('https://prodapi.cardbo.info/api/v5/user/mobilepays', data, {
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
  "result": "",
  "timestamp": 1617601542000
}
```

Update user's mobile pays

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://prodapi.cardbo.info/api/v5/user/mobilepays`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter    | Required | Type   | Description
------------ | -------- | ------ | -----------
mobilepay_id | true     | string | mobile pay id

### Response

#### Success

Key    | Type   | Description
------ | ------ | -----------
result | string | result message

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Add user mobile pay

> Add mobile pay:

```shell
curl --request PUT \
  --url https://betaapi.cardbo.info/api/v5/user/add_mobilepay \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "mobilepay": {
      "mobilepay_id": "5f9a747f10c24bf3d4a54d4e"
    },
    "cards": [
      {
        "card_id": "5fdb2ff846a97b49dac8a6b3"
      }
    ]
  }'
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/user/add_mobilepay'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'mobilepay': {
    'mobilepay_id': '5f9a747f10c24bf3d4a54d4e'
  },
  'cards': [
    {
      'card_id': '5fdb2ff846a97b49dac8a6b3'
    }
  ]
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  mobilepay: {
    mobilepay_id: "5f9a747f10c24bf3d4a54d4e"
  },
  cards: [
    {
      card_id: "5fdb2ff846a97b49dac8a6b3"
    }
  ]
}
axios.put('https://prodapi.cardbo.info/api/v5/user/add_mobilepay', data, {
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
  "result": "",
  "timestamp": 1617601542000
}
```

Add user's mobile pay

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://prodapi.cardbo.info/api/v5/user/add_mobilepay`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter | Required | Type      | Description
--------- | -------- | --------- | -----------
mobilepay | true     | MobilePay | mobile pay object
cards     | true     | []Card    | array of card object

MobilePay

Parameter    | Required | Type | Description
------------ | -------- | ------------- | -----------
mobilepay_id | true     |               | mobile pay id

Card

Parameter | Required | Type | Description
--------- | -------- | ------------- | -----------
card_id   | true     |               | card id

### Response

#### Success

Key    | Type   | Description
------ | ------ | -----------
result | string | result message

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Remove user mobile pay

> Remove mobile pay:

```shell
curl --request PUT \
  --url https://betaapi.cardbo.info/api/v5/user/remove_mobilepay \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "mobilepay_id": "5f9a747f10c24bf3d4a54d4e"
  }'
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/user/remove_mobilepay'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'mobilepay_id': '5f9a747f10c24bf3d4a54d4e'
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  mobilepay_id: "5f9a747f10c24bf3d4a54d4e"
}
axios.put('https://prodapi.cardbo.info/api/v5/user/remove_mobilepay', data, {
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
  "result": "",
  "timestamp": 1617601542000
}
```

Remove user's mobile pay

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://prodapi.cardbo.info/api/v5/user/remove_mobilepay`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter    | Required | Type   | Description
------------ | -------- | ------ | -----------
mobilepay_id | true     | string | mobile pay id

### Response

#### Success

Key    | Type   | Description
------ | ------ | -----------
result | string | result message

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Add card to user mobile pay

> Add card to mobile pay:

```shell
curl --request PUT \
  --url https://betaapi.cardbo.info/api/v5/user/mobilepay/add_card \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "mobilepay": {
      "mobilepay_id": "5f9a747f10c24bf3d4a54d4e"
    },
    "card": {
      "card_id": "5fdb2ff846a97b49dac8a6b3"
    }
  }'
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/user/mobilepay/add_card'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'mobilepay': {
    'mobilepay_id': '5f9a747f10c24bf3d4a54d4e'
  },
  'cards': {
    'card_id': '5fdb2ff846a97b49dac8a6b3'
  }
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  mobilepay: {
    mobilepay_id: "5f9a747f10c24bf3d4a54d4e"
  },
  cards: {
    card_id: "5fdb2ff846a97b49dac8a6b3"
  }
}
axios.put('https://prodapi.cardbo.info/api/v5/user/mobilepay/add_card', data, {
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
  "result": "",
  "timestamp": 1617601542000
}
```

Add card to user's mobile pay

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://prodapi.cardbo.info/api/v5/user/mobilepay/add_card`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter | Required | Type      | Description
--------- | -------- | --------- | -----------
mobilepay | true     | MobilePay | mobile pay object
card      | true     | Card      | array of card object

MobilePay

Parameter    | Required | Type | Description
------------ | -------- | ------------- | -----------
mobilepay_id | true     |               | mobile pay id

Card

Parameter | Required | Type | Description
--------- | -------- | ------------- | -----------
card_id   | true     |               | card id

### Response

#### Success

Key    | Type   | Description
------ | ------ | -----------
result | string | result message

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Remove card from user mobile pay

> Remove card from mobile pay:

```shell
curl --request PUT \
  --url https://betaapi.cardbo.info/api/v5/user/mobilepay/remove_card \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "mobilepay": {
      "mobilepay_id": "5f9a747f10c24bf3d4a54d4e"
    },
    "card": {
      "card_id": "5fdb2ff846a97b49dac8a6b3"
    }
  }'
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/user/mobilepay/remove_card'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'mobilepay': {
    'mobilepay_id': '5f9a747f10c24bf3d4a54d4e'
  },
  'cards': {
    'card_id': '5fdb2ff846a97b49dac8a6b3'
  }
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  mobilepay: {
    mobilepay_id: "5f9a747f10c24bf3d4a54d4e"
  },
  cards: {
    card_id: "5fdb2ff846a97b49dac8a6b3"
  }
}
axios.put('https://prodapi.cardbo.info/api/v5/user/mobilepay/remove_card', data, {
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
  "result": "",
  "timestamp": 1617601542000
}
```

Remove card from user's mobile pay

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://prodapi.cardbo.info/api/v5/user/mobilepay/remove_card`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter | Required | Type      | Description
--------- | -------- | --------- | -----------
mobilepay | true     | MobilePay | mobile pay object
card      | true     | Card      | array of card object

MobilePay

Parameter    | Required | Type | Description
------------ | -------- | ------------- | -----------
mobilepay_id | true     |               | mobile pay id

Card

Parameter | Required | Type | Description
--------- | -------- | ------------- | -----------
card_id   | true     |               | card id

### Response

#### Success

Key    | Type   | Description
------ | ------ | -----------
result | string | result message

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Update user level

> Update user level:

```shell
curl --request PUT \
  --url https://betaapi.cardbo.info/api/v5/user/user_level \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '[
    {
      "user_id": "5fcd3c76e549avb2805e7fe0",
      "user_level": 2
    }
  ]'

```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/user/user_level'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = [
  {
    'user_id': '5fcd3c76e549avb2805e7fe0',
    'user_level": 2
  }
]
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = [
  {
    user_id: "5fcd3c76e549avb2805e7fe0",
    user_level: 2
  }
]
axios.put('https://prodapi.cardbo.info/api/v5/user/user_level', data, {
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
  "result": "",
  "timestamp": 1617601542000
}
```

Update user's mobile pays

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://prodapi.cardbo.info/api/v5/user/user_level`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter  | Required | Type   | Enums                                            | Description
---------- | -------- | ------ | ------------------------------------------------ | -----------
user_id    | true     | string |                                                  | user id
user_level | true     | string | GENERAL: `1` <br/> VIP: `2` <br/> DEVELOPER: `3` | user level

### Response

#### Success

Key    | Type   | Description
------ | ------ | -----------
result | string | result message

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# Administrator

## Create administrator

> Create administrator:

```shell
curl --request POST \
  --url https://betaapi.cardbo.info/api/v5/administrator \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "account": "administrator_account",
    "level": 2,
    "username": "Harrison",
    "password": "password"
  }'
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/administrator'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'account': 'administrator_account',
  'level': 2,
  'username': 'Harrison',
  'password': 'password'
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  account: "administrator_account",
  level: 2,
  username: "Harrison",
  password: "password"
}
axios.post('https://prodapi.cardbo.info/api/v5/administrator', data, {
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
    "administrator_id": "5fa79ec32ba2dfe2db67ae2c",
    "account": "administrator_account",
    "username": "Harrison",
    "level": 2,
    "email": "",
    "phone_number": "",
    "facebook_link": "",
    "job_statistics": {},
    "money": {},
    "last_login": 0,
    "created_at": 1617601542000,
    "updated_at": 0
  },
  "timestamp": 1617601542000
}
```

Create a new administrator

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`POST https://prodapi.cardbo.info/api/v5/administrator`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter | Required | Type   | Enums                                             | Description
--------- | -------- | ------ | ------------------------------------------------- | -----------
account   | true     | string |                                                   | account
level     | true     | int    | EMPLOYEE: `1` <br/> MANAGER: `2` <br/> ADMIN: `3` | administrator level
username  | true     | string |                                                   | username
password  | true     | string |                                                   | password

### Response

#### Success

Key              | Type          | Enums                                             | Description
---------------- | ------------- | ------------------------------------------------- | -----------
administrator_id | string        |                                                   | administrator id
account          | string        |                                                   | account
username         | string        |                                                   | username
level            | int           | EMPLOYEE: `1` <br/> MANAGER: `2` <br/> ADMIN: `3` | administrator level
email            | string        |                                                   | email
phone_number     | string        |                                                   | phone number
facebook_link    | string        |                                                   | facebool link
job_statistics   | JobStatistics |                                                   | job statistics
money            | Monney        |                                                   | money info
last_login       | int           |                                                   | last login time in 16 digits timestamp
created_at       | int           |                                                   | User create time in 16 digits timestamp
updated_at       | int           |                                                   | User update time in 16 digits timestamp

JobStatistics

Key                  | Type | Description
-------------------- | ---- | -----------
store_pending_count  | int  | number of store pending
store_finished_count | int  | number of store finished
card_pending_count   | int  | number of  card pending
card_finished_count  | int  | number of card finished
offer_pending_count  | int  | number of offer pending
offer_finished_count | int  | number of offer finished

Monney

Key         | Type | Description
----------- | ---- | -----------
pending     | int  | money in review
earned      | int  | money earned
unwithdrawn | int  | money unwithdrawn

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Get administrator

> Get administrator:

```shell
curl --request GET \
  --url https://betaapi.cardbo.info/api/v5/administrator \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/administrator'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.post(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.post('https://prodapi.cardbo.info/api/v5/administrator', {
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
    "administrator_id": "5fa79ec32ba2dfe2db67ae2c",
    "account": "administrator_account",
    "username": "Harrison",
    "level": 2,
    "email": "harrison@cardbo.info",
    "phone_number": "0987654321",
    "facebook_link": "https://www.facebook.com/profile.php?id=0000000000",
    "job_statistics": {
      "store_pending_count": 0,
      "store_finished_count": 0,
      "card_pending_count": 0,
      "card_finished_count": 0,
      "offer_pending_count": 0,
      "offer_finished_count": 0
    },
    "money": {
      "pending": 0,
      "earned": 0
    },
    "last_login": 1617601542000,
    "created_at": 1617601542000,
    "updated_at": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Get administrator by administrator's API auth token

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://prodapi.cardbo.info/api/v5/administrator`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key              | Type          | Enums                                             | Description
---------------- | ------------- | ------------------------------------------------- | -----------
administrator_id | string        |                                                   | administrator id
account          | string        |                                                   | account
username         | string        |                                                   | username
level            | int           | EMPLOYEE: `1` <br/> MANAGER: `2` <br/> ADMIN: `3` | administrator level
email            | string        |                                                   | email
phone_number     | string        |                                                   | phone number
facebook_link    | string        |                                                   | facebool link
job_statistics   | JobStatistics |                                                   | job statistics
money            | Monney        |                                                   | money info
last_login       | int           |                                                   | last login time in 16 digits timestamp
created_at       | int           |                                                   | User create time in 16 digits timestamp
updated_at       | int           |                                                   | User update time in 16 digits timestamp

JobStatistics

Key                  | Type | Description
-------------------- | ---- | -----------
store_pending_count  | int  | number of store pending
store_finished_count | int  | number of store finished
card_pending_count   | int  | number of  card pending
card_finished_count  | int  | number of card finished
offer_pending_count  | int  | number of offer pending
offer_finished_count | int  | number of offer finished

Monney

Key         | Type | Description
----------- | ---- | -----------
pending     | int  | money in review
earned      | int  | money earned
unwithdrawn | int  | money unwithdrawn

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Delete administrator

> Delete administrator:

```shell
curl --request DELETE \
  --url https://betaapi.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.delete(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.delete('https://prodapi.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c', {
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
    "administrator_id": "5fa79ec32ba2dfe2db67ae2c",
    "account": "administrator_account",
    "username": "Harrison",
    "level": 2,
    "email": "harrison@cardbo.info",
    "phone_number": "0987654321",
    "facebook_link": "https://www.facebook.com/profile.php?id=0000000000",
    "job_statistics": {
      "store_pending_count": 0,
      "store_finished_count": 0,
      "card_pending_count": 0,
      "card_finished_count": 0,
      "offer_pending_count": 0,
      "offer_finished_count": 0
    },
    "money": {
      "pending": 0,
      "earned": 0
    },
    "last_login": 1617601542000,
    "created_at": 1617601542000,
    "updated_at": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Delete a administrator

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`DELETE https://prodapi.cardbo.info/api/v5/administrator/{administrator_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter        | Description
---------------- | -----------
administrator_id | administrator id

### Response

#### Success

Key              | Type          | Enums                                             | Description
---------------- | ------------- | ------------------------------------------------- | -----------
administrator_id | string        |                                                   | administrator id
account          | string        |                                                   | account
username         | string        |                                                   | username
level            | int           | EMPLOYEE: `1` <br/> MANAGER: `2` <br/> ADMIN: `3` | administrator level
email            | string        |                                                   | email
phone_number     | string        |                                                   | phone number
facebook_link    | string        |                                                   | facebool link
job_statistics   | JobStatistics |                                                   | job statistics
money            | Monney        |                                                   | money info
last_login       | int           |                                                   | last login time in 16 digits timestamp
created_at       | int           |                                                   | User create time in 16 digits timestamp
updated_at       | int           |                                                   | User update time in 16 digits timestamp

JobStatistics

Key                  | Type | Description
-------------------- | ---- | -----------
store_pending_count  | int  | number of store pending
store_finished_count | int  | number of store finished
card_pending_count   | int  | number of  card pending
card_finished_count  | int  | number of card finished
offer_pending_count  | int  | number of offer pending
offer_finished_count | int  | number of offer finished

Monney

Key         | Type | Description
----------- | ---- | -----------
pending     | int  | money in review
earned      | int  | money earned
unwithdrawn | int  | money unwithdrawn

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Get employee list

> Get employee list:

```shell
curl --request GET \
  --url https://betaapi.cardbo.info/api/v5/administrator/employees?options=account&options=name \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/administrator/employees?options=account&options=name'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.delete(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.delete('https://prodapi.cardbo.info/api/v5/administrator/employees?options=account&options=name', {
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
  "result": [
    {
      "administrator_id": "5fa79ec32ba2dfe2db67ae2c",
      "account": "administrator_account",
      "username": "Harrison"
    }
  ],
  "timestamp": 1617601542000
}
```

Delete a administrator

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://prodapi.cardbo.info/api/v5/administrator/employees`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Queries

Query   | Required | Muti-values | Enums                                             | Description
------- | -------- | ----------- | ------------------------------------------------- | -----------
options | false    | true        | `account`, `username`, `level`, `email`, `phone_number`, `facebook_link`, `job_statistics`, `money`, `last_login`, `created_at`, `updated_at` | Administrator account

### Response

#### Success

Key              | Type          | Enums                                             | Description
---------------- | ------------- | ------------------------------------------------- | -----------
administrator_id | string        |                                                   | administrator id
account          | string        |                                                   | account
username         | string        |                                                   | username
level            | int           | EMPLOYEE: `1` <br/> MANAGER: `2` <br/> ADMIN: `3` | administrator level
email            | string        |                                                   | email
phone_number     | string        |                                                   | phone number
facebook_link    | string        |                                                   | facebool link
job_statistics   | JobStatistics |                                                   | job statistics
money            | Monney        |                                                   | money info
last_login       | int           |                                                   | last login time in 16 digits timestamp
created_at       | int           |                                                   | User create time in 16 digits timestamp
updated_at       | int           |                                                   | User update time in 16 digits timestamp

JobStatistics

Key                  | Type | Description
-------------------- | ---- | -----------
store_pending_count  | int  | number of store pending
store_finished_count | int  | number of store finished
card_pending_count   | int  | number of  card pending
card_finished_count  | int  | number of card finished
offer_pending_count  | int  | number of offer pending
offer_finished_count | int  | number of offer finished

Monney

Key         | Type | Description
----------- | ---- | -----------
pending     | int  | money in review
earned      | int  | money earned
unwithdrawn | int  | money unwithdrawn

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Update administrator level

> Update administrator level:

```shell
curl --request PUT \
  --url https://betaapi.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/level \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "level": 1
  }'
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/level'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'level': 1
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  level: 2
}
axios.delete('https://prodapi.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/level', data, {
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
    "administrator_id": "5fa79ec32ba2dfe2db67ae2c",
    "account": "administrator_account",
    "username": "Harrison",
    "level": 2,
    "email": "harrison@cardbo.info",
    "phone_number": "0987654321",
    "facebook_link": "https://www.facebook.com/profile.php?id=0000000000",
    "job_statistics": {
      "store_pending_count": 0,
      "store_finished_count": 0,
      "card_pending_count": 0,
      "card_finished_count": 0,
      "offer_pending_count": 0,
      "offer_finished_count": 0
    },
    "money": {
      "pending": 0,
      "earned": 0
    },
    "last_login": 1617601542000,
    "created_at": 1617601542000,
    "updated_at": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Update administrator level

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://prodapi.cardbo.info/api/v5/administrator/{administrator_id}/level`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter        | Description
---------------- | -----------
administrator_id | administrator id

#### Parameters

Parameter | Required | Type   | Enums                                             | Description
--------- | -------- | ------ | ------------------------------------------------- | -----------
level     | true     | string | EMPLOYEE: `1` <br/> MANAGER: `2` <br/> ADMIN: `3` | Administrator level

### Response

#### Success

Key              | Type          | Enums                                             | Description
---------------- | ------------- | ------------------------------------------------- | -----------
administrator_id | string        |                                                   | administrator id
account          | string        |                                                   | account
username         | string        |                                                   | username
level            | int           | EMPLOYEE: `1` <br/> MANAGER: `2` <br/> ADMIN: `3` | administrator level
email            | string        |                                                   | email
phone_number     | string        |                                                   | phone number
facebook_link    | string        |                                                   | facebool link
job_statistics   | JobStatistics |                                                   | job statistics
money            | Monney        |                                                   | money info
last_login       | int           |                                                   | last login time in 16 digits timestamp
created_at       | int           |                                                   | User create time in 16 digits timestamp
updated_at       | int           |                                                   | User update time in 16 digits timestamp

JobStatistics

Key                  | Type | Description
-------------------- | ---- | -----------
store_pending_count  | int  | number of store pending
store_finished_count | int  | number of store finished
card_pending_count   | int  | number of  card pending
card_finished_count  | int  | number of card finished
offer_pending_count  | int  | number of offer pending
offer_finished_count | int  | number of offer finished

Monney

Key         | Type | Description
----------- | ---- | -----------
pending     | int  | money in review
earned      | int  | money earned
unwithdrawn | int  | money unwithdrawn

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Update administrator password

> Update administrator password:

```shell
curl --request PUT \
  --url https://betaapi.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/password \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "password": "old_password",
    "new_password": "new_password"
  }'
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/password'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'password': 'old_password',
  'new_password': 'new_password'
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  password: 'old_password',
  new_password: 'new_password'
}
axios.put('https://prodapi.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/password', data, {
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
  "result": "",
  "timestamp": 1617601542000
}
```

Update administrator password

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://prodapi.cardbo.info/api/v5/administrator/{administrator_id}/password`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter        | Description
---------------- | -----------
administrator_id | administrator id

#### Parameters

Parameter    | Required | Type   | Description
------------ | -------- | ------ | -----------
password     | true     | string | old password
new_password | true     | string | new password

### Response

#### Success

Key    | Type   | Description
------ | ------ | -----------
result | string | result message

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Update administrator profile

> Update administrator profile:

```shell
curl --request PUT \
  --url https://betaapi.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/profile \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "password": "old_password",
    "new_password": "new_password"
  }'
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/profile'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'email': 'harrison@cardbo.info'
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  email: "harrison@cardbo.info"
}
axios.put('https://prodapi.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/profile', data, {
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
    "administrator_id": "5fa79ec32ba2dfe2db67ae2c",
    "account": "administrator_account",
    "username": "Harrison",
    "level": 2,
    "email": "harrison@cardbo.info",
    "phone_number": "0987654321",
    "facebook_link": "https://www.facebook.com/profile.php?id=0000000000",
    "job_statistics": {
      "store_pending_count": 0,
      "store_finished_count": 0,
      "card_pending_count": 0,
      "card_finished_count": 0,
      "offer_pending_count": 0,
      "offer_finished_count": 0
    },
    "money": {
      "pending": 0,
      "earned": 0
    },
    "last_login": 1617601542000,
    "created_at": 1617601542000,
    "updated_at": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Update administrator profile

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://prodapi.cardbo.info/api/v5/administrator/{administrator_id}/profile`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter        | Description
---------------- | -----------
administrator_id | administrator id

#### Parameters

Parameter     | Required | Type   | Description
------------- | -------- | ------ | -----------
username      | false    | string | username
email         | false    | string | email
phone_number  | false    | string | phone number
facebook_link | false    | string | facebook profile link

### Response

#### Success

Key              | Type          | Enums                                             | Description
---------------- | ------------- | ------------------------------------------------- | -----------
administrator_id | string        |                                                   | administrator id
account          | string        |                                                   | account
username         | string        |                                                   | username
level            | int           | EMPLOYEE: `1` <br/> MANAGER: `2` <br/> ADMIN: `3` | administrator level
email            | string        |                                                   | email
phone_number     | string        |                                                   | phone number
facebook_link    | string        |                                                   | facebool link
job_statistics   | JobStatistics |                                                   | job statistics
money            | Monney        |                                                   | money info
last_login       | int           |                                                   | last login time in 16 digits timestamp
created_at       | int           |                                                   | User create time in 16 digits timestamp
updated_at       | int           |                                                   | User update time in 16 digits timestamp

JobStatistics

Key                  | Type | Description
-------------------- | ---- | -----------
store_pending_count  | int  | number of store pending
store_finished_count | int  | number of store finished
card_pending_count   | int  | number of  card pending
card_finished_count  | int  | number of card finished
offer_pending_count  | int  | number of offer pending
offer_finished_count | int  | number of offer finished

Monney

Key         | Type | Description
----------- | ---- | -----------
pending     | int  | money in review
earned      | int  | money earned
unwithdrawn | int  | money unwithdrawn

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Reset employee password

> Update administrator password:

```shell
curl --request PUT \
  --url https://betaapi.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/reset_password \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://prodapi.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/reset_password'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.put(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.put('https://prodapi.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/reset_password', {
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
    "administrator_id": "5fa79ec32ba2dfe2db67ae2c",
    "account": "administrator_account",
    "username": "Harrison",
    "level": 1,
    "email": "harrison@cardbo.info",
    "phone_number": "0987654321",
    "facebook_link": "https://www.facebook.com/profile.php?id=0000000000",
    "job_statistics": {
      "store_pending_count": 0,
      "store_finished_count": 0,
      "card_pending_count": 0,
      "card_finished_count": 0,
      "offer_pending_count": 0,
      "offer_finished_count": 0
    },
    "money": {
      "pending": 0,
      "earned": 0
    },
    "last_login": 1617601542000,
    "created_at": 1617601542000,
    "updated_at": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Update administrator password

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://prodapi.cardbo.info/api/v5/administrator/{administrator_id}/reset_password`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter        | Description
---------------- | -----------
administrator_id | administrator id

### Response

#### Success

Key              | Type          | Enums                                             | Description
---------------- | ------------- | ------------------------------------------------- | -----------
administrator_id | string        |                                                   | administrator id
account          | string        |                                                   | account
username         | string        |                                                   | username
level            | int           | EMPLOYEE: `1` <br/> MANAGER: `2` <br/> ADMIN: `3` | administrator level
email            | string        |                                                   | email
phone_number     | string        |                                                   | phone number
facebook_link    | string        |                                                   | facebool link
job_statistics   | JobStatistics |                                                   | job statistics
money            | Monney        |                                                   | money info
last_login       | int           |                                                   | last login time in 16 digits timestamp
created_at       | int           |                                                   | User create time in 16 digits timestamp
updated_at       | int           |                                                   | User update time in 16 digits timestamp

JobStatistics

Key                  | Type | Description
-------------------- | ---- | -----------
store_pending_count  | int  | number of store pending
store_finished_count | int  | number of store finished
card_pending_count   | int  | number of  card pending
card_finished_count  | int  | number of card finished
offer_pending_count  | int  | number of offer pending
offer_finished_count | int  | number of offer finished

Monney

Key         | Type | Description
----------- | ---- | -----------
pending     | int  | money in review
earned      | int  | money earned
unwithdrawn | int  | money unwithdrawn

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message
