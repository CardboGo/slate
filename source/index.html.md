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

# Schema

## User

Key          | Type          | Enums                                            | Description
------------ | ------------- | ------------------------------------------------ | -----------
user_id      | string        |                                                  | User id
line_id      | string        |                                                  | LINE id
username     | string        |                                                  | Username
image        | string        |                                                  | User image
email        | string        |                                                  | Email
phone_number | string        |                                                  | Phone number
cardbo_point | int           |                                                  | Cardbo point (useless)
cards        | []CardDisplay |                                                  | User own card array
mobilepays   | []Mobilepay   |                                                  | User own mobile pay array
user_level   | int           | GENERAL: `1` <br/> VIP: `2` <br/> DEVELOPER: `3` | User level
created_at   | int           |                                                  | create time in timestamp
updated_at   | int           |                                                  | update time in timestamp
last_login   | int           |                                                  | User last login time in timestamp

## CardUserReward

Key         | Type        | Description
----------- | ----------- | -----------
card        | CardDisplay | CardDisplay object
user_reward | UserReward  | UserReward object

## MobilePayExpense

Key       | Type      | Description
--------- | --------- | -----------
mobilepay | MobilePay | MobilePay object
expense   | int       | expense value

## UserReward

Key                | Type        | Enums      | Description
------------------ | ----------- | ---------- | -----------
reward_id          | string      |            | reward id
user               | User        |            | User object
card               | CardDisplay |            | CardDisplay object
offer              | Offer       |            | Offer object
reward_value       | float       |            | offer reward value per unit
reward_name        | string      |            | offer cashback reward name
reward_upper_bound | int         |            | offer cashback upper bound
pinned             | bool        |            | is the reward pinned to the summary page
year               | int         |            | year of the reward
month              | int         | [`1`-`12`] | month of the reward
expense            | int         |            | expense of the month
reward             | float       |            | total reward which user get of the month
created_at         | int         |            | create time in timestamp
updated_at         | int         |            | update time in timestamp

## Administrator

Key              | Type   | Enums                                             | Description
---------------- | ------ | ------------------------------------------------- | -----------
administrator_id | string |                                                   | administrator id
account          | string |                                                   | account
username         | string |                                                   | username
level            | int    | EMPLOYEE: `1` <br/> MANAGER: `2` <br/> ADMIN: `3` | administrator level
email            | string |                                                   | email
phone_number     | string |                                                   | phone number
last_login       | int    |                                                   | last login time in timestamp
created_at       | int    |                                                   | create time in timestamp
updated_at       | int    |                                                   | update time in timestamp

## Bank

Key     | Type    | Description
------- | ------- | -----------
bank_id | string  | bank id
name    | string  | bank name
code    | string  | bank code  
logo    | string  | logo url
image   | string  | image url

## Card

Key        | Type         | Enums                                            | Description
---------- | ------------ | ------------------------------------------------ | -----------
card_id    | string       |                                                  | card id
name       | string       |                                                  | card name
bank       | Bank         |                                                  | Bank object
options    | []CardOption |                                                  | CardOption object
images     | CardImage    |                                                  | CardImage object
promote    | bool         |                                                  | is the card promoted
website    | string       |                                                  | card official website
creator    | string       |                                                  | creator id
examiner   | string       |                                                  | examiner id
created_at | string       |                                                  | created timestamp
updated_at | string       |                                                  |updated timestamp
status     | int          | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status
comment    | string       |                                                  | failure comment
user_has   | bool         |                                                  | does user has the card or not

## CardOption

Key        | Type    | Enums                                                        | Description
---------- | ------- | ------------------------------------------------------------ | -----------
issuer     | string  | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | int     | [`1`-`8`]                                                    | level of the card
level_name | string  |                                                              | level name of the card

## CardImage

Key      | Type   | Description
-------- | ------ | -----------
image_1  | string | image URL
image_2  | string | image URL
image_3  | string | image URL
image_4  | string | image URL
image_5  | string | image URL
image_6  | string | image URL
image_7  | string | image URL
image_8  | string | image URL
image_9  | string | image URL
image_10 | string | image URL

## CardDisplay

Key        | Type    | Enums                                                        | Description
---------- | ------- | ------------------------------------------------------------ | -----------
card_id    | string  |                                                              | card id
name       | string  |                                                              | card name
bank       | Bank    |                                                              | bank information
image      | string  |                                                              | image URL
issuer     | string  | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | int     | [`1`-`8`]                                                    | level of the card
level_name | string  |                                                              | level name of the card

## MobilePay

Key          | Type    | Description
------------ | ------- | -----------
mobilepay_id | string  | mobilepay id
name         | string  | mobilepay name
image        | string  | mobilepay image URL

## Offer

Key                     | Type         | Enums | Description
----------------------- | ------------ | ----- | -----------
offer_id                | string       | | offer id
option                  | string       | | option name of the offer
option_binding          | []string     | | array of offer id that binding the option
bank                    | Bank         | | Bank object
cards                   | []OfferCard  | | cards having the offer
mobilepays              | []MobilePay  | | mobilepays having the offer
independent_to_card     | bool         | | is the mobilepay offer independent to card (only for mobilepay offer)
places                  | []Store      | | stores that can get the offer
included_places         | []Store      | | stores that can get the offer
excluded_places         | []Store      | | stores that ar excluded from the offer
categories              | []string     | | offer categories
url                     | string       | | offer source URL
start_date              | int          | | offer start date in timestamp
end_date                | int          | | offer end date in timestamp
tags                    | []Tag        | | offer tags
is_independent_reward   | bool         | | if offer is independent rewards (cannot be accumulated with non independent offers)
reward_type             | int          | CASHBACK_PERCENTAGE: `1` <br/> CASHBACK_FIXED: `2` | reward type
condition               | string       | | offer condition
mobile_pay_binding      | []MobilePay  | | mobilepay needed to binding
weekday                 | []int        | [`1`-`7`] | weekday that can get the offer
time                    | string       | | time that can get the offer
channel                 | string       | | channel to get the offer
pay_method              | []MobilePay  | | mobilepay needed to use to get the offer
register_needed         | bool         | | is offer need to register
coupon_needed           | bool         | | is offer need to use the coupon
min_cost                | OfferMinCost | | min cost to get the offer
account_binding_needed  | bool         | | is needed to bind account to get the offer
installment_required    | bool         | | is needed to have installment to get the offer
installment_acceptable  | bool         | | can installment to get the offer
installment_reward_type | int          | `依分期回饋`, `統一回饋` | the type of installment reward
prior_event             | string       | | prior event condition to get the offer
user_type               | string       | | user type to get the offer
other_condition         | string       | | other condition to get the offer
upper_bound_description | string       | | the deccription of all the upper bounds
cash_upper_bound        | int          | | cashback upper bound value
cash_upper_bound_unit   | string       | `筆`, `日`, `期`, `週`, `月`, `季`, `年`, `半年`, `檔期`, `總共` | cashback upper bound unit
time_upper_bound        | int          | | time upper bound value
time_upper_bound_unit   | string       | `筆`, `日`, `期`, `週`, `月`, `季`, `年`, `半年`, `檔期`, `總共` | time upper bound unit
frequency_upper_bound   | int          | | frequency upper bound value
sharing_upper_bound     | []string     | | array of offer id that share the cashback upper bound
reward_content          | string       | | the content of the reward
reward_description      | string       | | product description of the offer
reward_name             | string       | | reward name of the offer
reward_value            | float        | | reward value of the offer
creator                 | string       | | creator administrator id
created_at              | int          | | create time in timestamp
updated_at              | int          | | update time in timestamp
examiner                | string       | | examiner  administrator id
examined_at             | int          | | examine time in timestamp
status                  | int          | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status
comment                 | string       | | comment for administrator

## OfferCard

Key        | Type    | Enums                                                        | Description
---------- | ------- | ------------------------------------------------------------ | -----------
card_id    | string  |                                                              | card id
issuer     | string  | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | int     | [`1`-`8`]                                                    | level of the card

## OfferMinCost

Key         | Type   | Enums | Description
----------- | ------ | ----- | -----------
unit_number | int    | | unit numner of the min cost
unit        | string | `筆`, `日`, `期`, `週`, `月`, `季`, `年`, `半年`, `檔期`, `總共` | unit of the min cost
restriction | string | `個別滿`, `總共滿`, `每滿` | min cost restriction
amount      | int    | | amount of the min cost

## OfferRecommendation

Key                  | Type      | Enums     | Description
-------------------- | --------- | --------- | -----------
card                 | Card      |           | Card object
mobilepay            | MobilePay |           | MobilePay object
offers               | []Offer   |           | array of Offer object
rating               | float     |           | card rating from 0 to 1
star                 | int       | [`1`-`5`] | number of star convert from rating from 1 to 5
max_cashback         | float     |           | max cashback value accumulated from all offers
max_cashback_offers  | []string  |           | array of offer id which is including in max cashback
cashback_upper_bound | int       |           | min cashback upper bound from all offers
cashback_amount      | int       |           | amount getting from max cashback

## AccountingRecord

Key           | Type               | Description
------------- | ------------------ | -----------
accounting_id | string             | accotungin id
user          | User               | User object
card          | Card               | Card object
mobilepay     | MobilePay          | MobilePay object
invoice       | Invoice            | Invoice object
amount        | int                | how much money of the record
name          | string             | description of the record
store         | Store              | Store object
store_name    | string             | store name when the store is not in our database
date          | int                | date of the expese in timestamp
rewards       | []AccountingReward | array of AccountingReward object
pending       | string             | is the record in pending or not
created_at    | int                | create time in timestamp
updated_at    | int                | update time in timestamp

## AccountingReward

Key          | Type   | Description
------------ | ------ | -----------
offer_id     | string | offer id
reward_name  | string | offer cashback reward name
reward_value | float  | reward value get from the expense

# 1. Authentication

## 1-1. Administrator

> Login administrator:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v5/auth/administrator \
  -H 'Content-Type: application/json' \
  --data '{
    "account": "{account}",
    "password": "{password}"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/auth/administrator'
data = {
  'account': '{account}',
  'password': '{password}'
}
response = requests.post(url, json=data)
```

```javascript
const axios = require('axios');

axios.post('https://api.cardbo.info/api/v5/auth/administrator', {
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

`POST https://api.cardbo.info/api/v5/auth/administrator`

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

## 1-2. LineBot

> Login linebot:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v5/auth/linebot \
  -H 'Content-Type: application/json' \
  --data '{
    "source": 1,
    "user_id": "5fcd3c76e549avb2805e7fe0"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/auth/linebot'
data = {
  'source': 1,
  'user_id': '5fcd3c76e549avb2805e7fe0'
}
response = requests.post(url, json=data)
```

```javascript
const axios = require('axios');

axios.post('https://api.cardbo.info/api/v5/auth/linebot', {
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

`POST https://api.cardbo.info/api/v5/auth/linebot`

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

## 1-3. Line Login

> Login from LINE:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v5/auth/line \
  -H 'Content-Type: application/json' \
  --data '{
    "source": 1,
    "access_token": "{access_token}"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/auth/line'
data = {
  'source': 1,
  'access_token': '{access_token}'
}
response = requests.post(url, json=data)
```

```javascript
const axios = require('axios');

axios.post('https://api.cardbo.info/api/v5/auth/line', {
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

`POST https://api.cardbo.info/api/v5/auth/line`

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

## 1-4. Auth Refresh

> Refresh auth token:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v5/auth/refresh \
  -H 'Authorization: Bearer meowmeowmeowrefresh' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/auth/refresh'
headers = {'Authorization': 'Bearer meowmeowmeowrefresh'}
response = requests.post(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowrefresh'}
axios.post('https://api.cardbo.info/api/v5/auth/refresh', {
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

`POST https://api.cardbo.info/api/v5/auth/refresh`

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

# 2. User

## 2-1. Get user profile

> Get user profile:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v5/user \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/user'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v5/user', {
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

`GET https://api.cardbo.info/api/v5/user`

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
created_at   | int         |                                                  | create time in timestamp
updated_at   | int         |                                                  | update time in timestamp
last_login   | int         |                                                  | User last login time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 2-2. Update user information

> Update user information:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user \
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

url = 'https://api.cardbo.info/api/v5/user'
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
axios.put('https://api.cardbo.info/api/v5/user', data, {
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

`PUT https://api.cardbo.info/api/v5/user`

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
created_at   | int         |                                                  | create time in timestamp
updated_at   | int         |                                                  | update time in timestamp
last_login   | int         |                                                  | User last login time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 2-3. Add user card

> Add card:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user/add_card \
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

url = 'https://api.cardbo.info/api/v5/user/add_card'
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
axios.put('https://api.cardbo.info/api/v5/user/add_card', data, {
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

`PUT https://api.cardbo.info/api/v5/user/add_card`

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

## 2-4. Remove user card

> Remove card:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user/remove_card \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card_id": "5fdb2ff846a97b49dac8a6b3"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/user/remove_card'
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
axios.put('https://api.cardbo.info/api/v5/user/remove_card', data, {
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

`PUT https://api.cardbo.info/api/v5/user/remove_card`

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

## 2-5. Update user mobile pays

> Update mobile pays:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user/mobilepays \
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

url = 'https://api.cardbo.info/api/v5/user/mobilepays'
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
axios.put('https://api.cardbo.info/api/v5/user/mobilepays', data, {
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

`PUT https://api.cardbo.info/api/v5/user/mobilepays`

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

## 2-6. Add user mobile pay

> Add mobile pay:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user/add_mobilepay \
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

url = 'https://api.cardbo.info/api/v5/user/add_mobilepay'
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
axios.put('https://api.cardbo.info/api/v5/user/add_mobilepay', data, {
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

`PUT https://api.cardbo.info/api/v5/user/add_mobilepay`

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

## 2-7. Remove user mobile pay

> Remove mobile pay:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user/remove_mobilepay \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "mobilepay_id": "5f9a747f10c24bf3d4a54d4e"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/user/remove_mobilepay'
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
axios.put('https://api.cardbo.info/api/v5/user/remove_mobilepay', data, {
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

`PUT https://api.cardbo.info/api/v5/user/remove_mobilepay`

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

## 2-8. Add card to user mobile pay

> Add card to mobile pay:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user/mobilepay/add_card \
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

url = 'https://api.cardbo.info/api/v5/user/mobilepay/add_card'
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
axios.put('https://api.cardbo.info/api/v5/user/mobilepay/add_card', data, {
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

`PUT https://api.cardbo.info/api/v5/user/mobilepay/add_card`

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

## 2-9. Remove card from user mobile pay

> Remove card from mobile pay:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user/mobilepay/remove_card \
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

url = 'https://api.cardbo.info/api/v5/user/mobilepay/remove_card'
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
axios.put('https://api.cardbo.info/api/v5/user/mobilepay/remove_card', data, {
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

`PUT https://api.cardbo.info/api/v5/user/mobilepay/remove_card`

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

## 2-10. Update user level

> Update user level:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user/user_level \
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

url = 'https://api.cardbo.info/api/v5/user/user_level'
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
axios.put('https://api.cardbo.info/api/v5/user/user_level', data, {
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

`PUT https://api.cardbo.info/api/v5/user/user_level`

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

## 2-11. Get user accounting summary

> Get user accounting summary:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/user/accounting \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/user/accounting'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v5/user/accounting', {
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
    "user": {
      "user_info": "..."
    },
    "total_expense": 0,
    "total_reward": 0,
    "card_user_rewards": [
      {
        "card": {
          "card_info": "..."
        },
        "user_reward": {
          "reward_id": "5fcd3c76e549avb2805e7fe0",
          "offer": {
            "offer_id": "5fcd3c76e549avb2805e7fe0"
          },
          "reward_value": 1.5,
          "reward_name": "現金",
          "reward_upper_bound": 500,
          "year": 2021,
          "month": 1,
          "expense": 1000,
          "reward": 15.0,
          "created_at": 1617601542000,
          "updated_at": 1617601542000
        }
      }
    ],
    "mobilepay_expenses": [
      {
        "mobilepay": {
          "mobilepay_info": "..."
        },
        "expense": 1000
      }
    ]
  },
  "timestamp": 1617601542000
}
```

Get user accounting summary

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://api.cardbo.info/api/v5/user/accounting`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key                | Type             | Description
------------------ | ---------------- | -----------
user               | User             | User object
total_expense      | int              | monthly total expense
total_reward       | int              | monthly total reward
card_user_rewards  | CardUserReward   | CardUserReward object
mobilepay_expenses | MobilePayExpense | MobilePayExpense object

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 2-2. Set user carrier invoice

> Set user carrier invoice:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user/invoice \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "carrier": "/ABCD-F1",
    "verification_code": "AES_CFB_ENCODED_STRING"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/user/invoice'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "carrier": "/ABCD-F1",
  "verification_code": "AES_CFB_ENCODED_STRING"
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  carrier: "/ABCD-F1",
  verification_code: "AES_CFB_ENCODED_STRING"
}
axios.put('https://api.cardbo.info/api/v5/user/invoice', data, {
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
    "status": true
  },
  "timestamp": 1617601542000
}
```

Set user carrier invoice

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://api.cardbo.info/api/v5/user/invoice`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter         | Required | Type  | Description
----------------- | -------- | ----- | -----------
carrier           | true    | string | mobile pay carrier code
verification_code | true    | string | verification code in AES CFB encryption

### Response

#### Success

Key    | Type | Description
------ | ---- | -----------
status | bool | mobile pay carrier status

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# 3. Administrator

## 3-1. Create administrator

> Create administrator:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v5/administrator \
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

url = 'https://api.cardbo.info/api/v5/administrator'
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
axios.post('https://api.cardbo.info/api/v5/administrator', data, {
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

`POST https://api.cardbo.info/api/v5/administrator`

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
last_login       | int           |                                                   | last login time in timestamp
created_at       | int           |                                                   | create time in timestamp
updated_at       | int           |                                                   | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 3-2. Get administrator

> Get administrator:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v5/administrator \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/administrator'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.post(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.post('https://api.cardbo.info/api/v5/administrator', {
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

`GET https://api.cardbo.info/api/v5/administrator`

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
last_login       | int           |                                                   | last login time in timestamp
created_at       | int           |                                                   | create time in timestamp
updated_at       | int           |                                                   | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 3-3. Delete administrator

> Delete administrator:

```shell
curl --request DELETE \
  --url https://api.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.delete(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.delete('https://api.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c', {
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

`DELETE https://api.cardbo.info/api/v5/administrator/{administrator_id}`

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
last_login       | int           |                                                   | last login time in timestamp
created_at       | int           |                                                   | create time in timestamp
updated_at       | int           |                                                   | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 3-4. Get employee list

> Get employee list:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v5/administrator/employees?options=account&options=name \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/administrator/employees?options=account&options=name'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.delete(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.delete('https://api.cardbo.info/api/v5/administrator/employees?options=account&options=name', {
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

`GET https://api.cardbo.info/api/v5/administrator/employees`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Queries

Query   | Required | Muti-values | Enums                                             | Description
------- | -------- | ----------- | ------------------------------------------------- | -----------
options | false    | true        | `account`, `username`, `level`, `email`, `phone_number`, `last_login`, `created_at`, `updated_at` | employee response options

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
last_login       | int           |                                                   | last login time in timestamp
created_at       | int           |                                                   | create time in timestamp
updated_at       | int           |                                                   | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 3-5. Update administrator level

> Update administrator level:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/level \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "level": 1
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/level'
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
axios.delete('https://api.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/level', data, {
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

`GET https://api.cardbo.info/api/v5/administrator/{administrator_id}/level`

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
last_login       | int           |                                                   | last login time in timestamp
created_at       | int           |                                                   | create time in timestamp
updated_at       | int           |                                                   | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## Update administrator password

> Update administrator password:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/password \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "password": "old_password",
    "new_password": "new_password"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/password'
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
axios.put('https://api.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/password', data, {
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

`PUT https://api.cardbo.info/api/v5/administrator/{administrator_id}/password`

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

## 3-6. Update administrator profile

> Update administrator profile:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/profile \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "password": "old_password",
    "new_password": "new_password"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/profile'
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
axios.put('https://api.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/profile', data, {
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

`PUT https://api.cardbo.info/api/v5/administrator/{administrator_id}/profile`

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
last_login       | int           |                                                   | last login time in timestamp
created_at       | int           |                                                   | create time in timestamp
updated_at       | int           |                                                   | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 3-7. Reset employee password

> Update administrator password:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/reset_password \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/reset_password'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.put(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.put('https://api.cardbo.info/api/v5/administrator/5fa79ec32ba2dfe2db67ae2c/reset_password', {
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

`PUT https://api.cardbo.info/api/v5/administrator/{administrator_id}/reset_password`

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
last_login       | int           |                                                   | last login time in timestamp
created_at       | int           |                                                   | create time in timestamp
updated_at       | int           |                                                   | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# 4. Bank

## 4-1. Get banks

> Get banks data:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v5/banks?options=name&options=logo \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/banks?options=name&options=logo'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v5/banks?options=name&options=logo', {
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
      "bank_id": "5f756d85c2349d9139648a61",
      "name": "臺灣銀行",
      "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taiwan-bank.png",
      "image": "https://i.imgur.com/iUbOWfh.png",
      "code": "004"
    }
  ],
  "timestamp": 1617601542000
}
```

Get banks data

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://api.cardbo.info/api/v5/banks`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Queries

Query   | Required | Muti-values | Enums                           | Description
------- | -------- | ----------- | ------------------------------- | -----------
options | false    | true        | `name`, `code`, `logo`, `image` | bank response options

### Response

#### Success

Key     | Type    | Description | Note
------- | ------- | ----------- | ----
bank_id | string  | bank id     |
name    | string  | bank name   | optional
code    | string  | bank code   | optional
logo    | string  | logo url    | optional
image   | string  | image url   | optional

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# 5. Card

## 5-1. Get formal cards

> Get formal cards data:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v5/cards/formal?size=10&page=1&options=name&options=images \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/cards/formal?size=10&page=1&options=name&options=images'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v5/cards/formal?size=10&page=1&options=name&options=images', {
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
      "card_id": "5fc0998715eca4cbca34a1fe",
      "name": "台新@GoGo卡",
      "options": [
        {
          "issuer": "VISA",
          "level": 4,
          "level_name": "御璽卡"
        }
      ],
      "images": {
        "image_1": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1.png",
        "image_2": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-2.png",
        "image_3": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-3.png"
      },
      "promote": false,
      "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
      "bank": {
        "bank_id": "5f756d85c2349d9139648a81",
        "name": "台新銀行",
        "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taishin-bank.png",
        "image": "https://i.imgur.com/zueSUZY.png",
        "code": "812"
      },
      "creator": {
        "administrator_id": "5fa78dc32ba6dfe9db675a6d",
        "username": "Harrison"
      },
      "created_at": 1617601542000,
      "updated_at": 1617601542000,
      "examiner": {
        "administrator_id": "5fa78dc32ba6dfe9db675a6d",
        "username": "Harrison"
      },
      "status": 3,
      "comment": "",
      "user_has": false
    }
  ],
  "timestamp": 1617601542000
}
```

Get formal cards data

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://api.cardbo.info/api/v5/cards/formal`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Queries

Query    | Required | Muti-values | Enums                               | Description
-------- | -------- | ----------- | ----------------------------------- | -----------
size     | true     | false       |                                     | data size of each page
page     | true     | flase       |                                     | page number
creator  | false    | flase       |                                     | filtered creator `administrator_id`
examiner | false    | flase       |                                     | filtered examiner `administrator_id`
options  | false    | true        | `name`, `bank`, `options`, `images`, `promote`, `website`, `creator`, `created_at`, `updated_at`, `examiner`, `status`, `comment`, `user_has` | card response options

### Response

#### Success

Key        | Type    | Enums                                            | Description                   | Note
---------- | ------- | ------------------------------------------------ | ----------------------------- | ----
card_id    | string  |                                                  | card id                       |
name       | string  |                                                  | card name                     | optional
bank       | Bank    |                                                  | bank information              | optional
options    | string  |                                                  | logo url                      | optional
images     | string  |                                                  | image url                     | optional
promote    | bool    |                                                  | is the card promoted          | optional
website    | string  |                                                  | card official website         | optional
creator    | string  |                                                  | creator id                    | optional
examiner   | string  |                                                  | examiner id                   | optional
created_at | string  |                                                  | created timestamp             | optional
updated_at | string  |                                                  |updated timestamp              | optional
status     | int     | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status                        | optional
comment    | string  |                                                  | failure comment               | optional
user_has   | bool    |                                                  | does user has the card or not | optional

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-2. Get formal cards by bank id

> Get formal cards data by bank id:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v5/cards/formal/bank/5f756d85c2349d9139648a68?options=name&options=images \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/cards/formal/bank/5f756d85c2349d9139648a68?options=name&options=images'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v5/cards/formal/bank/5f756d85c2349d9139648a68?options=name&options=images', {
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
      "card_id": "5fc0998715eca4cbca34a1fe",
      "name": "台新@GoGo卡",
      "options": [
        {
          "issuer": "VISA",
          "level": 4,
          "level_name": "御璽卡"
        }
      ],
      "images": {
        "image_1": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1.png",
        "image_2": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-2.png",
        "image_3": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-3.png"
      },
      "promote": false,
      "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
      "bank": {
        "bank_id": "5f756d85c2349d9139648a81",
        "name": "台新銀行",
        "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taishin-bank.png",
        "image": "https://i.imgur.com/zueSUZY.png",
        "code": "812"
      },
      "creator": {
        "administrator_id": "5fa78dc32ba6dfe9db675a6d",
        "username": "Harrison"
      },
      "created_at": 1617601542000,
      "updated_at": 1617601542000,
      "examiner": {
        "administrator_id": "5fa78dc32ba6dfe9db675a6d",
        "username": "Harrison"
      },
      "status": 3,
      "comment": "",
      "user_has": false
    }
  ],
  "timestamp": 1617601542000
}
```

Get formal cards data by bank id

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://api.cardbo.info/api/v5/cards/formal/bank/{bank_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
bank_id   | bank id

#### Queries

Query    | Required | Muti-values | Enums                               | Description
-------- | -------- | ----------- | ----------------------------------- | -----------
options  | false    | true        | `name`, `bank`, `options`, `images`, `promote`, `website`, `creator`, `created_at`, `updated_at`, `examiner`, `status`, `comment`, `user_has` | card response options

### Response

#### Success

Key        | Type    | Enums                                            | Description                   | Note
---------- | ------- | ------------------------------------------------ | ----------------------------- | ----
card_id    | string  |                                                  | card id                       |
name       | string  |                                                  | card name                     | optional
bank       | Bank    |                                                  | bank information              | optional
options    | string  |                                                  | logo url                      | optional
images     | string  |                                                  | image url                     | optional
promote    | bool    |                                                  | is the card promoted          | optional
website    | string  |                                                  | card official website         | optional
creator    | string  |                                                  | creator id                    | optional
examiner   | string  |                                                  | examiner id                   | optional
created_at | string  |                                                  | created timestamp             | optional
updated_at | string  |                                                  |updated timestamp              | optional
status     | int     | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status                        | optional
comment    | string  |                                                  | failure comment               | optional
user_has   | bool    |                                                  | does user has the card or not | optional

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-3. Get promoted formal cards

> Get promoted formal cards data:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v5/cards/formal/promote?options=name&options=images \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/cards/formal/promote?options=name&options=images'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v5/cards/formal/promote?options=name&options=images', {
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
      "card_id": "5fc0998715eca4cbca34a1fe",
      "name": "台新@GoGo卡",
      "options": [
        {
          "issuer": "VISA",
          "level": 4,
          "level_name": "御璽卡"
        }
      ],
      "images": {
        "image_1": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1.png",
        "image_2": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-2.png",
        "image_3": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-3.png"
      },
      "promote": true,
      "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
      "bank": {
        "bank_id": "5f756d85c2349d9139648a81",
        "name": "台新銀行",
        "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taishin-bank.png",
        "image": "https://i.imgur.com/zueSUZY.png",
        "code": "812"
      },
      "creator": {
        "administrator_id": "5fa78dc32ba6dfe9db675a6d",
        "username": "Harrison"
      },
      "created_at": 1617601542000,
      "updated_at": 1617601542000,
      "examiner": {
        "administrator_id": "5fa78dc32ba6dfe9db675a6d",
        "username": "Harrison"
      },
      "status": 3,
      "comment": "",
      "user_has": false
    }
  ],
  "timestamp": 1617601542000
}
```

Get promoted formal cards data

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://api.cardbo.info/api/v5/cards/formal/promote`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Queries

Query    | Required | Muti-values | Enums                               | Description
-------- | -------- | ----------- | ----------------------------------- | -----------
options  | false    | true        | `name`, `bank`, `options`, `images`, `promote`, `website`, `creator`, `created_at`, `updated_at`, `examiner`, `status`, `comment`, `user_has` | card response options

### Response

#### Success

Key        | Type    | Enums                                            | Description                   | Note
---------- | ------- | ------------------------------------------------ | ----------------------------- | ----
card_id    | string  |                                                  | card id                       |
name       | string  |                                                  | card name                     | optional
bank       | Bank    |                                                  | bank information              | optional
options    | string  |                                                  | logo url                      | optional
images     | string  |                                                  | image url                     | optional
promote    | bool    |                                                  | is the card promoted          | optional
website    | string  |                                                  | card official website         | optional
creator    | string  |                                                  | creator id                    | optional
examiner   | string  |                                                  | examiner id                   | optional
created_at | string  |                                                  | created timestamp             | optional
updated_at | string  |                                                  |updated timestamp              | optional
status     | int     | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status                        | optional
comment    | string  |                                                  | failure comment               | optional
user_has   | bool    |                                                  | does user has the card or not | optional

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-4. Get formal cards with user has property

> Get formal cards data with user has property:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v5/cards/formal/user_has?options=name&options=images \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/cards/formal/user_has?options=name&options=images'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v5/cards/formal/user_has?options=name&options=images', {
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
      "card_id": "5fc0998715eca4cbca34a1fe",
      "name": "台新@GoGo卡",
      "options": [
        {
          "issuer": "VISA",
          "level": 4,
          "level_name": "御璽卡"
        }
      ],
      "images": {
        "image_1": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1.png",
        "image_2": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-2.png",
        "image_3": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-3.png"
      },
      "promote": true,
      "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
      "bank": {
        "bank_id": "5f756d85c2349d9139648a81",
        "name": "台新銀行",
        "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taishin-bank.png",
        "image": "https://i.imgur.com/zueSUZY.png",
        "code": "812"
      },
      "creator": {
        "administrator_id": "5fa78dc32ba6dfe9db675a6d",
        "username": "Harrison"
      },
      "created_at": 1617601542000,
      "updated_at": 1617601542000,
      "examiner": {
        "administrator_id": "5fa78dc32ba6dfe9db675a6d",
        "username": "Harrison"
      },
      "status": 3,
      "comment": "",
      "user_has": false
    }
  ],
  "timestamp": 1617601542000
}
```

Get promoted formal cards data

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://api.cardbo.info/api/v5/cards/formal/user_has`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Queries

Query    | Required | Muti-values | Enums                               | Description
-------- | -------- | ----------- | ----------------------------------- | -----------
options  | false    | true        | `name`, `bank`, `options`, `images`, `promote`, `website`, `creator`, `created_at`, `updated_at`, `examiner`, `status`, `comment`, `user_has` | card response options

### Response

#### Success

Key        | Type    | Enums                                            | Description                   | Note
---------- | ------- | ------------------------------------------------ | ----------------------------- | ----
card_id    | string  |                                                  | card id                       |
name       | string  |                                                  | card name                     | optional
bank       | Bank    |                                                  | bank information              | optional
options    | string  |                                                  | logo url                      | optional
images     | string  |                                                  | image url                     | optional
promote    | bool    |                                                  | is the card promoted          | optional
website    | string  |                                                  | card official website         | optional
creator    | string  |                                                  | creator id                    | optional
examiner   | string  |                                                  | examiner id                   | optional
created_at | string  |                                                  | created timestamp             | optional
updated_at | string  |                                                  |updated timestamp              | optional
status     | int     | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status                        | optional
comment    | string  |                                                  | failure comment               | optional
user_has   | bool    |                                                  | does user has the card or not | optional

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-5. Get formal card by card id

> Get single formal card data by card id:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9 \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9', {
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
    "card_id": "5fc0998715eca4cbca34a1fe",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-3.png"
    },
    "promote": false,
    "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
    "bank": {
      "bank_id": "5f756d85c2349d9139648a81",
      "name": "台新銀行",
      "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taishin-bank.png",
      "image": "https://i.imgur.com/zueSUZY.png",
      "code": "812"
    },
    "creator": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Get single formal card data by card id

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://api.cardbo.info/api/v5/card/formal/{card_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
card_id   | card id

### Response

#### Success

Key        | Type    | Enums                                            | Description
---------- | ------- | ------------------------------------------------ | -----------
card_id    | string  |                                                  | card id
name       | string  |                                                  | card name
bank       | Bank    |                                                  | bank information
options    | string  |                                                  | logo url
images     | string  |                                                  | image url
promote    | bool    |                                                  | is the card promoted
website    | string  |                                                  | card official website
creator    | string  |                                                  | creator id
examiner   | string  |                                                  | examiner id
created_at | string  |                                                  | created timestamp
updated_at | string  |                                                  |updated timestamp
status     | int     | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status
comment    | string  |                                                  | failure comment

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-6. Update formal card

> Update formal card information:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9 \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "bank": {
      "bank_id": "5f756d85c2349d9139648a69"
    }
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'bank': {
    'bank_id': '5f756d85c2349d9139648a69'
  }
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  bank: {
    bank_id: '5f756d85c2349d9139648a69'
  }
}
axios.put('https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9', data, {
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
    "card_id": "5fc0998715eca4cbca34a1fe",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-3.png"
    },
    "promote": false,
    "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
    "bank": {
      "bank_id": "5f756d85c2349d9139648a81",
      "name": "台新銀行",
      "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taishin-bank.png",
      "image": "https://i.imgur.com/zueSUZY.png",
      "code": "812"
    },
    "creator": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Update formal card information

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://api.cardbo.info/api/v5/card/formal/{card_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
card_id   | card id

#### Parameters

Parameter    | Required | Type      | Description
------------ | -------- | --------- | -----------
name         | false    | string    | card name
options      | false    | []Option  | card options
images       | false    | Image     | card images
website      | false    | string    | card official website url
bank         | false    | Bank      | bank information
max_cashback | false    | float     | max cashback from official website promotion
apply_url    | false    | string    | apply url

### Response

#### Success

Key        | Type    | Enums                                            | Description
---------- | ------- | ------------------------------------------------ | -----------
card_id    | string  |                                                  | card id
name       | string  |                                                  | card name
bank       | Bank    |                                                  | bank information
options    | string  |                                                  | logo url
images     | string  |                                                  | image url
promote    | bool    |                                                  | is the card promoted
website    | string  |                                                  | card official website
creator    | string  |                                                  | creator id
examiner   | string  |                                                  | examiner id
created_at | string  |                                                  | created timestamp
updated_at | string  |                                                  |updated timestamp
status     | int     | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status
comment    | string  |                                                  | failure comment

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-7. Delete formal card

> Delete formal card:

```shell
curl --request DELETE \
  --url https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9 \
  -H 'Authorization: Bearer meowmeowmeowaccess'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.delete(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.delete('https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9', {
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
    "card_id": "5fc0998715eca4cbca34a1fe",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-3.png"
    },
    "promote": false,
    "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
    "bank": {
      "bank_id": "5f756d85c2349d9139648a81",
      "name": "台新銀行",
      "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taishin-bank.png",
      "image": "https://i.imgur.com/zueSUZY.png",
      "code": "812"
    },
    "creator": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Delete formal card

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`DELETE https://api.cardbo.info/api/v5/card/formal/{card_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
card_id   | card id

### Response

#### Success

Key        | Type    | Enums                                            | Description
---------- | ------- | ------------------------------------------------ | -----------
card_id    | string  |                                                  | card id
name       | string  |                                                  | card name
bank       | Bank    |                                                  | bank information
options    | string  |                                                  | logo url
images     | string  |                                                  | image url
promote    | bool    |                                                  | is the card promoted
website    | string  |                                                  | card official website
creator    | string  |                                                  | creator id
examiner   | string  |                                                  | examiner id
created_at | string  |                                                  | created timestamp
updated_at | string  |                                                  |updated timestamp
status     | int     | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status
comment    | string  |                                                  | failure comment

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-8. Add formal card to promote

> Add formal card to promote:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9/add_promote \
  -H 'Authorization: Bearer meowmeowmeowaccess'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9/add_promote'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.put(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.put('https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9/add_promote', {
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
    "card_id": "5fc0998715eca4cbca34a1fe",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-3.png"
    },
    "promote": false,
    "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
    "bank": {
      "bank_id": "5f756d85c2349d9139648a81",
      "name": "台新銀行",
      "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taishin-bank.png",
      "image": "https://i.imgur.com/zueSUZY.png",
      "code": "812"
    },
    "creator": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Add formal card to promote

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://api.cardbo.info/api/v5/card/formal/{card_id}/add_promote`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
card_id   | card id

### Response

#### Success

Key        | Type    | Enums                                            | Description
---------- | ------- | ------------------------------------------------ | -----------
card_id    | string  |                                                  | card id
name       | string  |                                                  | card name
bank       | Bank    |                                                  | bank information
options    | string  |                                                  | logo url
images     | string  |                                                  | image url
promote    | bool    |                                                  | is the card promoted
website    | string  |                                                  | card official website
creator    | string  |                                                  | creator id
examiner   | string  |                                                  | examiner id
created_at | string  |                                                  | created timestamp
updated_at | string  |                                                  |updated timestamp
status     | int     | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status
comment    | string  |                                                  | failure comment

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-9. Remove formal card from promote

> Remove formal card from promote:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9/remove_promote \
  -H 'Authorization: Bearer meowmeowmeowaccess'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9/remove_promote'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.put(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.put('https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9/remove_promote', {
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
    "card_id": "5fc0998715eca4cbca34a1fe",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-3.png"
    },
    "promote": false,
    "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
    "bank": {
      "bank_id": "5f756d85c2349d9139648a81",
      "name": "台新銀行",
      "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taishin-bank.png",
      "image": "https://i.imgur.com/zueSUZY.png",
      "code": "812"
    },
    "creator": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Add formal card to promote

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://api.cardbo.info/api/v5/card/formal/{card_id}/remove_promote`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
card_id   | card id

### Response

#### Success

Key        | Type    | Enums                                            | Description
---------- | ------- | ------------------------------------------------ | -----------
card_id    | string  |                                                  | card id
name       | string  |                                                  | card name
bank       | Bank    |                                                  | bank information
options    | string  |                                                  | logo url
images     | string  |                                                  | image url
promote    | bool    |                                                  | is the card promoted
website    | string  |                                                  | card official website
creator    | string  |                                                  | creator id
examiner   | string  |                                                  | examiner id
created_at | string  |                                                  | created timestamp
updated_at | string  |                                                  |updated timestamp
status     | int     | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status
comment    | string  |                                                  | failure comment

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-10. Upload formal card image

> Upload formal card image:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9/image \
  -H 'Authorization: Bearer meowmeowmeowaccess'
  --data '{
    "image_key": "image_1",
    "data": "base64-encoded-string"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9/image'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "image_key": "image_1",
  "data": "base64-encoded-string"
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  image_key: "image_1",
  data: "base64-encoded-string"
}
axios.post('https://api.cardbo.info/api/v5/card/formal/5fdb2ff346a97b49dac8a6a9/image',data, {
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
    "card_id": "5fc0998715eca4cbca34a1fe",
    "url": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1"
  },
  "timestamp": 1617601542000
}
```

Upload formal card image

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://api.cardbo.info/api/v5/card/formal/{card_id}/image`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
card_id   | card id

#### Parameters

Parameter | Required | Type   | Enums       | Description
--------- | -------- | ------ | ----------- | -----------
image_key | true     | string | `image_1`, `image_2`, `image_3`, `image_4`, `image_5`, `image_6`, `image_7`, `image_8`, `image_9`, `image_10` | key value from `Image` property
data      | true     | string |             | image base64 encoded string

### Response

#### Success

Key     | Type    | Description
------- | ------- | -----------
card_id | string  | card id
url     | string  | image URL

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-11. Get pending cards

> Get pending cards data:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v5/cards/pending?size=10&page=1&options=name&options=images \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/cards/pending?size=10&page=1&options=name&options=images'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v5/cards/pending?size=10&page=1&options=name&options=images', {
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
      "card_id": "5fc0998715eca4cbca34a1fe",
      "name": "台新@GoGo卡",
      "options": [
        {
          "issuer": "VISA",
          "level": 4,
          "level_name": "御璽卡"
        }
      ],
      "images": {
        "image_1": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1.png",
        "image_2": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-2.png",
        "image_3": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-3.png"
      },
      "promote": false,
      "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
      "bank": {
        "bank_id": "5f756d85c2349d9139648a81",
        "name": "台新銀行",
        "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taishin-bank.png",
        "image": "https://i.imgur.com/zueSUZY.png",
        "code": "812"
      },
      "creator": {
        "administrator_id": "5fa78dc32ba6dfe9db675a6d",
        "username": "Harrison"
      },
      "created_at": 1617601542000,
      "updated_at": 1617601542000,
      "examiner": {
        "administrator_id": "5fa78dc32ba6dfe9db675a6d",
        "username": "Harrison"
      },
      "status": 3,
      "comment": "",
      "user_has": false
    }
  ],
  "timestamp": 1617601542000
}
```

Get pending cards data

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://api.cardbo.info/api/v5/cards/pending`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Queries

Query    | Required | Muti-values | Enums                               | Description
-------- | -------- | ----------- | ----------------------------------- | -----------
size     | true     | false       |                                     | data size of each page
page     | true     | flase       |                                     | page number
creator  | false    | flase       |                                     | filtered creator `administrator_id`
examiner | false    | flase       |                                     | filtered examiner `administrator_id`
options  | false    | true        | `name`, `bank`, `options`, `images`, `promote`, `website`, `creator`, `created_at`, `updated_at`, `examiner`, `status`, `comment`, `user_has` | card response options

### Response

#### Success

Key        | Type    | Enums                                            | Description                   | Note
---------- | ------- | ------------------------------------------------ | ----------------------------- | ----
card_id    | string  |                                                  | card id                       |
name       | string  |                                                  | card name                     | optional
bank       | Bank    |                                                  | bank information              | optional
options    | string  |                                                  | logo url                      | optional
images     | string  |                                                  | image url                     | optional
promote    | bool    |                                                  | is the card promoted          | optional
website    | string  |                                                  | card official website         | optional
creator    | string  |                                                  | creator id                    | optional
examiner   | string  |                                                  | examiner id                   | optional
created_at | string  |                                                  | created timestamp             | optional
updated_at | string  |                                                  |updated timestamp              | optional
status     | int     | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status                        | optional
comment    | string  |                                                  | failure comment               | optional
user_has   | bool    |                                                  | does user has the card or not | optional

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-12. Insert pending card

> Insert pending card:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v5/card/pending \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "bank": {
      "Bank_id": "5f756d85c2349d9139648a81"
    },
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
    "max_cashback": 10,
    "apply_url": "https://www.google.com"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/pending'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "bank": {
    "Bank_id": "5f756d85c2349d9139648a81"
  },
  "name": "台新@GoGo卡",
  "options": [
    {
      "issuer": "VISA",
      "level": 4,
      "level_name": "御璽卡"
    }
  ],
  "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
  "max_cashback": 10,
  "apply_url": "https://www.google.com"
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
    bank: {
      Bank_id: "5f756d85c2349d9139648a81"
    },
    name: "台新@GoGo卡",
    options: [
      {
        issuer: "VISA",
        level: 4,
        level_name: "御璽卡"
      }
    ],
    website: "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
    max_cashback: 10,
    apply_url: "https://www.google.com"
  }
axios.post('https://api.cardbo.info/api/v5/card/pending', data, {
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
    "card_id": "5fc0998715eca4cbca34a1fe",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-3.png"
    },
    "promote": false,
    "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
    "bank": {
      "bank_id": "5f756d85c2349d9139648a81",
      "name": "台新銀行",
      "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taishin-bank.png",
      "image": "https://i.imgur.com/zueSUZY.png",
      "code": "812"
    },
    "creator": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Insert a new card to pending card

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`POST https://api.cardbo.info/api/v5/card/pending`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter    | Required | Type      | Description
------------ | -------- | --------- | -----------
name         | false    | string    | card name
options      | false    | []Option  | card options
images       | false    | Image     | card images
website      | false    | string    | card official website url
bank         | false    | Bank      | bank information
max_cashback | false    | float     | max cashback from official website promotion
apply_url    | false    | string    | apply url

### Response

#### Success

Key        | Type    | Enums                                            | Description
---------- | ------- | ------------------------------------------------ | -----------
card_id    | string  |                                                  | card id
name       | string  |                                                  | card name
bank       | Bank    |                                                  | bank information
options    | string  |                                                  | logo url
images     | string  |                                                  | image url
promote    | bool    |                                                  | is the card promoted
website    | string  |                                                  | card official website
creator    | string  |                                                  | creator id
examiner   | string  |                                                  | examiner id
created_at | string  |                                                  | created timestamp
updated_at | string  |                                                  |updated timestamp
status     | int     | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status
comment    | string  |                                                  | failure comment

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-13. Get pending card by card id

> Get single pending card data by card id:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9 \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9', {
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
    "card_id": "5fc0998715eca4cbca34a1fe",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-3.png"
    },
    "promote": false,
    "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
    "bank": {
      "bank_id": "5f756d85c2349d9139648a81",
      "name": "台新銀行",
      "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taishin-bank.png",
      "image": "https://i.imgur.com/zueSUZY.png",
      "code": "812"
    },
    "creator": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Get single pending card data by card id

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://api.cardbo.info/api/v5/card/pending/{card_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
card_id   | card id

### Response

#### Success

Key        | Type    | Enums                                            | Description
---------- | ------- | ------------------------------------------------ | -----------
card_id    | string  |                                                  | card id
name       | string  |                                                  | card name
bank       | Bank    |                                                  | bank information
options    | string  |                                                  | logo url
images     | string  |                                                  | image url
promote    | bool    |                                                  | is the card promoted
website    | string  |                                                  | card official website
creator    | string  |                                                  | creator id
examiner   | string  |                                                  | examiner id
created_at | string  |                                                  | created timestamp
updated_at | string  |                                                  |updated timestamp
status     | int     | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status
comment    | string  |                                                  | failure comment

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-14. Update pending card

> Update pending card information:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9 \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "bank": {
      "bank_id": "5f756d85c2349d9139648a69"
    }
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'bank': {
    'bank_id': '5f756d85c2349d9139648a69'
  }
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  bank: {
    bank_id: '5f756d85c2349d9139648a69'
  }
}
axios.put('https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9', data, {
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
    "card_id": "5fc0998715eca4cbca34a1fe",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-3.png"
    },
    "promote": false,
    "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
    "bank": {
      "bank_id": "5f756d85c2349d9139648a81",
      "name": "台新銀行",
      "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taishin-bank.png",
      "image": "https://i.imgur.com/zueSUZY.png",
      "code": "812"
    },
    "creator": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Update pending card information

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://api.cardbo.info/api/v5/card/pending/{card_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
card_id   | card id

#### Parameters

Parameter    | Required | Type      | Description
------------ | -------- | --------- | -----------
name         | false    | string    | card name
options      | false    | []Option  | card options
images       | false    | Image     | card images
website      | false    | string    | card official website url
bank         | false    | Bank      | bank information
max_cashback | false    | float     | max cashback from official website promotion
apply_url    | false    | string    | apply url

### Response

#### Success

Key        | Type    | Enums                                            | Description
---------- | ------- | ------------------------------------------------ | -----------
card_id    | string  |                                                  | card id
name       | string  |                                                  | card name
bank       | Bank    |                                                  | bank information
options    | string  |                                                  | logo url
images     | string  |                                                  | image url
promote    | bool    |                                                  | is the card promoted
website    | string  |                                                  | card official website
creator    | string  |                                                  | creator id
examiner   | string  |                                                  | examiner id
created_at | string  |                                                  | created timestamp
updated_at | string  |                                                  |updated timestamp
status     | int     | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status
comment    | string  |                                                  | failure comment

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-15. Delete pending card

> Delete pending card:

```shell
curl --request DELETE \
  --url https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9 \
  -H 'Authorization: Bearer meowmeowmeowaccess'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.delete(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.delete('https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9', {
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
    "card_id": "5fc0998715eca4cbca34a1fe",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-3.png"
    },
    "promote": false,
    "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
    "bank": {
      "bank_id": "5f756d85c2349d9139648a81",
      "name": "台新銀行",
      "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taishin-bank.png",
      "image": "https://i.imgur.com/zueSUZY.png",
      "code": "812"
    },
    "creator": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Delete pending card

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`DELETE https://api.cardbo.info/api/v5/card/pending/{card_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
card_id   | card id

### Response

#### Success

Key        | Type    | Enums                                            | Description
---------- | ------- | ------------------------------------------------ | -----------
card_id    | string  |                                                  | card id
name       | string  |                                                  | card name
bank       | Bank    |                                                  | bank information
options    | string  |                                                  | logo url
images     | string  |                                                  | image url
promote    | bool    |                                                  | is the card promoted
website    | string  |                                                  | card official website
creator    | string  |                                                  | creator id
examiner   | string  |                                                  | examiner id
created_at | string  |                                                  | created timestamp
updated_at | string  |                                                  |updated timestamp
status     | int     | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status
comment    | string  |                                                  | failure comment

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-16. Pass pending card to formal card

> Pass pending card to formal card:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9/passed \
  -H 'Authorization: Bearer meowmeowmeowaccess'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9/passed'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.put(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.put('https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9/passed', {
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
    "card_id": "5fc0998715eca4cbca34a1fe",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-3.png"
    },
    "promote": false,
    "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
    "bank": {
      "bank_id": "5f756d85c2349d9139648a81",
      "name": "台新銀行",
      "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taishin-bank.png",
      "image": "https://i.imgur.com/zueSUZY.png",
      "code": "812"
    },
    "creator": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Pass pending card to formal card

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://api.cardbo.info/api/v5/card/pending/{card_id}/passed`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
card_id   | card id

### Response

#### Success

Key        | Type    | Enums                                            | Description
---------- | ------- | ------------------------------------------------ | -----------
card_id    | string  |                                                  | card id
name       | string  |                                                  | card name
bank       | Bank    |                                                  | bank information
options    | string  |                                                  | logo url
images     | string  |                                                  | image url
promote    | bool    |                                                  | is the card promoted
website    | string  |                                                  | card official website
creator    | string  |                                                  | creator id
examiner   | string  |                                                  | examiner id
created_at | string  |                                                  | created timestamp
updated_at | string  |                                                  |updated timestamp
status     | int     | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status
comment    | string  |                                                  | failure comment

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-17. Fail pending card

> Fail pending card:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9/failed \
  -H 'Authorization: Bearer meowmeowmeowaccess'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9/failed'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.put(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.put('https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9/failed', {
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
    "card_id": "5fc0998715eca4cbca34a1fe",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-3.png"
    },
    "promote": false,
    "website": "https://www.taishinbank.com.tw/TSB/personal/credit/intro/overview/cg021/card001/",
    "bank": {
      "bank_id": "5f756d85c2349d9139648a81",
      "name": "台新銀行",
      "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/taishin-bank.png",
      "image": "https://i.imgur.com/zueSUZY.png",
      "code": "812"
    },
    "creator": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5fa78dc32ba6dfe9db675a6d",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Fail pending card

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://api.cardbo.info/api/v5/card/pending/{card_id}/failed`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
card_id   | card id

### Response

#### Success

Key        | Type    | Enums                                            | Description
---------- | ------- | ------------------------------------------------ | -----------
card_id    | string  |                                                  | card id
name       | string  |                                                  | card name
bank       | Bank    |                                                  | bank information
options    | string  |                                                  | logo url
images     | string  |                                                  | image url
promote    | bool    |                                                  | is the card promoted
website    | string  |                                                  | card official website
creator    | string  |                                                  | creator id
examiner   | string  |                                                  | examiner id
created_at | string  |                                                  | created timestamp
updated_at | string  |                                                  |updated timestamp
status     | int     | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status
comment    | string  |                                                  | failure comment

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 5-18. Upload pending card image

> Upload pending card image:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9/image \
  -H 'Authorization: Bearer meowmeowmeowaccess'
  --data '{
    "image_key": "image_1",
    "data": "base64-encoded-string"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9/image'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "image_key": "image_1",
  "data": "base64-encoded-string"
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  image_key: "image_1",
  data: "base64-encoded-string"
}
axios.post('https://api.cardbo.info/api/v5/card/pending/5fdb2ff346a97b49dac8a6a9/image',data, {
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
    "card_id": "5fc0998715eca4cbca34a1fe",
    "url": "https://storage.googleapis.com/cardbo-images/card/5fc0998715eca4cbca34a1fe-1"
  },
  "timestamp": 1617601542000
}
```

Upload pending card image

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`PUT https://api.cardbo.info/api/v5/card/pending/{card_id}/image`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
card_id   | card id

#### Parameters

Parameter | Required | Type   | Enums       | Description
--------- | -------- | ------ | ----------- | -----------
image_key | true     | string | `image_1`, `image_2`, `image_3`, `image_4`, `image_5`, `image_6`, `image_7`, `image_8`, `image_9`, `image_10` | key value from `Image` property
data      | true     | string |             | image base64 encoded string

### Response

#### Success

Key     | Type    | Description
------- | ------- | -----------
card_id | string  | card id
url     | string  | image URL

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# 6. MobilePay

## 6-1. Insert mobile pay

> Insert mobile pay:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v5/mobilepay \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "name": "Apple Pay",
    "image": "https://storage.googleapis.com/cardbo-images/mobile-pay/apple-pay.png",
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/mobilepay'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "name": "Apple Pay",
  "image": "https://storage.googleapis.com/cardbo-images/mobile-pay/apple-pay.png",
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  name: "Apple Pay",
  image: "https://storage.googleapis.com/cardbo-images/mobile-pay/apple-pay.png",
}
axios.post('https://api.cardbo.info/api/v5/mobilepay', data, {
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
    "mobilepay_id": "5f9a747f10c24bf3d4a54d4e",
    "name": "Apple Pay",
    "image": "https://storage.googleapis.com/cardbo-images/mobile-pay/apple-pay.png"
  },
  "timestamp": 1617601542000
}
```

Insert a new mobile pay

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`POST https://api.cardbo.info/api/v5/mobilepay`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter | Required | Type      | Description
--------- | -------- | --------- | -----------
name      | true     | string    | mobile pay name
image     | true     | string    | mobile pay image URL

### Response

#### Success

Key          | Type    | Description
------------ | ------- | -----------
mobilepay_id | string  | mobilepay id
name         | string  | mobilepay name
image        | string  | mobilepay image URL

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 6-2. Get mobile pays

> Get mobile pays data:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v5/mobilepays?options=name&options=image \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/mobilepays?options=name&options=image'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v5/mobilepays?options=name&options=image', {
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
      "mobilepay_id": "5f9a747f10c24bf3d4a54d4e",
      "name": "Apple Pay",
      "image": "https://storage.googleapis.com/cardbo-images/mobile-pay/apple-pay.png",
      "user_has": false
    }
  ],
  "timestamp": 1617601542000
}
```

Get mobile pays data

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://api.cardbo.info/api/v5/mobilepays`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Queries

Query   | Required | Muti-values | Enums                       | Description
------- | -------- | ----------- | --------------------------- | -----------
options | false    | true        | `name`, `image`, `user_has` | mobile pay response options

### Response

#### Success

Key          | Type    | Description                      | Note
------------ | ------- | -------------------------------- | ----
mobilepay_id | string  | mobilepay id                     |
name         | string  | mobilepay name                   | optional
image        | string  | mobilepay image URL              | optional
user_has     | string  | does the user have the mobilepay | optional

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# 7. Offer

## 7-1. Insert pending offer

## 7-2. Get pending offer by offer id

## 7-3. Update pending offer

## 7-4. Remove pending offer

## 7-5. Pass pending offer to formal offer

## 7-6. Fail pending offer

## 7-7. Get pending offers

## 7-8. Link pending offers sharing upper bound

## 7-9. Remove pending offer sharing upper bound

## 7-10. Link pending offers options bindong

## 7-11. Remove pending offer options binding

## 7-12. Get formal offer by offer id

## 7-13. Update formal offer

## 7-14. Remove formal offer

## 7-15. Get formal offers

## 7-16. Get formal offers by offer id list

## 7-17. Search offers of user's cards

## 7-18. Search offers of all cards

## 7-19. Get recommended offers of user's cards

## 7-20. Search google maps offers

## 7-21. Get google maps top search keywords

## 7-22. Get all offers of a card

## 7-23. Get expired offers

## 7-24. Search offers for accounting record

> Search offers for accounting record:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/offers/formal/accounting?store_id=5f9a747f10c24bf3d4a54d4e&card_id=5f9a747f10c24bf3d4a54d4e&mobilepay_id=5f9a747f10c24bf3d4a54d4e \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/offers/formal/accounting?store_id=5f9a747f10c24bf3d4a54d4e&card_id=5f9a747f10c24bf3d4a54d4e&mobilepay_id=5f9a747f10c24bf3d4a54d4e'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.delete(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.delete('https://api.cardbo.info/api/v6/offers/formal/accounting?store_id=5f9a747f10c24bf3d4a54d4e&card_id=5f9a747f10c24bf3d4a54d4e&mobilepay_id=5f9a747f10c24bf3d4a54d4e', {
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
      "card": {
        "card_info": "..."
      },
      "mobilepay": {
        "mobilepay_info": "..."
      },
      "offers": [
        {
          "offer_info": "..."
        }
      ],
      "rating": 0.878,
      "star": 5,
      "max_cashback": 4.5,
      "max_cashback_offers": [
        "5f9a747f10c24bf3d4a54d4e"
      ],
      "cashback_upper_bound": 500,
      "cashback_amount": 200
    }
  ],
  "timestamp": 1617601542000
}
```

Search offers for accounting record

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://api.cardbo.info/api/v6/offers/formal/accounting`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Queries

Query        | Required | Muti-values | Description
------------ | -------- | ----------- | -----------
store_id     | true     | false       | store id
card_id      | true     | false       | card id
mobilepay_id | false    | false       |mobilepay id

### Response

#### Success

Key                  | Type      | Enums     | Description
-------------------- | --------- | --------- | -----------
card                 | Card      |           | Card object
mobilepay            | MobilePay |           | MobilePay object
offers               | []Offer   |           | array of Offer object
rating               | float     |           | card rating from 0 to 1
star                 | int       | [`1`-`5`] | number of star convert from rating from 1 to 5
max_cashback         | float     |           | max cashback value accumulated from all offers
max_cashback_offers  | []string  |           | array of offer id which is including in max cashback
cashback_upper_bound | int       |           | min cashback upper bound from all offers
cashback_amount      | int       |           | amount getting from max cashback

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# 8. Store

# 9. Tag

# 10. Permission

# 11. UserAction

# 12. ErrorReport

# 13. LimitedTimeOffer

# 14. NewUserOffer

# 15. DataMigration

# 16. AccountingRecord

## 16-1. Get pending accounting records

> Get pending accounting records:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/accountings/pending \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/accountings/pending'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/accountings/pending', {
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
      "_id": "5f9a747f10c24bf3d4a54d4e",
      "user": {
        "user_info": "..."
      },
      "card": {
        "card_info": "...",
      },
      "mobilepay": {
        "mobilepay_info": "...",
      },
      "amount": 1000,
      "name": "午餐",
      "store": {
        "store_info": "...",
      },
      "store_name": "",
      "invoice": "AB99999999",
      "date": 1617601542000,
      "rewards": [
        {
          "offer_id": "5f9a747f10c24bf3d4a54d4e",
          "reward_name": "現金",
          "reward_value": 28.83
        }
      ]
    }
  ],
  "timestamp": 1617601542000
}
```

Get pending accounting records

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://api.cardbo.info/api/v6/accountings/pending`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key           | Type               | Description
------------- | ------------------ | -----------
accounting_id | string             | accotungin id
user          | User               | User object
card          | Card               | Card object
mobilepay     | MobilePay          | MobilePay object
invoice       | Invoice            | Invoice object
amount        | int                | how much money of the record
name          | string             | description of the record
store         | Store              | Store object
store_name    | string             | store name when the store is not in our database
date          | int                | date of the expese in timestamp
rewards       | []AccountingReward | array of AccountingReward object
pending       | string             | is the record in pending or not
created_at    | int                | create time in timestamp
updated_at    | int                | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 16-2. Get accounting records of a card

> Get accounting records of a card:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/accountings/5f9a747f10c24bf3d4a54d4e/2021 \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/accountings/5f9a747f10c24bf3d4a54d4e/2021'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/accountings/5f9a747f10c24bf3d4a54d4e/2021', {
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
    "card": {
      "card_info": "..."
    },
    "details": [
      {
        "expense": 0,
        "cashback": 0,
        "start_date": 1617601542000,
        "end_date": 1617601542000,
        "accounting_records": [],
        "user_rewards": [
          {
            "reward_info": "..."
          }
        ]
      }
    ],
  "timestamp": 1617601542000
}
```

Get accounting records of a card

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://api.cardbo.info/api/v6/accountings/{card_id}/{year}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key                | Type               | Description
------------------ | ------------------ | -----------
expense            | int                | total expend of the month
cashback           | int                | total cashback of the month
start_date         | int                | start date of the month in timestamp
end_date           | int                | end date of the month in timestamp
accounting_records | []AccountingRecord | array of AccountingRecord object
user_rewards       | []UserReward       | array of UserReward object

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 16-3. Insert an accounting record without invoice

> Insert an accounting record without invoice:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v6/accounting \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card_id": "5f9a747f10c24bf3d4a54d4e",
    "mobilepay_id": "5f9a747f10c24bf3d4a54d4e",
    "amount": 1000,
    "name": "午餐",
    "store_id": "5f9a747f10c24bf3d4a54d4e",
    "rewards": [
      "offer_id": "5f9a747f10c24bf3d4a54d4e"
    ],
    "date": 1617601542000,
    "completed": true
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/accounting'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "card_id": "5f9a747f10c24bf3d4a54d4e",
  "mobilepay_id": "5f9a747f10c24bf3d4a54d4e",
  "amount": 1000,
  "name": "午餐",
  "store_id": "5f9a747f10c24bf3d4a54d4e",
  "rewards": [
    "offer_id": "5f9a747f10c24bf3d4a54d4e"
  ],
  "date": 1617601542000,
  "completed": true
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  card_id: "5f9a747f10c24bf3d4a54d4e",
  mobilepay_id: "5f9a747f10c24bf3d4a54d4e",
  amount: 1000,
  name: "午餐",
  store_id: "5f9a747f10c24bf3d4a54d4e",
  rewards: [
    "5f9a747f10c24bf3d4a54d4e"
  ],
  date: 1617601542000,
  completed: true
}
axios.post('https://api.cardbo.info/api/v6/accounting', data, {
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
  "_id": "5f9a747f10c24bf3d4a54d4e",
  "user": {
    "user_info": "..."
  },
  "card": {
    "card_info": "...",
  },
  "mobilepay": {
    "mobilepay_info": "...",
  },
  "amount": 1000,
  "name": "午餐",
  "store": {
    "store_info": "...",
  },
  "store_name": "",
  "invoice": "AB99999999",
  "date": 1617601542000,
  "rewards": [
    {
      "offer_id": "5f9a747f10c24bf3d4a54d4e",
      "reward_name": "現金",
      "reward_value": 28.83
    }
  ]
}
```

Insert an accounting record without invoice

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`POST https://api.cardbo.info/api/v6/accounting`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter     | Required | Type     | Description
------------- | -------- | -------- | -----------
card_id       | true     | string   | card id
mobilepay_id  | true     | string   | mobilepay id
amount        | true     | int      | the amount of the money
name          | true     | string   | name of the record
store_id      | false(*1) | string   | store id
store_name    | false(*1) | string   | store name when the store not in our database
date          | true     | int      | the datetime of the expense in timestamp
rewards       | false    | []string | array of offer id that can get from the expense
completed     | true     | bool     | is the record completed

*1: one of `store_id` and `store_name` is required

### Response

#### Success

Key           | Type               | Description
------------- | ------------------ | -----------
accounting_id | string             | accotungin id
user          | User               | User object
card          | Card               | Card object
mobilepay     | MobilePay          | MobilePay object
invoice       | Invoice            | Invoice object
amount        | int                | how much money of the record
name          | string             | description of the record
store         | Store              | Store object
store_name    | string             | store name when the store is not in our database
date          | int                | date of the expese in timestamp
rewards       | []AccountingReward | array of AccountingReward object
pending       | string             | is the record in pending or not
created_at    | int                | create time in timestamp
updated_at    | int                | update time in timestamp

## 16-4. Insert an accounting record with QR code invoice

> Insert an accounting record with QR code invoice:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v6/accounting/qr_code \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card_id": "5f9a747f10c24bf3d4a54d4e",
    "mobilepay_id": "5f9a747f10c24bf3d4a54d4e",
    "amount": 1000,
    "name": "午餐",
    "store_id": "5f9a747f10c24bf3d4a54d4e",
    "qr_code_left": "INVOICE_QR_CODE_LEFT",
    "qr_code_right": "INVOICE_QR_CODE_RIGHT",
    "rewards": [
      "offer_id": "5f9a747f10c24bf3d4a54d4e"
    ],
    "date": 1617601542000,
    "completed": true
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/accounting/qr_code'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "card_id": "5f9a747f10c24bf3d4a54d4e",
  "mobilepay_id": "5f9a747f10c24bf3d4a54d4e",
  "amount": 1000,
  "name": "午餐",
  "store_id": "5f9a747f10c24bf3d4a54d4e",
  "qr_code_left": "INVOICE_QR_CODE_LEFT",
  "qr_code_right": "INVOICE_QR_CODE_RIGHT",
  "rewards": [
    "offer_id": "5f9a747f10c24bf3d4a54d4e"
  ],
  "date": 1617601542000,
  "completed": true
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  card_id: "5f9a747f10c24bf3d4a54d4e",
  mobilepay_id: "5f9a747f10c24bf3d4a54d4e",
  amount: 1000,
  name: "午餐",
  store_id: "5f9a747f10c24bf3d4a54d4e",
  qr_code_left: "INVOICE_QR_CODE_LEFT",
  qr_code_right: "INVOICE_QR_CODE_RIGHT",
  rewards: [
    "5f9a747f10c24bf3d4a54d4e"
  ],
  date: 1617601542000,
  completed: true
}
axios.post('https://api.cardbo.info/api/v6/accounting/qr_code', data, {
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
  "_id": "5f9a747f10c24bf3d4a54d4e",
  "user": {
    "user_info": "..."
  },
  "card": {
    "card_info": "...",
  },
  "mobilepay": {
    "mobilepay_info": "...",
  },
  "amount": 1000,
  "name": "午餐",
  "store": {
    "store_info": "...",
  },
  "store_name": "",
  "invoice": "AB99999999",
  "date": 1617601542000,
  "rewards": [
    {
      "offer_id": "5f9a747f10c24bf3d4a54d4e",
      "reward_name": "現金",
      "reward_value": 28.83
    }
  ]
}
```

Insert an accounting record with QR code invoice

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`POST https://api.cardbo.info/api/v6/accounting/qr_code`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter     | Required  | Type     | Description
------------- | --------- | -------- | -----------
card_id       | true      | string   | card id
mobilepay_id  | true      | string   | mobilepay id
amount        | true      | int      | the amount of the money
name          | true      | string   | name of the record
store_id      | false(*1) | string   | store id
store_name    | false(*1) | string   | store name when the store not in our database
qr_code_left  | true      | string   | the left QR code on the invcoie
qr_code_right | true      | string   | the right QR code on the invcoie
date          | true      | int      | the datetime of the expense in timestamp
rewards       | false     | []string | array of offer id that can get from the expense
completed     | true      | bool     | is the record completed

*1: one of `store_id` and `store_name` is required

### Response

#### Success

Key           | Type               | Description
------------- | ------------------ | -----------
accounting_id | string             | accotungin id
user          | User               | User object
card          | Card               | Card object
mobilepay     | MobilePay          | MobilePay object
invoice       | Invoice            | Invoice object
amount        | int                | how much money of the record
name          | string             | description of the record
store         | Store              | Store object
store_name    | string             | store name when the store is not in our database
date          | int                | date of the expese in timestamp
rewards       | []AccountingReward | array of AccountingReward object
pending       | string             | is the record in pending or not
created_at    | int                | create time in timestamp
updated_at    | int                | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## 16-5. Insert an accounting record with carrier invoice

> Insert an accounting record with carrier invoice:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v6/accounting/qr_code \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card_id": "5f9a747f10c24bf3d4a54d4e",
    "mobilepay_id": "5f9a747f10c24bf3d4a54d4e",
    "amount": 1000,
    "name": "午餐",
    "store_id": "5f9a747f10c24bf3d4a54d4e",
    "invoice_id": "5f9a747f10c24bf3d4a54d4e",
    "rewards": [
      "offer_id": "5f9a747f10c24bf3d4a54d4e"
    ],
    "date": 1617601542000,
    "completed": true
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/accounting/qr_code'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "card_id": "5f9a747f10c24bf3d4a54d4e",
  "mobilepay_id": "5f9a747f10c24bf3d4a54d4e",
  "amount": 1000,
  "name": "午餐",
  "store_id": "5f9a747f10c24bf3d4a54d4e",
  "invoice_id": "5f9a747f10c24bf3d4a54d4e",
  "rewards": [
    "offer_id": "5f9a747f10c24bf3d4a54d4e"
  ],
  "date": 1617601542000,
  "completed": true
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  card_id: "5f9a747f10c24bf3d4a54d4e",
  mobilepay_id: "5f9a747f10c24bf3d4a54d4e",
  amount: 1000,
  name: "午餐",
  store_id: "5f9a747f10c24bf3d4a54d4e",
  invoice_id: "5f9a747f10c24bf3d4a54d4e",
  rewards: [
    "5f9a747f10c24bf3d4a54d4e"
  ],
  date: 1617601542000,
  completed: true
}
axios.post('https://api.cardbo.info/api/v6/accounting/qr_code', data, {
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
  "_id": "5f9a747f10c24bf3d4a54d4e",
  "user": {
    "user_info": "..."
  },
  "card": {
    "card_info": "...",
  },
  "mobilepay": {
    "mobilepay_info": "...",
  },
  "amount": 1000,
  "name": "午餐",
  "store": {
    "store_info": "...",
  },
  "store_name": "",
  "invoice": "AB99999999",
  "date": 1617601542000,
  "rewards": [
    {
      "offer_id": "5f9a747f10c24bf3d4a54d4e",
      "reward_name": "現金",
      "reward_value": 28.83
    }
  ]
}
```

Insert an accounting record with carrier invoice

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`POST https://api.cardbo.info/api/v6/accounting/qr_code`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter     | Required  | Type     | Description
------------- | --------- | -------- | -----------
card_id       | true      | string   | card id
mobilepay_id  | true      | string   | mobilepay id
amount        | true      | int      | the amount of the money
name          | true      | string   | name of the record
store_id      | false(*1) | string   | store id
store_name    | false(*1) | string   | store name when the store not in our database
invoice_id    | true      | string   | invoice id
date          | true      | int      | the datetime of the expense in timestamp
rewards       | false     | []string | array of offer id that can get from the expense
completed     | true      | bool     | is the record completed

*1: one of `store_id` and `store_name` is required

### Response

#### Success

Key           | Type               | Description
------------- | ------------------ | -----------
accounting_id | string             | accotungin id
user          | User               | User object
card          | Card               | Card object
mobilepay     | MobilePay          | MobilePay object
invoice       | Invoice            | Invoice object
amount        | int                | how much money of the record
name          | string             | description of the record
store         | Store              | Store object
store_name    | string             | store name when the store is not in our database
date          | int                | date of the expese in timestamp
rewards       | []AccountingReward | array of AccountingReward object
pending       | string             | is the record in pending or not
created_at    | int                | create time in timestamp
updated_at    | int                | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# 17. Invoice

## 17-1. Get unrecorded invoices

> Get unrecorded invoices:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/invoices/unrecorded \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/invoices/unrecorded'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/invoices/unrecorded', {
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
      "invoice_id": "5f9a747f10c24bf3d4a54d4e",
      "UserID": "5f9a747f10c24bf3d4a54d4e",
      "invoice_no": "AB99999999",
      "status": "已確認",
      "period": "11006",
      "seller_name": "Store A",
      "seller_tax_id": "12345678",
      "seller_address": "",
      "invoice_time": 1617601542000,
      "buyer_tax_id": "12345678",
      "currency": "TWD",
      "price": 1000,
      "details": null,
      "unrecorded": true,
      "created_at": 1617601542000
    }
  ],
  "timestamp": 1617601542000
}
```

Get unrecorded invoices

<aside class="notice">
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`GET https://api.cardbo.info/api/v6/invoices/unrecorded`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key            | Type            | Description
-------------- | --------------- | -----------
invoice_id     | string          | invoice id
user_id        | string          | user id
invoice_no     | string          | invoice number
status         | string          | the status of the invoice
period         | string          | invoice period
seller_name    | string          | seller name
seller_tax_id  | string          | seller tax id
seller_address | string          | seller address
invoice_time   | string          | time of the invoice in timestamp
buyer_tax_id   | string          | date of the expese in timestamp
currency       | string          | money currency
price          | int             | the price of the expense
details        | []InvoiceDetail | array of InvoiceDetail object
qr_code_items  | []QRCodeItem    | array of QRCodeItem object
unrecorded     | bool            | is invoice is recorded or not
created_at     | int             | create time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message
