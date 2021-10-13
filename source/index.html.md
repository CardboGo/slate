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

> User:

```json
{
  "user_id": "5f9a747p00c2abf3d4a54d4q",
  "line_id": "U3f3a741a55362b595bab1dc31aadf268",
  "username": "User",
  "image": "https://image.png",
  "email": "",
  "user_type": 3,
  "subscription": 2,
  "cards": [
    {
      "card_id": "5f9a747p00c2abf3d4a54d4q",
      "name": "card",
      "bank": {
        "bank_id": "5f9a747p00c2abf3d4a54d4q",
        "name": "bank",
        "logo": "https://image.png",
        "image": "https://image.png",
        "code": "052"
      },
      "level": 4,
      "image": "https://image.png",
      "issuer": "VISA",
      "payment_date": 20,
      "card_last_no": "1234",
      "reward_day": 1,
      "has_questionnaire": true,
      "questionnaire_completed": true,
      "enable_reward": true
    }
  ],
  "invoice": {
    "carrier": "",
    "status": false
  },
  "update_message": false,
  "created_at": 1617601542000,
  "updated_at": 1617601542000,
  "last_login": 1617601542000
}
```

Key                   | Type                 | Enums | Description
--------------------- | -------------------- | ----- | -----------
user_id               | string               |       | User id
line_id               | string               |       | LINE id
username              | string               |       | Username
image                 | string               |       | User image
email                 | string               |       | Email
cards                 | []Card               |       | User own card array
user_mobilepays       | []UserMobilepay      |       | User own mobile pay array
user_type             | int                  | `1`: User type 1 <br/>`2`: User type 2 <br/>`3`: User type 3 | User type
invoice               | UserInvoice          |       | user invcoie info
subscription          | int                  | `1`: UNSUBSCRIBED <br/> `2`: SUBSCRIBED | Is user subscribe our service
update_message        | bool                 |       | Does the user need to get the update message
interested_categories | []InterestedCategory |       | User interest categories data
created_at            | int                  |       | Create time in timestamp
updated_at            | int                  |       | Update time in timestamp
last_login            | int                  |       | User last login time in timestamp

## UserMobilepay

Key             | Type          | Description
--------------- | ------------- | -----------
mobilepay       | MobilePay     | MobilePay object
no_card_binding | bool          | mobilepay does not bind any card
cards           | []CardDisplay | array of CardDisplay object

## UserInvoice

Key               | Type   | Description
----------------- | ------ | -----------
carrier           | string | mobile carrier
verification_code | string | carrier verification code
status            | bool   | status of the carrier

## InterestedCategory

Key         | Type   | Description
----------- | ------ | -----------
category_id | string | category id
category    | string | category name
score       | float  | the score of the catogory

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

Key                 | Type   | Description
------------------- | ------ | -----------
reward_id           | string | reward id
card_id             | string | CardDisplay object
offer_id            | string | Offer object
reward_unit_value   | float  | offer reward value per unit
reward_name         | string | offer cashback reward name
coin_image          | string | coin image URL
reward_upper_bound  | int    | offer cashback upper bound
expense_upper_bound | int    | expense upper bound
left_expense        | int    | left expense
start_date          | int    | year of the reward
end_date            | int    | month of the reward
expense             | int    | expense of the month
reward_value        | float  | total reward value which user get of the month
offer               | Offer  | Offer object
created_at          | int    | create time in timestamp
updated_at          | int    | update time in timestamp

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

## BankCard

Key   | Type   | Description
----- | ------ | -----------
bank  | Bank   | Bank object
cards | []Card | Array of card object

## Card

Key            | Type          | Enums                                            | Description
-------------- | ------------- | ------------------------------------------------ | -----------
card_id        | string        |                                                  | card id
name           | string        |                                                  | card name
bank           | Bank          |                                                  | Bank object
options        | []CardOption  |                                                  | CardOption object
images         | CardImage     |                                                  | CardImage object
promote        | bool          |                                                  | is the card promoted
website        | string        |                                                  | card official website
creator        | string        |                                                  | creator id
examiner       | string        |                                                  | examiner id
created_at     | string        |                                                  | created timestamp
updated_at     | string        |                                                  |updated timestamp
status         | int           | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status
comment        | string        |                                                  | failure comment
user_has       | bool          |                                                  | does user has the card or not
card_promotion | CardPromotion |                                                  | card promotion info

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

Key                     | Type          | Enums  | Description
----------------------- | ------------- | ------ | -----------
card_id                 | string        |        | card id
name                    | string        |        | card name
bank                    | Bank          |        | bank information
image                   | string        |        | image URL
issuer                  | string        | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level                   | int           | [`1`-`8`] | level of the card
level_name              | string        |        | level name of the card
payment_date            | int           | [`1`-`31`] | the payment of the card
reward_day              | int           |        | the reward day of the card (DEFAULT: payment_date)
card_last_no            | string        |        | the last 4 number of user's credit card
has_questionnaire       | bool          |        | does the card has the questionnaire
questionnaire_completed | bool          |        | is the questionnaire completed or not
enable_reward           | bool          |        | is the card enable reward
card_promotion          | CardPromotion |        | card promotion info

## CardPromotion

Key             | Type              | Description
--------------- | ----------------- | -----------
left_promotion  | CardPromotionInfo | left promotion data
right_promotion | CardPromotionInfo | right promotion data

## CardPromotionInfo

Key          | Type   | Enums                            | Description
------------ | ------ | -------------------------------- | -----------
reward_type  | int    | NEW_USER: `1` </br> GENERAL: `2` | reward type
reward_value | int    |                                  | reward value for cashback reward
reward_name  | string |                                  | reward name
title        | string |                                  | reward title

## MobilePay

Key            | Type    | Enums | Description
-------------- | ------- | ----- | -----------
mobilepay_id   | string  |       | mobilepay id
name           | string  |       | mobilepay name
mobilepay_type | int     | 行動支付: `1` </br> 電子支付: `2` | mobilepay type
image          | string  |       | mobilepay image URL
deep_link      | string  |       | deep link of the mobile pay

## Tag

Parameter   | Type   | Enums | Description
----------- | ------ | ----- | -----------
tag_id      | string |       | Tag ID
name        | string |       | Tag name
description | string |       | Tag description
tag_type    | int    | `1`: MobilePay </br> `2`: General | Tag type

## Offer

Parameter               | Type              | Enums | Description
----------------------- | ----------------- | ----- | -----------
option_array            | []OfferOption     |       | Offer options for user questionnaire
offer_bank              | []OfferBank       |       | All bank of card can get the offer
excluded_cards          | []OfferCard       |       | Cards excluded from bank offer
cards                   | []OfferCard       |       | Array of OfferCard
mobilepay_array         | []OfferMobilePay  |       | mobile pays can get the offer
mobilepay_option        | int               | `1`: 不限制 </br> `2`: 限定帳戶綁定 </br> `3`: 限定綁定信用卡 | Option of the mobile pays to get the offer
eticket_payments        | []ETicket         |       | E-ticket of the card to use to get the offer
stores                  | []OfferStore      |       | Stores to get the offer
mpt_included_stores     | []OfferStore      |       | Stores that can included for mobile pay
excluded_stores         | []OfferStore      |       | Stores that are excluded from the tags
url                     | string            |       | Offer URL
start_date              | int               |       | Offer start date in timeStamp
end_date                | int               |       | Offer end date in timeStamp
general_tags            | []Tag             |       | Tags which the type is general
mobilepay_tags          | []MobilePayTag    |       | Tags which the type is mobilepay
excluded_tags           | []Tag             |       | Tags excluded from the places
is_independent_reward   | bool              |       | Is the offer is independent or not
reward_type             | int               | `1`: 現金回饋-趴數 </br> `2`: 現金回饋-固定值 | Reward type
pre_conditions          | []string          |       | 事前問卷
post_conditions         | []string          |       | 事後問卷
mobile_pay_binding      | []MobilePay       |       | Mobile pays which need to bind to get the offer
weekday                 | []int             | [`1`-`7`] | The day in a week that can get the offer
month_days              | []int             | [`1`-`31`] | The day in a month that can get the offer
time                    | string            |       | The time in a day that can get the offer
pay_methods             | []OfferMobilePay  |       | Mobile pays to use to get the offer
register_url            | string            |       | 登錄網址
coupon_code             | string            |       | 優惠代碼
discount_url            | string            |       | 專屬連結
account_binding_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to bind account
account_name            | string            |       | Account name to bind
electronic_bill_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to apply electronic biil
installment_required    | bool              |       | Need to intall
installment_acceptable  | bool              |       | Can installment get the offer
installment_reward_type | string            | [`依分期回饋`, `統一回饋`] | The type of the installemnt offer
note                    | string            |       | Note
upper_bounds            | []OfferUpperBound |       | Upper bounds
reward_content_type     | int               | `1`: 優惠獨立計算 </br> `2`: 優惠累積計算 </br> `3`: 優惠分段累積計算 | Reward content type
mincost_type            | int               | `1`: 沒有最低消費限制 </br> `2`: 當下消費單筆滿 </br> `3`: 當下消費每滿 </br> `4`: 單一通路總共滿 </br> `5`: 單一通路個別滿 </br> `6`: 單一通路每滿 </br> `7`: 全通路總共滿 </br> `8`: 全通路個別滿 </br> `9`: 全通路每滿 </br> `10`: 一般消費總共滿 </br> `11`: 一般消費個別滿 </br> `12`: 一般消費每滿 </br> `13`: 國內一般消費總共滿 </br> `14`: 國內一般消費個別滿 </br> `15`: 國內一般消費每滿 </br> `16`: 總消費總共滿 </br> `17`: 總消費個別滿 </br> `18`: 總消費每滿 | Minimum cost type
reward_contents         | []RewardContent   |       | Reward contents

## CashbackCoin

Key          | Type   | Description
------------ | ------ | -----------
reward_name  | string | reward name (現金, Line Points, 街口幣, Open Points, P幣, Hami Point, 代幣...)
image        | string | coin image URL

## OfferResult

Key                | Type              | Enums | Description
------------------ | ----------------- | ----- | -----------
offer_id           | string            |       | offer ID
options            | []string          |       | array of options
end_date           | int               |       | end date in timestamp
pre_conditions     | []string          |       | array of pre conditions
post_conditions    | []string          |       | array of post conditions
register_url       | string            |       | register URL
coupon_code        | string            |       | coupon code
discount_url       | string            |       | discount URL
upper_bounds       | []OfferUpperBound |       | array of offer upper bound
reward_type        | int               | CASHBACK_PERCENTAGE: `1` <br/> CASHBACK_FIXED: `2` | reward type
max_reward_content | RewardContent     |       | best reward can get from reward contents
reward_contents    | []RewardContent   |       | array of all reward contents
cashback_value     | float             |       | The cashback value can get from the offer
selected           | bool              |       | is the reward selected

## OfferUpperBound

Key                   | Type     | Enums | Description
--------------------- | -------- | ----- | -----------
upperbound_id         | string   |       | upperbound ID
cash_upper_bound      | int      |       | cashback upperbound value
frequency_upper_bound | int      |       | how many times can the offer got
upper_bound_period    | int      | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | upper bound period
store_independent     | bool     |       | is the upper bound calculate independent from each store
sharing_upper_bounds  | []string |       | array of upperbound ID share same upper bound

## RewardContent

Key                  | Type    | Enums  | Description
-------------------- | ------- | ------ | -----------
mincost_period_times | int     |        | how many time for the min cost period
mincost_period       | int     | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | min cost period
excluded_places      | []Store |        | Places that excluded from the min cost
mincost_value        | int     |        | min cost value
reward_name          | string  |        | reward name (現金, Line Points, 街口幣, Open Points, P幣, Hami Point, 代幣...)
reward_value         | float   |        | reward value
coin_image           | string  |        | coin image URL

## OfferUpdateInfo

Key              | Type  | Description
---------------- | ----- | -----------
offer            | Offer | Offer object
recently_updated | bool  | Is the offer updated recenlty

## NewUserOffer

Key        | Type          | Description
---------- | ------------- | -----------
offer_id   | string        | Offer ID
title      | string        | Title of the offer
cards      | []Card        | Array of Card object
start_date | int           | start date in timestamp
end_date   | int           | end date in timestamp
url        | string        | offer URL
creator    | Administrator | Creator info
created_at | int           | create time in timestamp
updated_at | int           | update time in timestamp

## AccountingRecordOffer

Key          | Type  | Description
------------ | ----- | -----------
offer        | Offer | Offer object
selected     | bool  | is the offer selected for max cashback
reward_value | float | the reward value get from the offer

## AccountingSummary

Key                | Type             | Description
------------------ | ---------------- | -----------
user               | User             | User object
month              | int              | The month of the records
total_expense      | int              | monthly total expense
total_reward       | int              | monthly total reward
card_user_rewards  | CardUserReward   | CardUserReward object
mobilepay_expenses | MobilePayExpense | MobilePayExpense object

## AccountingRecord

Key           | Type               | Enums | Description
------------- | ------------------ | ----- | -----------
accounting_id | string             |       | accotungin id
user          | User               |       | User object
card          | Card               |       | Card object
mobilepay     | MobilePay          |       | MobilePay object
invoice       | Invoice            |       | Invoice object
amount        | int                |       | how much money of the record
name          | string             |       | description of the record
store         | Store              |       | Store object
store_name    | string             |       | store name when the store is not in our database
date          | int                |       | date of the expese in timestamp
reward_value  | float              |       | total reward value from `rewards`
coin_image    | string             |       | the image URL of the reward coin
rewards       | []AccountingReward |       | array of AccountingReward object
invoice_type  | int                | QRCode: `1` <br/> Carrier: `2` <br/> NoInvoice: `3` | invoice tpye of the record
pending       | string             |       | is the record in pending or not
created_at    | int                |       | create time in timestamp
updated_at    | int                |       | update time in timestamp

## MonthAccountingRecord

Key                | Type               | Description
------------------ | ------------------ | -----------
expense            | int                | expense of the month
cashback           | int                | total cashback of a month
start_date         | int                | month start date in timestamp
end_date           | int                | month end date in timestamp
accounting_records | []AccountingRecord | accounting records of a month
user_rewards       | []UserReward       | user rewards of a month

## AccountingReward

Key          | Type   | Description
------------ | ------ | -----------
offer_id     | string | offer id
reward_name  | string | offer cashback reward name
reward_value | float  | reward value get from the expense

## Invoice

Key             | Type            | Enums | Description
--------------- | --------------- | ----- | -----------
invoice_id      | string          |       | invoice id
user_id         | string          |       | user id
invoice_no      | string          |       | invoice number
einvoice_status | string          |       | the status from the E-invcoie API
period          | string          |       | invoice period
seller_name     | string          |       | seller name
seller_tax_id   | string          |       | seller tax id
seller_address  | string          |       | seller address
invoice_time    | string          |       | time of the invoice in timestamp
buyer_tax_id    | string          |       | date of the expese in timestamp
currency        | string          |       | money currency
price           | int             |       | the price of the expense
details         | []InvoiceDetail |       | array of InvoiceDetail object
qr_code_items   | []QRCodeItem    |       | array of QRCodeItem object
store           | Store           |       | the store of the invoice
unrecorded      | bool            |       | is invoice is recorded or not
status          | int             | UNRECORDED: `1` <br/> PENDING: `2` <br/> RECORDED: `3` <br/> ARCHIVED: `4` | status of the invoice
created_at      | int             |       | create time in timestamp
updated_at      | int             |       | update time in timestamp

## ErrorReport

Key                | Type             | Enums | Description
------------------ | ---------------- | ----- | -----------
report_id          | string           |       | report id
report_type        | int              | OFFER_DETAIL: `1` <br/> CARD_REWARD: `2` <br/> ACCOUNTING: `3` | report type
user               | User             |       | User Object
accounting_record  | AccountingRecord |       | AccountingRecord object
card               | Card             |       | Card object
mobilepay          | MobilePay        |       | MobilePay object
store              | Store            |       | Store object
store_name         | string           |       | store name when store is not in our DB
offer_ids          | []string         |       | offer id array
new_user_offer_ids | []string         |       | new user offer id array
url_error          | bool             |       | is the offer URL error
content            | string           |       | report content
note               | string           |       | error handling note
status             | int              | PENDING: `1` <br/> WAITING_NOTIFY: `2` <br/> FINISHED: `3` | the handling status of the report
created_at         | int              |       | create time in timestamp
updated_at         | int              |       | update time in timestamp
fixed_at           | int              |       | fixing time in timestamp
notified_at        | int              |       | notification time in timestamp

## CardQuestionnaire

Key              | Type            | Description
---------------- | --------------- | -----------
questionnaire_id | string          | questionnaire id
card             | Card            | the card of the questionnaires
questionnaires   | []Questionnaire | array of questionnaire
created_at       | int             | create time in timestamp
updated_at       | int             | update time in timestamp

## Questionnaire

Key           | Type      | Enums | Description
------------- | --------- | ----- | -----------
question_no   | int       |       | the number of the question (unique in each card)
question_type | int       | TAG: `1` <br/> OPTIONS: `2` <br/> ACCOUNT_BINDING: `3` <br/> ELETRONIC_BILL: `4` <br/> ETICKET: `5` | the type of the question
question      | string    |       | question content
options       | []string  |       | array of options
tag           | string    |       | self defined tag when the question type is TAG
etickets      | []ETicket |       | array of ETicket when the question type is ETICKET
description   | string    |       | the description of the question

## CardQuestionnaireAnswer

Key              | Type                  | Description
---------------- | --------------------- | -----------
questionnaire_id | string                | questionnaire id
User             | User                  | User object
card             | Card                  | the card of the questionnaires
card_last_no     | string                | the last 4 number of user's credit card
reward_day       | int                   | the end day of a month of the reward
questionnaires   | []QuestionnaireAnswer | array of questionnaire
completed        | bool                  | is the questionnaire completed or not
created_at       | int                   | create time in timestamp
updated_at       | int                   | update time in timestamp

## QuestionnaireAnswer

Key           | Type      | Enums | Description
------------- | --------- | ----- | -----------
question_no   | int       |       | the number of the question (unique in each card)
question_type | int       | TAG: `1` <br/> OPTIONS: `2` <br/> ACCOUNT_BINDING: `3` <br/> ELETRONIC_BILL: `4` <br/> ETICKET: `5` | the type of the question
answer        | string    |       | the answer to the questionnaire, value depends on the question type
tag           | string    |       | the tag of the question when the question type is TAG

## ETicket

Key        | Type  | Description
---------- | ------ | -----------
eticket_id | string | eticket id
name       | string | eticket name
image      | string | image URL

# ◉ Authentication

## • Administrator

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
    "administrator_id": "5f9a747p00c2abf3d4a54d4q",
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

## • LineBot

> Login linebot:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v5/auth/cardbo/linebot \
  -H 'Content-Type: application/json' \
  --data '{
    "source": 1,
    "user_id": "5f9a747p00c2abf3d4a54d4q"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/auth/cardbo/linebot'
data = {
  'source': 1,
  'user_id': '5f9a747p00c2abf3d4a54d4q'
}
response = requests.post(url, json=data)
```

```javascript
const axios = require('axios');

axios.post('https://api.cardbo.info/api/v5/auth/cardbo/linebot', {
    source: 1,
    user_id: '5f9a747p00c2abf3d4a54d4q'
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

`POST https://api.cardbo.info/api/v5/auth/cardbo/linebot`

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

## • Line Login

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

## • Auth Refresh

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

# ◉ User

## • Get user profile

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
    "user_id": "5f9a747p00c2abf3d4a54d4q",
    "line_id": "Udchd7f131dvvhdbe166692206a12335c",
    "username": "Harrison Peng",
    "image": "https://image.com/image.png",
    "cards": [
      {
        "card_id": "5f9a747p00c2abf3d4a54d4q",
        "name": "永豐幣倍卡",
        "bank": {
          "bank_id": "5f756d85c2349d9139648a7d",
          "name": "永豐銀行",
          "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/sinopac-bank.png",
          "image": "https://i.imgur.com/1g5nYEN.png",
          "code": "807"
        },
        "level": 5,
        "image": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
        "issuer": "MASTERCARD"
      }
    ],
    "user_mobilepays": [
      {
        "mobilepay": {
          "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
          "name": "Apple Pay",
          "image": "https://storage.googleapis.com/cardbo-images/mobile-pay/apple-pay.png",
          "user_has": false
        },
        "cards": [
          {
            "card_id": "5f9a747p00c2abf3d4a54d4q",
            "name": "永豐幣倍卡",
            "bank": {
              "bank_id": "5f756d85c2349d9139648a7d",
              "name": "永豐銀行",
              "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/sinopac-bank.png",
              "image": "https://i.imgur.com/1g5nYEN.png",
              "code": "807"
            },
            "level": 5,
            "image": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
            "issuer": "MASTERCARD"
          }
        ]
      }
    ],
    "user_level": 1,
    "payment_willing": 1,
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "last_login": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Get user profile by user's API auth token

### HTTP Request

`GET https://api.cardbo.info/api/v5/user`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key                   | Type                 | Enums | Description
--------------------- | -------------------- | ----- | -----------
user_id               | string               |       | User id
line_id               | string               |       | LINE id
username              | string               |       | Username
image                 | string               |       | User image
email                 | string               |       | Email
phone_number          | string               |       | Phone number
cards                 | []Card               |       | User own card array
user_mobilepays       | []UserMobilepay      |       | User own mobile pay array
user_level            | int                  | GENERAL: `1` <br/> VIP: `2` <br/> DEVELOPER: `3` | User level
invoice               | UserInvoice          |       | user invcoie info
subscription          | int                  | UNSUBSCRIBED: `1` <br/> SUBSCRIBED: `2` | is user subscribe the user reward
update_message        | bool                 |       | does the user need to get the update message
interested_categories | []InterestedCategory |       | user interest categories data
created_at            | int                  |       | create time in timestamp
updated_at            | int                  |       | update time in timestamp
last_login            | int                  |       | User last login time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Add user card

> Add card:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user/add_card \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card_id": "5f9a747p00c2abf3d4a54d4q",
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
  'card_id': '5f9a747p00c2abf3d4a54d4q',
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
  card_id: '5f9a747p00c2abf3d4a54d4q',
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

## • Remove user card

> Remove card:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user/remove_card \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card_id": "5f9a747p00c2abf3d4a54d4q"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/user/remove_card'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'card_id': '5f9a747p00c2abf3d4a54d4q'
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  card_id: '5f9a747p00c2abf3d4a54d4q'
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

## • Update user mobile pays

> Update mobile pays:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user/mobilepays \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '[
    {
      "mobilepay_id": "5f9a747p00c2abf3d4a54d4q"
    }
  ]'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/user/mobilepays'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = [
  {
    'mobilepay_id': '5f9a747p00c2abf3d4a54d4q'
  }
]
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = [
  {
    mobilepay_id: "5f9a747p00c2abf3d4a54d4q"
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

## • Add user mobile pay

> Add mobile pay:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/user/add_mobilepay \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "mobilepay": {
      "mobilepay_id": "5f9a747p00c2abf3d4a54d4q"
    },
    "no_binding_card": false,
    "cards": [
      {
        "card_id": "5f9a747p00c2abf3d4a54d4q"
      }
    ]
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/user/add_mobilepay'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "mobilepay": {
    "mobilepay_id": "5f9a747p00c2abf3d4a54d4q"
  },
  "no_binding_card": false,
  "cards": [
    {
      "card_id": "5f9a747p00c2abf3d4a54d4q"
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
    mobilepay_id: "5f9a747p00c2abf3d4a54d4q"
  },
  no_binding_card: false,
  cards: [
    {
      card_id: "5f9a747p00c2abf3d4a54d4q"
    }
  ]
}
axios.put('https://api.cardbo.info/api/v6/user/add_mobilepay', data, {
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
    "{user_info}": "..."
  },
  "timestamp": 1617601542000
}
```

Add user's mobile pay

### HTTP Request

`PUT https://api.cardbo.info/api/v6/user/add_mobilepay`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter       | Required | Type      | Description
--------------- | -------- | --------- | -----------
mobilepay       | true     | MobilePay | mobile pay object
no_binding_card | true     | bool      | mobilepay does not bind any card
cards           | false    | []Card    | cards binding to the mobile pay (when `no_binding_card=false`)

*MobilePay*

Parameter    | Required | Type   | Description
------------ | -------- | ------ | -----------
mobilepay_id | true     | string | mobile pay id

*Card*

Parameter | Required | Type   | Description
--------- | -------- | ------ | -----------
card_id   | true     | string | card id

### Response

#### Success

Key                   | Type                 | Enums | Description
--------------------- | -------------------- | ----- | -----------
user_id               | string               |       | User id
line_id               | string               |       | LINE id
username              | string               |       | Username
image                 | string               |       | User image
email                 | string               |       | Email
phone_number          | string               |       | Phone number
cards                 | []Card               |       | User own card array
user_mobilepays       | []UserMobilepay      |       | User own mobile pay array
user_level            | int                  | GENERAL: `1` <br/> VIP: `2` <br/> DEVELOPER: `3` | User level
invoice               | UserInvoice          |       | user invcoie info
subscription          | int                  | UNSUBSCRIBED: `1` <br/> SUBSCRIBED: `2` | is user subscribe the user reward
update_message        | bool                 |       | does the user need to get the update message
interested_categories | []InterestedCategory |       | user interest categories data
created_at            | int                  |       | create time in timestamp
updated_at            | int                  |       | update time in timestamp
last_login            | int                  |       | User last login time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Remove user mobile pay

> Remove mobile pay:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user/remove_mobilepay \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "mobilepay_id": "5f9a747p00c2abf3d4a54d4q"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/user/remove_mobilepay'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'mobilepay_id': '5f9a747p00c2abf3d4a54d4q'
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  mobilepay_id: "5f9a747p00c2abf3d4a54d4q"
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

## • Add card to user mobile pay

> Add card to mobile pay:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user/mobilepay/add_card \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "mobilepay": {
      "mobilepay_id": "5f9a747p00c2abf3d4a54d4q"
    },
    "card": {
      "card_id": "5f9a747p00c2abf3d4a54d4q"
    }
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/user/mobilepay/add_card'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'mobilepay': {
    'mobilepay_id': '5f9a747p00c2abf3d4a54d4q'
  },
  'cards': {
    'card_id': '5f9a747p00c2abf3d4a54d4q'
  }
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  mobilepay: {
    mobilepay_id: "5f9a747p00c2abf3d4a54d4q"
  },
  cards: {
    card_id: "5f9a747p00c2abf3d4a54d4q"
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

## • Remove card from user mobile pay

> Remove card from mobile pay:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user/mobilepay/remove_card \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "mobilepay": {
      "mobilepay_id": "5f9a747p00c2abf3d4a54d4q"
    },
    "card": {
      "card_id": "5f9a747p00c2abf3d4a54d4q"
    }
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/user/mobilepay/remove_card'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'mobilepay': {
    'mobilepay_id': '5f9a747p00c2abf3d4a54d4q'
  },
  'cards': {
    'card_id': '5f9a747p00c2abf3d4a54d4q'
  }
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  mobilepay: {
    mobilepay_id: "5f9a747p00c2abf3d4a54d4q"
  },
  cards: {
    card_id: "5f9a747p00c2abf3d4a54d4q"
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

## • Update user level

> Update user level:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/user/user_level \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '[
    {
      "user_id": "5f9a747p00c2abf3d4a54d4q",
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
    'user_id': '5f9a747p00c2abf3d4a54d4q',
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
    user_id: "5f9a747p00c2abf3d4a54d4q",
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

## • Set user carrier invoice

> Set user carrier invoice:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/user/invoice \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "carrier": "/ABCD-F1",
    "verification_code": "E_INVOICE_VERIFICATION_CODE"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/user/invoice'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "carrier": "/ABCD-F1",
  "verification_code": "E_INVOICE_VERIFICATION_CODE"
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  carrier: "/ABCD-F1",
  verification_code: "E_INVOICE_VERIFICATION_CODE"
}
axios.put('https://api.cardbo.info/api/v6/user/invoice', data, {
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

### HTTP Request

`PUT https://api.cardbo.info/api/v6/user/invoice`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter         | Required | Type  | Description
----------------- | -------- | ----- | -----------
carrier           | true    | string | mobile pay carrier code
verification_code | true    | string | verification code

### Response

#### Success

Key    | Type | Description
------ | ---- | -----------
status | bool | mobile pay carrier status

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Set user card payment date

> Set user card payment date:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/user/card_payment_date \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "payment_date": 1
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/user/card_payment_date'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "card_id": "5f9a747p00c2abf3d4a54d4q",
  "payment_date": 1
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  card_id: "5f9a747p00c2abf3d4a54d4q",
  payment_date: 1
}
axios.put('https://api.cardbo.info/api/v6/user/card_payment_date', data, {
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
    "user_id": "5f9a747p00c2abf3d4a54d4q",
    "line_id": "Udchd7f131dvvhdbe166692206a12335c",
    "username": "Harrison Peng",
    "image": "https://image.com/image.png",
    "cards": [
      {
        "card_id": "5f9a747p00c2abf3d4a54d4q",
        "name": "永豐幣倍卡",
        "bank": {
          "bank_id": "5f756d85c2349d9139648a7d",
          "name": "永豐銀行",
          "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/sinopac-bank.png",
          "image": "https://i.imgur.com/1g5nYEN.png",
          "code": "807"
        },
        "level": 5,
        "image": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
        "issuer": "MASTERCARD"
      }
    ],
    "user_mobilepays": [
      {
        "mobilepay": {
          "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
          "name": "Apple Pay",
          "image": "https://storage.googleapis.com/cardbo-images/mobile-pay/apple-pay.png",
          "user_has": false
        },
        "cards": [
          {
            "card_id": "5f9a747p00c2abf3d4a54d4q",
            "name": "永豐幣倍卡",
            "bank": {
              "bank_id": "5f756d85c2349d9139648a7d",
              "name": "永豐銀行",
              "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/sinopac-bank.png",
              "image": "https://i.imgur.com/1g5nYEN.png",
              "code": "807"
            },
            "level": 5,
            "image": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
            "issuer": "MASTERCARD"
          }
        ]
      }
    ],
    "user_level": 1,
    "payment_willing": 1,
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "last_login": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Set user card payment date

### HTTP Request

`PUT https://api.cardbo.info/api/v6/user/card_payment_date`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter    | Required | Type   | Description
------------ | -------- | ------ | -----------
card_id      | true     | string | card id
payment_date | true     | int    | payment date

### Response

#### Success

Key                   | Type                 | Enums | Description
--------------------- | -------------------- | ----- | -----------
user_id               | string               |       | User id
line_id               | string               |       | LINE id
username              | string               |       | Username
image                 | string               |       | User image
email                 | string               |       | Email
phone_number          | string               |       | Phone number
cards                 | []Card               |       | User own card array
user_mobilepays       | []UserMobilepay      |       | User own mobile pay array
user_level            | int                  | GENERAL: `1` <br/> VIP: `2` <br/> DEVELOPER: `3` | User level
invoice               | UserInvoice          |       | user invcoie info
subscription          | int                  | UNSUBSCRIBED: `1` <br/> SUBSCRIBED: `2` | is user subscribe the user reward
update_message        | bool                 |       | does the user need to get the update message
interested_categories | []InterestedCategory |       | user interest categories data
created_at            | int                  |       | create time in timestamp
updated_at            | int                  |       | update time in timestamp
last_login            | int                  |       | User last login time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Unset user card payment date

> Unset user card payment date:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/user/card_payment_date/unset \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card_id": "5f9a747p00c2abf3d4a54d4q",
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/user/card_payment_date/unset'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "card_id": "5f9a747p00c2abf3d4a54d4q",
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  card_id: "5f9a747p00c2abf3d4a54d4q",
}
axios.put('https://api.cardbo.info/api/v6/user/card_payment_date/unset', data, {
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
    "user_id": "5f9a747p00c2abf3d4a54d4q",
    "line_id": "Udchd7f131dvvhdbe166692206a12335c",
    "username": "Harrison Peng",
    "image": "https://image.com/image.png",
    "cards": [
      {
        "card_id": "5f9a747p00c2abf3d4a54d4q",
        "name": "永豐幣倍卡",
        "bank": {
          "bank_id": "5f756d85c2349d9139648a7d",
          "name": "永豐銀行",
          "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/sinopac-bank.png",
          "image": "https://i.imgur.com/1g5nYEN.png",
          "code": "807"
        },
        "level": 5,
        "image": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
        "issuer": "MASTERCARD"
      }
    ],
    "user_mobilepays": [
      {
        "mobilepay": {
          "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
          "name": "Apple Pay",
          "image": "https://storage.googleapis.com/cardbo-images/mobile-pay/apple-pay.png",
          "user_has": false
        },
        "cards": [
          {
            "card_id": "5f9a747p00c2abf3d4a54d4q",
            "name": "永豐幣倍卡",
            "bank": {
              "bank_id": "5f756d85c2349d9139648a7d",
              "name": "永豐銀行",
              "logo": "https://storage.googleapis.com/cardbo-images/bank/logo/sinopac-bank.png",
              "image": "https://i.imgur.com/1g5nYEN.png",
              "code": "807"
            },
            "level": 5,
            "image": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
            "issuer": "MASTERCARD"
          }
        ]
      }
    ],
    "user_level": 1,
    "payment_willing": 1,
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "last_login": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Unset user card payment date

### HTTP Request

`PUT https://api.cardbo.info/api/v6/user/card_payment_date/unset`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter    | Required | Type   | Description
------------ | -------- | ------ | -----------
card_id      | true     | string | card id
payment_date | true     | int    | payment date

### Response

#### Success

Key                   | Type                 | Enums | Description
--------------------- | -------------------- | ----- | -----------
user_id               | string               |       | User id
line_id               | string               |       | LINE id
username              | string               |       | Username
image                 | string               |       | User image
email                 | string               |       | Email
phone_number          | string               |       | Phone number
cards                 | []Card               |       | User own card array
user_mobilepays       | []UserMobilepay      |       | User own mobile pay array
user_level            | int                  | GENERAL: `1` <br/> VIP: `2` <br/> DEVELOPER: `3` | User level
invoice               | UserInvoice          |       | user invcoie info
subscription          | int                  | UNSUBSCRIBED: `1` <br/> SUBSCRIBED: `2` | is user subscribe the user reward
update_message        | bool                 |       | does the user need to get the update message
interested_categories | []InterestedCategory |       | user interest categories data
created_at            | int                  |       | create time in timestamp
updated_at            | int                  |       | update time in timestamp
last_login            | int                  |       | User last login time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Set user mobile pay no card binding

> Set user mobile pay no card binding:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/user/mobilepay/{mobilepay_id}/set_no_card \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/user/mobilepay/{mobilepay_id}/set_no_card'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.put(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.put('https://api.cardbo.info/api/v6/user/mobilepay/{mobilepay_id}/set_no_card', data, {
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
    "user_id": "5f9a747p00c2abf3d4a54d4q",
    "line_id": "Udchd7f131dvvhdbe166692206a12335c",
    "username": "Harrison Peng",
    "image": "https://image.com/image.png",
    "cards": [
      {
        "card_info": "...",
      }
    ],
    "user_mobilepays": [
      {
        "mobilepay": {
          "mobilepay_info": "...",
        },
        "no_card_binding": false,
        "cards": [
          {
            "card_info": "...",
          }
        ]
      }
    ],
    "user_level": 1,
    "payment_willing": 1,
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "last_login": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Set user mobile pay no card binding

### HTTP Request

`PUT https://api.cardbo.info/api/v6/user/mobilepay/{mobilepay_id}/set_no_card`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key                   | Type                 | Enums | Description
--------------------- | -------------------- | ----- | -----------
user_id               | string               |       | User id
line_id               | string               |       | LINE id
username              | string               |       | Username
image                 | string               |       | User image
email                 | string               |       | Email
phone_number          | string               |       | Phone number
cards                 | []Card               |       | User own card array
user_mobilepays       | []UserMobilepay      |       | User own mobile pay array
user_level            | int                  | GENERAL: `1` <br/> VIP: `2` <br/> DEVELOPER: `3` | User level
invoice               | UserInvoice          |       | user invcoie info
subscription          | int                  | UNSUBSCRIBED: `1` <br/> SUBSCRIBED: `2` | is user subscribe the user reward
update_message        | bool                 |       | does the user need to get the update message
interested_categories | []InterestedCategory |       | user interest categories data
created_at            | int                  |       | create time in timestamp
updated_at            | int                  |       | update time in timestamp
last_login            | int                  |       | User last login time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Unset user mobile pay no card binding

> Unset user mobile pay no card binding:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/user/mobilepay/{mobilepay_id}/unset_no_card \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/user/mobilepay/{mobilepay_id}/unset_no_card'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.put(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.put('https://api.cardbo.info/api/v6/user/mobilepay/{mobilepay_id}/unset_no_card', data, {
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
    "user_id": "5f9a747p00c2abf3d4a54d4q",
    "line_id": "Udchd7f131dvvhdbe166692206a12335c",
    "username": "Harrison Peng",
    "image": "https://image.com/image.png",
    "cards": [
      {
        "card_info": "...",
      }
    ],
    "user_mobilepays": [
      {
        "mobilepay": {
          "mobilepay_info": "...",
        },
        "no_card_binding": false,
        "cards": [
          {
            "card_info": "...",
          }
        ]
      }
    ],
    "user_level": 1,
    "payment_willing": 1,
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "last_login": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Unset user mobile pay no card binding

### HTTP Request

`PUT https://api.cardbo.info/api/v6/user/mobilepay/{mobilepay_id}/unset_no_card`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key                   | Type                 | Enums | Description
--------------------- | -------------------- | ----- | -----------
user_id               | string               |       | User id
line_id               | string               |       | LINE id
username              | string               |       | Username
image                 | string               |       | User image
email                 | string               |       | Email
phone_number          | string               |       | Phone number
cards                 | []Card               |       | User own card array
user_mobilepays       | []UserMobilepay      |       | User own mobile pay array
user_level            | int                  | GENERAL: `1` <br/> VIP: `2` <br/> DEVELOPER: `3` | User level
invoice               | UserInvoice          |       | user invcoie info
subscription          | int                  | UNSUBSCRIBED: `1` <br/> SUBSCRIBED: `2` | is user subscribe the user reward
update_message        | bool                 |       | does the user need to get the update message
interested_categories | []InterestedCategory |       | user interest categories data
created_at            | int                  |       | create time in timestamp
updated_at            | int                  |       | update time in timestamp
last_login            | int                  |       | User last login time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get user pocket

> Get user pocket:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/user/pocket \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/user/pocket'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/user/pocket', {
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
      "{user_info}": "..."
    },
    "mobilepays": [
      {
        "user_has": true,
        "mobilepay": {
          "{mobilepay_info}": "..."
        }
      }
    ],
    "bank_cards": [
      {
        "bank": {
          "{bank_info}": "...",
        },
        "cards": [
          {
            "user_has": true,
            "card": {
              "{card_info}": "..."
            }
          }
        ]
      }
    ],
    "popular_cards": [
      {
        "{card_info}": "...",
      }
    ]
  },
  "timestamp": 1617601542000
}
```

Get user pocket

### HTTP Request

`GET https://api.cardbo.info/api/v6/user/pocket`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key           | Type              | Description
------------- | ----------------- | -----------
user          | User              | User info
mobilepays    | []PocketMobilePay | Mobile pays info included user has the pay or not
bank_cards    | []BankCard        | All bank cards info
popular_cards | []Card            | Array of popular cards

*PocketMobilePay*

Key       | Type      | Description
--------- | --------- | -----------
user_has  | bool      | Does user has the mobile pay
mobilepay | MobilePay | Mobile pay info

*BankCard*

Key   | Type       | Description
----- | ---------- | -----------
bank  | Bank       | Bank info
cards | PocketCard | Card info included user has the card or not

*PocketCard*

Key      | Type | Description
-------- | ---- | -----------
user_has | bool | Does user has the card
card     | Card | Card info

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get user status

> Get status of user type:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/user/status \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/user/status'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/user/status', {
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
    "card": true,
    "mobilepay": true,
    "payment_date": false,
    "card_questionnaire": false
  },
  "timestamp": 1617601542000
}
```

Get status of user type

### HTTP Request

`GET https://api.cardbo.info/api/v6/user/status`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key                | Type | Description
------------------ | ---- | -----------
card               | bool | Does user have at least one card
mobilepay          | bool | Does all user's mobile pays combine with cards
payment_date       | bool | Does user finish payment date of all cards
card_questionnaire | bool | Does user finish questionnaire of all cards

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Set user card reward order

> Set user card reward order:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/user/card/reward_order \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "offers": [
      "5f9a747p00c2abf3d4a54d4q"
    ]
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/user/card/reward_order'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  'card_id': '5f9a747p00c2abf3d4a54d4q',
  'offers': [
    '5f9a747p00c2abf3d4a54d4q'
  ]
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  card_id: "5f9a747p00c2abf3d4a54d4q",
  offers: [
    "5f9a747p00c2abf3d4a54d4q"
  ]
}
axios.put('https://api.cardbo.info/api/v6/user/card/reward_order', data, {
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
    "user_id": "5f9a747p00c2abf3d4a54d4q",
    "line_id": "Udchd7f131dvvhdbe166692206a12335c",
    "username": "Harrison Peng",
    "image": "https://image.com/image.png",
    "cards": [
      {
        "card_info": "...",
      }
    ],
    "user_mobilepays": [
      {
        "mobilepay": {
          "mobilepay_info": "...",
        },
        "no_card_binding": false,
        "cards": [
          {
            "card_info": "...",
          }
        ]
      }
    ],
    "payment_willing": 1,
    "user_level": 1,
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "last_login": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Set user card reward order

### HTTP Request

`PUT https://api.cardbo.info/api/v6/user/card/reward_order`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter | Required | Type     | Description
--------- | -------- | -------- | -----------
card_id   | true     | string   | card id
offers    | true     | []string | order array of offer id

### Response

#### Success

Key                   | Type                 | Enums | Description
--------------------- | -------------------- | ----- | -----------
user_id               | string               |       | User id
line_id               | string               |       | LINE id
username              | string               |       | Username
image                 | string               |       | User image
email                 | string               |       | Email
phone_number          | string               |       | Phone number
cards                 | []Card               |       | User own card array
user_mobilepays       | []UserMobilepay      |       | User own mobile pay array
user_level            | int                  | GENERAL: `1` <br/> VIP: `2` <br/> DEVELOPER: `3` | User level
invoice               | UserInvoice          |       | user invcoie info
subscription          | int                  | UNSUBSCRIBED: `1` <br/> SUBSCRIBED: `2` | is user subscribe the user reward
update_message        | bool                 |       | does the user need to get the update message
interested_categories | []InterestedCategory |       | user interest categories data
created_at            | int                  |       | create time in timestamp
updated_at            | int                  |       | update time in timestamp
last_login            | int                  |       | User last login time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Set user payment willing

> Set user payment willing:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/user/subscription/willing \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "payment_willing": true
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/user/subscription/willing'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "payment_willing": true
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  payment_willing: true
}
axios.put('https://api.cardbo.info/api/v6/user/subscription/willing', data, {
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
    "user_id": "5f9a747p00c2abf3d4a54d4q",
    "line_id": "Udchd7f131dvvhdbe166692206a12335c",
    "username": "Harrison Peng",
    "image": "https://image.com/image.png",
    "cards": [
      {
        "card_info": "...",
      }
    ],
    "user_mobilepays": [
      {
        "mobilepay": {
          "mobilepay_info": "...",
        },
        "no_card_binding": false,
        "cards": [
          {
            "card_info": "...",
          }
        ]
      }
    ],
    "payment_willing": 1,
    "user_level": 1,
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "last_login": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Set user payment willing

### HTTP Request

`PUT https://api.cardbo.info/api/v6/user/subscription/willing`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter       | Required | Type | Description
--------------- | -------- | ---- | -----------
payment_willing | true     | bool | Does the user have willing to pay

### Response

#### Success

Key                   | Type                 | Enums | Description
--------------------- | -------------------- | ----- | -----------
user_id               | string               |       | User id
line_id               | string               |       | LINE id
username              | string               |       | Username
image                 | string               |       | User image
email                 | string               |       | Email
phone_number          | string               |       | Phone number
cards                 | []Card               |       | User own card array
user_mobilepays       | []UserMobilepay      |       | User own mobile pay array
user_level            | int                  | GENERAL: `1` <br/> VIP: `2` <br/> DEVELOPER: `3` | User level
invoice               | UserInvoice          |       | user invcoie info
subscription          | int                  | UNSUBSCRIBED: `1` <br/> SUBSCRIBED: `2` | is user subscribe the user reward
update_message        | bool                 |       | does the user need to get the update message
interested_categories | []InterestedCategory |       | user interest categories data
created_at            | int                  |       | create time in timestamp
updated_at            | int                  |       | update time in timestamp
last_login            | int                  |       | User last login time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# ◉ Administrator

## • Create administrator

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
    "administrator_id": "5f9a747p00c2abf3d4a54d4q",
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

## • Get administrator

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
    "administrator_id": "5f9a747p00c2abf3d4a54d4q",
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

## • Delete administrator

> Delete administrator:

```shell
curl --request DELETE \
  --url https://api.cardbo.info/api/v5/administrator/5f9a747p00c2abf3d4a54d4q \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/administrator/5f9a747p00c2abf3d4a54d4q'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.delete(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.delete('https://api.cardbo.info/api/v5/administrator/5f9a747p00c2abf3d4a54d4q', {
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
    "administrator_id": "5f9a747p00c2abf3d4a54d4q",
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

## • Get employee list

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
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "account": "administrator_account",
      "username": "Harrison"
    }
  ],
  "timestamp": 1617601542000
}
```

Delete a administrator

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

## • Update administrator level

> Update administrator level:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/administrator/5f9a747p00c2abf3d4a54d4q/level \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "level": 1
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/administrator/5f9a747p00c2abf3d4a54d4q/level'
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
axios.delete('https://api.cardbo.info/api/v5/administrator/5f9a747p00c2abf3d4a54d4q/level', data, {
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
    "administrator_id": "5f9a747p00c2abf3d4a54d4q",
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
  --url https://api.cardbo.info/api/v5/administrator/5f9a747p00c2abf3d4a54d4q/password \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "password": "old_password",
    "new_password": "new_password"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/administrator/5f9a747p00c2abf3d4a54d4q/password'
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
axios.put('https://api.cardbo.info/api/v5/administrator/5f9a747p00c2abf3d4a54d4q/password', data, {
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

## • Update administrator profile

> Update administrator profile:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/administrator/5f9a747p00c2abf3d4a54d4q/profile \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "password": "old_password",
    "new_password": "new_password"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/administrator/5f9a747p00c2abf3d4a54d4q/profile'
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
axios.put('https://api.cardbo.info/api/v5/administrator/5f9a747p00c2abf3d4a54d4q/profile', data, {
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
    "administrator_id": "5f9a747p00c2abf3d4a54d4q",
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

## • Reset employee password

> Update administrator password:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/administrator/5f9a747p00c2abf3d4a54d4q/reset_password \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/administrator/5f9a747p00c2abf3d4a54d4q/reset_password'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.put(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.put('https://api.cardbo.info/api/v5/administrator/5f9a747p00c2abf3d4a54d4q/reset_password', {
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
    "administrator_id": "5f9a747p00c2abf3d4a54d4q",
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

# ◉ Bank

## • Get banks

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

# ◉ Card

## • Get formal cards

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
      "card_id": "5f9a747p00c2abf3d4a54d4q",
      "name": "台新@GoGo卡",
      "options": [
        {
          "issuer": "VISA",
          "level": 4,
          "level_name": "御璽卡"
        }
      ],
      "images": {
        "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
        "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
        "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
        "administrator_id": "5f9a747p00c2abf3d4a54d4q",
        "username": "Harrison"
      },
      "created_at": 1617601542000,
      "updated_at": 1617601542000,
      "examiner": {
        "administrator_id": "5f9a747p00c2abf3d4a54d4q",
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

## • Get formal cards by bank id

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
      "card_id": "5f9a747p00c2abf3d4a54d4q",
      "name": "台新@GoGo卡",
      "options": [
        {
          "issuer": "VISA",
          "level": 4,
          "level_name": "御璽卡"
        }
      ],
      "images": {
        "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
        "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
        "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
        "administrator_id": "5f9a747p00c2abf3d4a54d4q",
        "username": "Harrison"
      },
      "created_at": 1617601542000,
      "updated_at": 1617601542000,
      "examiner": {
        "administrator_id": "5f9a747p00c2abf3d4a54d4q",
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

## • Get promoted formal cards

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
      "card_id": "5f9a747p00c2abf3d4a54d4q",
      "name": "台新@GoGo卡",
      "options": [
        {
          "issuer": "VISA",
          "level": 4,
          "level_name": "御璽卡"
        }
      ],
      "images": {
        "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
        "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
        "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
        "administrator_id": "5f9a747p00c2abf3d4a54d4q",
        "username": "Harrison"
      },
      "created_at": 1617601542000,
      "updated_at": 1617601542000,
      "examiner": {
        "administrator_id": "5f9a747p00c2abf3d4a54d4q",
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

## • Get formal cards with user has property

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
      "card_id": "5f9a747p00c2abf3d4a54d4q",
      "name": "台新@GoGo卡",
      "options": [
        {
          "issuer": "VISA",
          "level": 4,
          "level_name": "御璽卡"
        }
      ],
      "images": {
        "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
        "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
        "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
        "administrator_id": "5f9a747p00c2abf3d4a54d4q",
        "username": "Harrison"
      },
      "created_at": 1617601542000,
      "updated_at": 1617601542000,
      "examiner": {
        "administrator_id": "5f9a747p00c2abf3d4a54d4q",
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

## • Get formal card by card id

> Get single formal card data by card id:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q', {
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
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Get single formal card data by card id

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

## • Update formal card

> Update formal card information:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q \
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

url = 'https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q'
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
axios.put('https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q', data, {
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
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Update formal card information

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

## • Delete formal card

> Delete formal card:

```shell
curl --request DELETE \
  --url https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q \
  -H 'Authorization: Bearer meowmeowmeowaccess'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.delete(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.delete('https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q', {
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
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Delete formal card

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

## • Add formal card to promote

> Add formal card to promote:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q/add_promote \
  -H 'Authorization: Bearer meowmeowmeowaccess'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q/add_promote'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.put(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.put('https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q/add_promote', {
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
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Add formal card to promote

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

## • Remove formal card from promote

> Remove formal card from promote:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q/remove_promote \
  -H 'Authorization: Bearer meowmeowmeowaccess'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q/remove_promote'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.put(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.put('https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q/remove_promote', {
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
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Add formal card to promote

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

## • Get pending cards

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
  "code": 201,
  "message": "Ok",
  "result": [
    {
      "card_id": "5f9a747p00c2abf3d4a54d4q",
      "name": "台新@GoGo卡",
      "options": [
        {
          "issuer": "VISA",
          "level": 4,
          "level_name": "御璽卡"
        }
      ],
      "images": {
        "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
        "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
        "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
        "administrator_id": "5f9a747p00c2abf3d4a54d4q",
        "username": "Harrison"
      },
      "created_at": 1617601542000,
      "updated_at": 1617601542000,
      "examiner": {
        "administrator_id": "5f9a747p00c2abf3d4a54d4q",
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

## • Insert pending card

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
  "code": 201,
  "message": "Ok",
  "result": {
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Insert a new card to pending card

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

## • Get pending card by card id

> Get single pending card data by card id:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q', {
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
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Get single pending card data by card id

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

## • Update pending card

> Update pending card information:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q \
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

url = 'https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q'
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
axios.put('https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q', data, {
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
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Update pending card information

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

## • Delete pending card

> Delete pending card:

```shell
curl --request DELETE \
  --url https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q \
  -H 'Authorization: Bearer meowmeowmeowaccess'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.delete(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.delete('https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q', {
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
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Delete pending card

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

## • Pass pending card to formal card

> Pass pending card to formal card:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q/passed \
  -H 'Authorization: Bearer meowmeowmeowaccess'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q/passed'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.put(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.put('https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q/passed', {
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
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Pass pending card to formal card

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

## • Fail pending card

> Fail pending card:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q/failed \
  -H 'Authorization: Bearer meowmeowmeowaccess'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q/failed'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.put(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.put('https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q/failed', {
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
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Fail pending card

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

## • Upload pending card image

> Upload pending card image:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q/image \
  -H 'Authorization: Bearer meowmeowmeowaccess'
  --data '{
    "image_key": "image_1",
    "data": "base64-encoded-string"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q/image'
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
axios.post('https://api.cardbo.info/api/v5/card/pending/5f9a747p00c2abf3d4a54d4q/image',data, {
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
  "code": 201,
  "message": "Ok",
  "result": {
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "url": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1"
  },
  "timestamp": 1617601542000
}
```

Upload pending card image

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

## • Set formal card promotion

> Set formal card promotion:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q/promotion \
  -H 'Authorization: Bearer meowmeowmeowaccess'
  --data '{
    "left_promotion": {
      "reward_type": 1,
      "reward_value": 600,
      "reward_name": "LINE Points",
      "title": "新戶首刷回饋"
    },
    "right_promotion": {
      "reward_type": 2,
      "reward_value": 6,
      "reward_name": "%",
      "title": "指定通路最高回饋"
    }
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q/promotion'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "left_promotion": {
    "reward_type": 1,
    "reward_value": 600,
    "reward_name": "LINE Points",
    "title": "新戶首刷回饋"
  },
  "right_promotion": {
    "reward_type": 2,
    "reward_value": 6,
    "reward_name": "%",
    "title": "指定通路最高回饋"
  }
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  left_promotion: {
    reward_type: 1,
    reward_value: 600,
    reward_name: "LINE Points",
    title: "新戶首刷回饋"
  },
  right_promotion: {
    reward_type: 2,
    reward_value: 6,
    reward_name: "%",
    title: "指定通路最高回饋"
  }
}
axios.post('https://api.cardbo.info/api/v5/card/formal/5f9a747p00c2abf3d4a54d4q/promotion',data, {
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
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "name": "台新@GoGo卡",
    "options": [
      {
        "issuer": "VISA",
        "level": 4,
        "level_name": "御璽卡"
      }
    ],
    "images": {
      "image_1": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-1.png",
      "image_2": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-2.png",
      "image_3": "https://storage.googleapis.com/cardbo-images/card/5f9a747p00c2abf3d4a54d4q-3.png"
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
    "card_promotion": {
      "left_promotion": {
        "reward_type": 1,
        "reward_value": 600,
        "reward_name": "LINE Points",
        "title": "新戶首刷回饋"
      },
      "right_promotion": {
        "reward_type": 2,
        "reward_value": 6,
        "reward_name": "%",
        "title": "指定通路最高回饋"
      }
    },
    "creator": {
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "created_at": 1617601542000,
    "updated_at": 1617601542000,
    "examiner": {
      "administrator_id": "5f9a747p00c2abf3d4a54d4q",
      "username": "Harrison"
    },
    "status": 3,
    "comment": ""
  },
  "timestamp": 1617601542000
}
```

Set formal card promotion

### HTTP Request

`PUT https://api.cardbo.info/api/v5/card/formal/{card_id}/promotion`

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

Parameter       | Required | Type              | Description
--------------- | -------- | ----------------- | -----------
left_promotion  | true     | CardPromotionInfo | left promotion data
right_promotion | true     | CardPromotionInfo | left promotion data

##### CardPromotionInfo

Parameter       | Required | Type   | Enums                            | Description
--------------- | -------- | ------ | -------------------------------- | -----------
reward_type     | true     | int    | NEW_USER: `1` </br> GENERAL: `2` | reward type
reward_value    | false    | int    |                                  | reward value for cashback reward
reward_name     | true     | string |                                  | reward name
title           | true     | string |                                  | reward title

### Response

#### Success

Key            | Type          | Enums                                            | Description
-------------- | ------------- | ------------------------------------------------ | -----------
card_id        | string        |                                                  | card id
name           | string        |                                                  | card name
bank           | Bank          |                                                  | bank information
options        | string        |                                                  | logo url
images         | string        |                                                  | image url
promote        | bool          |                                                  | is the card promoted
card_promotion | CardPromotion |                                                  | card promotion data
website        | string        |                                                  | card official website
creator        | string        |                                                  | creator id
examiner       | string        |                                                  | examiner id
created_at     | string        |                                                  | created timestamp
updated_at     | string        |                                                  | updated timestamp
status         | int           | PENDING: `1` <br/> FAILED: `2` <br/> PASSED: `3` | status
comment        | string        |                                                  | failure comment

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get card reward information

> Get card reward information:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v5/cards/formal/reward_info \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5/cards/formal/reward_info'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v5/cards/formal/reward_info', {
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
  "code": 201,
  "message": "Ok",
  "result": {
    "user_cards": [
      {
        "card_info": "..."
      }
    ],
    "bank_cards": [
      {
        "bank": {
          "bank_info": "..."
        },
        "cards": [
          {
            "card_info": "...",
          }
        ]
      },
    ],
    "cooperated_cards": [
      {
        "card_info": "..."
      }
    ],
    "promote_cards": [
      {
        "card_info": "..."
      }
    ]
  },
  "timestamp": 1617601542000
}
```

Get card reward information

### HTTP Request

`GET https://api.cardbo.info/api/v5/cards/formal/reward_info`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key              | Type          | Description
---------------- | ------------- | -----------
user_cards       | []CardDisplay | user's card array
bank_cards       | []Card        | all card information of banks
cooperated_cards | []Card        | cooperated card array info (old)
promote_cards    | []CardDisplay | cooperated card array info (new)

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# ◉ MobilePay

## • Insert mobile pay

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
  "code": 201,
  "message": "Ok",
  "result": {
    "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
    "name": "Apple Pay",
    "image": "https://storage.googleapis.com/cardbo-images/mobile-pay/apple-pay.png"
  },
  "timestamp": 1617601542000
}
```

Insert a new mobile pay

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

## • Get mobile pays

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
      "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
      "name": "Apple Pay",
      "image": "https://storage.googleapis.com/cardbo-images/mobile-pay/apple-pay.png",
      "user_has": false
    }
  ],
  "timestamp": 1617601542000
}
```

Get mobile pays data

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

# ◉ Offer

## • Insert pending offer

> Insert pending offer:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v6/offer/pending \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "option_array": [
      {
        "option": "OPT-1"
      }
    ],
    "offer_bank": {
      "bank": {
        "bank_id": "5f9a747p00c2abf3d4a54d4q"
      },
      "options": [
        {
          "issuer": "VISA",
          "level": 5
        }
      ]
    },
    "excluded_cards": [
      {
        "card_id": "5f9a747p00c2abf3d4a54d4q"
      }
    ],
    "cards": [
      {
        "card_id": "5f9a747p00c2abf3d4a54d4q"
      }
    ],
    "mobilepay_array": [
      {
        "mobilepay": {
          "mobilepay_id": "5f9a747p00c2abf3d4a54d4q"
        },
        "payment_type": 0
      }
    ],
    "mobilepay_option": 0,
    "eticket_payment": [
      {
        "eticket_id": "5f9a747p00c2abf3d4a54d4q"
      }
    ],
    "stores": [
      {
        "store": {
          "store_id": "5f9a747p00c2abf3d4a54d4q"
        },
        "channel": 0
      }
    ],
    "mpt_included_stores": [
      {
        "store": {
          "store_id": "5f9a747p00c2abf3d4a54d4q"
        },
        "channel": 1
      }
    ],
    "excluded_stores": [
      {
        "store": {
          "store_id": "5f9a747p00c2abf3d4a54d4q"
        },
        "channel": 2
      }
    ],
    "url": "https://url.com",
    "start_date": 1617601542000,
    "end_date": 1617601542000,
    "general_tags": [
      {
        "tag_id": "5f9a747p00c2abf3d4a54d4q",
      }
    ],
    "mobilepay_tags": [
      {
        "tag": {
          "tag_id": "5f9a747p00c2abf3d4a54d4q",
        },
        "scope": 1,
        "payment_type": 0
      }
    ],
    "excluded_tags": [
      {
        "tag_id": "5f9a747p00c2abf3d4a54d4q",
      }
    ],
    "is_independent_reward": false,
    "reward_type": 1,
    "pre_conditions": [
      "pre1"
    ],
    "post_conditions": [
      "post1"
    ],
    "mobile_pay_binding": [
      {
        "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
      }
    ],
    "weekday": [
      1,
      7
    ],
    "month_days": [
      1,
      2
    ],
    "time": "10:00-12:00",
    "pay_methods": [
      {
        "mobilepay": {
          "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
        },
        "payment_type": 0
      }
    ],
    "register_url": "https://www.www.www",
    "coupon_code": "coupon",
    "discount_url": "https://www.www.www",
    "account_binding_type": 1,
    "account_name": "account",
    "electronic_bill_type": 1,
    "installment_required": false,
    "installment_acceptable": false,
    "installment_reward_type": "依分期回饋",
    "note": "",
    "upper_bounds": [
      {
        "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
        "cash_upper_bound": 200,
        "frequency_upper_bound": 3,
        "upper_bound_period": 5,
        "store_independent": false,
        "sharing_upper_bounds": [
          "5f9a747p00c2abf3d4a54d4q"
        ]
      }
    ],
    "reward_content_type": 2,
    "mincost_type": 17,
    "reward_contents": [
      {
        "mincost_period_times": 1,
        "mincost_period": 5,
        "excluded_places": [],
        "mincost_value": 6000,
        "reward_name": "Line Points",
        "reward_value": 3.5,
        "coin_image": "https://image.png"
      }
    ]
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/offer/pending'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "option_array": [
    {
      "option": "OPT-1"
    }
  ],
  "offer_bank": {
    "bank": {
      "bank_id": "5f9a747p00c2abf3d4a54d4q"
    },
    "options": [
      {
        "issuer": "VISA",
        "level": 5
      }
    ]
  },
  "excluded_cards": [
    {
      "card_id": "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  "cards": [
    {
      "card_id": "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  "mobilepay_array": [
    {
      "mobilepay": {
        "mobilepay_id": "5f9a747p00c2abf3d4a54d4q"
      },
      "payment_type": 0
    }
  ],
  "mobilepay_option": 0,
  "eticket_payment": [
    {
      "eticket_id": "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  "stores": [
    {
      "store": {
        "store_id": "5f9a747p00c2abf3d4a54d4q"
      },
      "channel": 0
    }
  ],
  "mpt_included_stores": [
    {
      "store": {
        "store_id": "5f9a747p00c2abf3d4a54d4q"
      },
      "channel": 1
    }
  ],
  "excluded_stores": [
    {
      "store": {
        "store_id": "5f9a747p00c2abf3d4a54d4q"
      },
      "channel": 2
    }
  ],
  "url": "https://url.com",
  "start_date": 1617601542000,
  "end_date": 1617601542000,
  "general_tags": [
    {
      "tag_id": "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  "mobilepay_tags": [
    {
      "tag": {
        "tag_id": "5f9a747p00c2abf3d4a54d4q",
      },
      "scope": 1,
      "payment_type": 0
    }
  ],
  "excluded_tags": [
    {
      "tag_id": "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  "is_independent_reward": false,
  "reward_type": 1,
  "pre_conditions": [
    "pre1"
  ],
  "post_conditions": [
    "post1"
  ],
  "mobile_pay_binding": [
    {
      "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  "weekday": [
    1,
    7
  ],
  "month_days": [
    1,
    2
  ],
  "time": "10:00-12:00",
  "pay_methods": [
    {
      "mobilepay": {
        "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
      },
      "payment_type": 0
    }
  ],
  "register_url": "https://www.www.www",
  "coupon_code": "coupon",
  "discount_url": "https://www.www.www",
  "account_binding_type": 1,
  "account_name": "account",
  "electronic_bill_type": 1,
  "installment_required": false,
  "installment_acceptable": false,
  "installment_reward_type": "依分期回饋",
  "note": "",
  "upper_bounds": [
    {
      "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
      "cash_upper_bound": 200,
      "frequency_upper_bound": 3,
      "upper_bound_period": 5,
      "store_independent": false,
      "sharing_upper_bounds": [
        "5f9a747p00c2abf3d4a54d4q"
      ]
    }
  ],
  "reward_content_type": 2,
  "mincost_type": 17,
  "reward_contents": [
    {
      "mincost_period_times": 1,
      "mincost_period": 5,
      "excluded_places": [],
      "mincost_value": 6000,
      "reward_name": "Line Points",
      "reward_value": 3.5,
      "coin_image": "https://image.png"
    }
  ]
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  option_array: [
    {
      option: "OPT-1"
    }
  ],
  offer_bank: {
    bank: {
      "bank_id": "5f9a747p00c2abf3d4a54d4q"
    },
    options: [
      {
        issuer: VISA,
        level: 5
      }
    ]
  },
  excluded_cards: [
    {
      card_id: "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  cards: [
    {
      card_id: "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  mobilepay_array: [
    {
      mobilepay: {
        mobilepay_id: "5f9a747p00c2abf3d4a54d4q"
      },
      payment_type: 0
    }
  ],
  mobilepay_option: 0,
  eticket_payment: [
    {
      eticket_id: "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  stores: [
    {
      store: {
        store_id: "5f9a747p00c2abf3d4a54d4q"
      },
      channel: 0
    }
  ],
  mpt_included_stores: [
    {
      store: {
        store_id: "5f9a747p00c2abf3d4a54d4q"
      },
      channel: 1
    }
  ],
  excluded_stores: [
    {
      store: {
        store_id: "5f9a747p00c2abf3d4a54d4q"
      },
      channel: 2
    }
  ],
  url: "https://url.com",
  start_date: 1617601542000,
  end_date: 1617601542000,
  general_tags: [
    {
      tag_id: "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  mobilepay_tags: [
    {
      tag: {
        tag_id: "5f9a747p00c2abf3d4a54d4q",
      },
      scope: 1,
      payment_type: 0
    }
  ],
  excluded_tags: [
    {
      tag_id: "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  is_independent_reward: false,
  reward_type: 1,
  pre_conditions: [
    "pre1"
  ],
  post_conditions: [
    "post1"
  ],
  mobile_pay_binding: [
    {
      mobilepay_id: "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  weekday: [
    1,
    7
  ],
  month_days: [
    1,
    2
  ],
  time: "10:00-12:00",
  pay_methods: [
    {
      mobilepay: {
        mobilepay_id: "5f9a747p00c2abf3d4a54d4q",
      },
      payment_type: 0
    }
  ],
  register_url: "https://www.www.www",
  coupon_code: "coupon",
  discount_url: "https://www.www.www",
  account_binding_type: 1,
  account_name: "account",
  electronic_bill_type: 1,
  installment_required: false,
  installment_acceptable: false,
  installment_reward_type: "依分期回饋",
  note: "",
  upper_bounds: [
    {
      upperbound_id: "5f9a747p00c2abf3d4a54d4q",
      cash_upper_bound: 200,
      frequency_upper_bound: 3,
      upper_bound_period: 5,
      store_independent: false,
      sharing_upper_bounds: [
        "5f9a747p00c2abf3d4a54d4q"
      ]
    }
  ],
  reward_content_type: 2,
  mincost_type: 17,
  reward_contents: [
    {
      mincost_period_times: 1,
      mincost_period: 5,
      excluded_places: [],
      mincost_value: 6000,
      reward_name: "Line Points",
      reward_value: 3.5,
      coin_image: "https://image.png"
    }
  ]
}
axios.post('https://api.cardbo.info/api/v6/offer/pending', data, {
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
  "code": 201,
  "message": "Ok",
  "result": {
    "offer_id": "5f9a747p00c2abf3d4a54d4q",
    "option_array": [
      {
        "option": "OPT-1",
        "bindings": []
      }
    ],
    "offer_bank": {
      "bank": {
        "bank_info": "...",
      },
      "options": [
        {
          "issuer": "VISA",
          "level": 5
        }
      ]
    },
    "excluded_cards": [
      {
        "card_info": "..."
      }
    ],
    "cards": [
      {
        "card_info": "..."
      }
    ],
    "mobilepay_array": [
      {
        "mobilepay": {
          "mobilepay_info": "...",
        },
        "payment_type": 0
      }
    ],
    "mobilepay_option": 0,
    "eticket_payment": [
      {
        "eticket_info": "..."
      }
    ],
    "stores": [
      {
        "store": {
          "{store_info}": "..."
        },
        "channel": 0
      }
    ],
    "mpt_included_stores": [
      {
        "store": {
          "{store_info}": "..."
        },
        "channel": 1
      }
    ],
    "excluded_stores": [
      {
        "store": {
          "{store_info}": "..."
        },
        "channel": 2
      }
    ],
    "url": "https://url.com",
    "start_date": 1617601542000,
    "end_date": 1617601542000,
    "general_tags": [
      {
        "tag_info": "..."
      }
    ],
    "mobilepay_tags": [
      {
        "{mobilepay_tag_info}": "..."
      }
    ],
    "excluded_tags": [
      {
        "tag_info": "..."
      }
    ],
    "is_independent_reward": false,
    "reward_type": 1,
    "pre_conditions": [
      "pre1"
    ],
    "post_conditions": [
      "post1"
    ],
    "mobile_pay_binding": [
      {
        "mobilepay_info": "...",
      }
    ],
    "weekday": [
      1,
      7
    ],
    "month_days": [
      1,
      2
    ],
    "time": "10:00-12:00",
    "pay_methods": [
      {
        "mobilepay": {
          "mobilepay_info": "..."
        },
        "payment_type": 0
      }
    ],
    "register_url": "https://www.www.www",
    "coupon_code": "coupon",
    "discount_url": "https://www.www.www",
    "account_binding_type": 0,
    "account_name": "account",
    "electronic_bill_type": 1,
    "installment_required": false,
    "installment_acceptable": false,
    "installment_reward_type": "統一回饋",
    "note": "",
    "upper_bounds": [
      {
        "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
        "cash_upper_bound": 200,
        "frequency_upper_bound": 3,
        "upper_bound_period": 5,
        "store_independent": false,
        "sharing_upper_bounds": [
          "5f9a747p00c2abf3d4a54d4q"
        ]
      }
    ],
    "reward_content_type": 2,
    "mincost_type": 17,
    "reward_contents": [
      {
        "mincost_period_times": 1,
        "mincost_period": 5,
        "excluded_places": [],
        "mincost_value": 6000,
        "reward_name": "Line Points",
        "reward_value": 3.5,
        "coin_image": "https://image.png"
      }
    ]
  },
  "timestamp": 1617601542000
}
```

Insert pending offer

### HTTP Request

`POST https://api.cardbo.info/api/v6/offer/pending`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter               | Required | Type              | Enums | Description
----------------------- | -------- | ----------------- | ----- | -----------
option_array            | false    | []OfferOption     |       | Offer options for user questionnaire
offer_bank              | false    | []OfferBank       |       | All bank of card can get the offer
excluded_cards          | false    | []OfferCard       |       | Cards excluded from bank offer
cards                   | false    | []OfferCard       |       | Array of OfferCard
mobilepay_array         | false    | []OfferMobilePay  |       | mobile pays can get the offer
mobilepay_option        | false    | int               | `1`: 不限制 </br> `2`: 限定帳戶綁定 </br> `3`: 限定綁定信用卡 | Option of the mobile pays to get the offer
eticket_payments        | false    | []ETicket         |       | E-ticket of the card to use to get the offer
stores                  | false    | []OfferStore      |       | Stores to get the offer
mpt_included_stores     | false    | []OfferStore      |       | Stores that can included for mobile pay
excluded_stores         | false    | []OfferStore      |       | Stores that are excluded from the tags
url                     | true     | string            |       | Offer URL
start_date              | true     | int               |       | Offer start date in timeStamp
end_date                | true     | int               |       | Offer end date in timeStamp
general_tags            | false    | []Tag             |       | Tags which the type is general
mobilepay_tags          | false    | []MobilePayTag    |       | Tags which the type is mobilepay
excluded_tags           | false    | []Tag             |       | Tags excluded from the places
is_independent_reward   | true     | bool              |       | Is the offer is independent or not
reward_type             | true     | int               | `1`: 現金回饋-趴數 </br> `2`: 現金回饋-固定值 | Reward type
pre_conditions          | false    | []string          |       | 事前問卷
post_conditions         | false    | []string          |       | 事後問卷
mobile_pay_binding      | false    | []MobilePay       |       | Mobile pays which need to bind to get the offer
weekday                 | false    | []int             | [`1`-`7`] | The day in a week that can get the offer
month_days              | false    | []int             | [`1`-`31`] | The day in a month that can get the offer
time                    | false    | string            |       | The time in a day that can get the offer
pay_methods             | false    | []OfferMobilePay  |       | Mobile pays to use to get the offer
register_url            | false    | string            |       | 登錄網址
coupon_code             | false    | string            |       | 優惠代碼
discount_url            | false    | string            |       | 專屬連結
account_binding_type    | true     | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to bind account
account_name            | false    | string            |       | Account name to bind
electronic_bill_type    | true     | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to apply electronic biil
installment_required    | true     | bool              |       | Need to intall
installment_acceptable  | true     | bool              |       | Can installment get the offer
installment_reward_type | false    | string            | [`依分期回饋`, `統一回饋`] | The type of the installemnt offer
note                    | false    | string            |       | Note
upper_bounds            | false    | []OfferUpperBound |       | Upper bounds
reward_content_type     | true     | int               | `1`: 優惠獨立計算 </br> `2`: 優惠累積計算 </br> `3`: 優惠分段累積計算 | Reward content type
mincost_type            | true     | int               | `1`: 沒有最低消費限制 </br> `2`: 當下消費單筆滿 </br> `3`: 當下消費每滿 </br> `4`: 單一通路總共滿 </br> `5`: 單一通路個別滿 </br> `6`: 單一通路每滿 </br> `7`: 全通路總共滿 </br> `8`: 全通路個別滿 </br> `9`: 全通路每滿 </br> `10`: 一般消費總共滿 </br> `11`: 一般消費個別滿 </br> `12`: 一般消費每滿 </br> `13`: 國內一般消費總共滿 </br> `14`: 國內一般消費個別滿 </br> `15`: 國內一般消費每滿 </br> `16`: 總消費總共滿 </br> `17`: 總消費個別滿 </br> `18`: 總消費每滿 | Minimum cost type
reward_contents         | true     | []RewardContent   |       | Reward contents

*OfferOption*

Parameter | Required | Type   | Description
--------- | -------- | ------ | -----------
option    | true     | string | 方案 (事前問卷)

*OfferBank*

Parameter | Required | Type         | Description
--------- | -------- | ------------ | -----------
bank      | true     | Bank         | Bank info
options   | false    | []CardOption | The options of the card in the bank which can get the offer

*CardOption*

Parameter  | Required | Type   | Enums | Description
---------- | -------- | ------ | ----- | -----------
issuer     | true     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | true     | int    | [`1`-`8`] | level of the card

*OfferCard*

Parameter  | Required | Type   | Enums | Description
---------- | -------- | ------ | ----- | -----------
card_id    | true     | string |       | card id
issuer     | true     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | true     | int    | [`1`-`8`] | level of the card

*OfferMobilePay*

Parameter    | Required | Type      | Enums | Description
------------ | -------- | --------- | ----- | -----------
mobilepay    | true     | MobilePay |       | Mobile pay which can get the offer
payment_type | true     | string    | `1`: 感應支付(NFC) </br> `2`: 掃碼支付 </br> `3`:條碼支付 | Payment tyoe to use to get the offer

*OfferStore*

Parameter | Required | Type  | Enums | Description
--------- | -------- | ----- | ----- | -----------
store     | true     | Store |       | Store object
channel   | true     | int   | `0`: No restriction </br> `1`: Physical store </br> `2`: Web </br> `3`: App | The channel of the store

*MobilePayTag*

Parameter    | Required | Type | Enums | Description
------------ | -------- | ---- | ----- | -----------
tag          | true     | Tag  |       | Tag info
scope        | true     | int  | `1`: 所有消費 </br> `2`: 一般消費 </br> `3`: 國內一般消費 | The scope of the expense
payment_type | false    | int  | `1`: 感應(NFC) </br> `2`: 掃碼 </br> `3`: 條碼 | Payment type

*OfferUpperBound*

Key                   | Required | Type     | Enums | Description
--------------------- | -------- | -------- | ----- | -----------
cash_upper_bound      | false    | int      |       | cashback upperbound value
frequency_upper_bound | false    | int      |       | how many times can the offer got
upper_bound_period    | true     | int      | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | upper bound period
store_independent     | true     | bool     |       | is the upper bound calculate independent from each store
sharing_upper_bounds  | false    | []string |       | array of upperbound ID share same upper bound (`upper_bound_id`)

*RewardContent*

Key                  | Required | Type    | Enums  | Description
-------------------- | -------- | ------- | ------ | -----------
mincost_period_times | false    | int     |        | how many time for the min cost period
mincost_period       | false    | int     | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | min cost period
excluded_places      | false    | []Store |        | Places that excluded from the min cost
mincost_value        | false    | int     |        | min cost value
reward_name          | true     | string  |        | reward name (現金, Line Points, 街口幣, Open Points, P幣, Hami Point, 代幣...)
reward_value         | true     | float   |        | reward value

### Response

#### Success

*Offer*

Parameter               | Type              | Enums | Description
----------------------- | ----------------- | ----- | -----------
option_array            | []OfferOption     |       | Offer options for user questionnaire
offer_bank              | []OfferBank       |       | All bank of card can get the offer
excluded_cards          | []OfferCard       |       | Cards excluded from bank offer
cards                   | []OfferCard       |       | Array of OfferCard
mobilepay_array         | []OfferMobilePay  |       | mobile pays can get the offer
mobilepay_option        | int               | `1`: 不限制 </br> `2`: 限定帳戶綁定 </br> `3`: 限定綁定信用卡 | Option of the mobile pays to get the offer
eticket_payments        | []ETicket         |       | E-ticket of the card to use to get the offer
stores                  | []OfferStore      |       | Stores to get the offer
mpt_included_stores     | []OfferStore      |       | Stores that can included for mobile pay
excluded_stores         | []OfferStore      |       | Stores that are excluded from the tags
url                     | string            |       | Offer URL
start_date              | int               |       | Offer start date in timeStamp
end_date                | int               |       | Offer end date in timeStamp
general_tags            | []Tag             |       | Tags which the type is general
mobilepay_tags          | []MobilePayTag    |       | Tags which the type is mobilepay
excluded_tags           | []Tag             |       | Tags excluded from the places
is_independent_reward   | bool              |       | Is the offer is independent or not
reward_type             | int               | `1`: 現金回饋-趴數 </br> `2`: 現金回饋-固定值 | Reward type
pre_conditions          | []string          |       | 事前問卷
post_conditions         | []string          |       | 事後問卷
mobile_pay_binding      | []MobilePay       |       | Mobile pays which need to bind to get the offer
weekday                 | []int             | [`1`-`7`] | The day in a week that can get the offer
month_days              | []int             | [`1`-`31`] | The day in a month that can get the offer
time                    | string            |       | The time in a day that can get the offer
pay_methods             | []OfferMobilePay  |       | Mobile pays to use to get the offer
register_url            | string            |       | 登錄網址
coupon_code             | string            |       | 優惠代碼
discount_url            | string            |       | 專屬連結
account_binding_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to bind account
account_name            | string            |       | Account name to bind
electronic_bill_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to apply electronic biil
installment_required    | bool              |       | Need to intall
installment_acceptable  | bool              |       | Can installment get the offer
installment_reward_type | string            | [`依分期回饋`, `統一回饋`] | The type of the installemnt offer
note                    | string            |       | Note
upper_bounds            | []OfferUpperBound |       | Upper bounds
reward_content_type     | int               | `1`: 優惠獨立計算 </br> `2`: 優惠累積計算 </br> `3`: 優惠分段累積計算 | Reward content type
mincost_type            | int               | `1`: 沒有最低消費限制 </br> `2`: 當下消費單筆滿 </br> `3`: 當下消費每滿 </br> `4`: 單一通路總共滿 </br> `5`: 單一通路個別滿 </br> `6`: 單一通路每滿 </br> `7`: 全通路總共滿 </br> `8`: 全通路個別滿 </br> `9`: 全通路每滿 </br> `10`: 一般消費總共滿 </br> `11`: 一般消費個別滿 </br> `12`: 一般消費每滿 </br> `13`: 國內一般消費總共滿 </br> `14`: 國內一般消費個別滿 </br> `15`: 國內一般消費每滿 </br> `16`: 總消費總共滿 </br> `17`: 總消費個別滿 </br> `18`: 總消費每滿 | Minimum cost type
reward_contents         | []RewardContent   |       | Reward contents

*OfferOption*

Parameter | Required | Type   | Description
--------- | -------- | ------ | -----------
option    | true     | string | 方案 (事前問卷)

*OfferBank*

Parameter | Type         | Description
--------- | ------------ | -----------
bank      | Bank         | Bank info
options   | []CardOption | The options of the card in the bank which can get the offer

*CardOption*

Parameter  | Type   | Enums | Description
---------- | ------ | ----- | -----------
issuer     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | int    | [`1`-`8`] | level of the card
level_name | string |       | level name of the card

*OfferCard*

Parameter  | Type   | Enums | Description
---------- | ------ | ----- | -----------
card_id    | string |       | card id
name       | string |       | card name
issuer     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | int    | [`1`-`8`] | level of the card
level_name | string |       | level name of the card

*OfferMobilePay*

Parameter    | Type      | Enums | Description
------------ | --------- | ----- | -----------
mobilepay    | MobilePay |       | Mobile pay which can get the offer
payment_type | string    | `1`: 感應支付(NFC) </br> `2`: 掃碼支付 </br> `3`:條碼支付 | Payment tyoe to use to get the offer

*OfferStore*

Parameter | Required | Type  | Enums | Description
--------- | -------- | ----- | ----- | -----------
store     | true     | Store |       | Store object
channel   | true     | int   | `0`: No restriction </br> `1`: Physical store </br> `2`: Web </br> `3`: App | The channel of the store

*MobilePayTag*

Parameter    | Required | Type | Enums | Description
------------ | -------- | ---- | ----- | -----------
tag          | true     | Tag  |       | Tag info
scope        | true     | int  | `1`: 所有消費 </br> `2`: 一般消費 </br> `3`: 國內一般消費 | The scope of the expense
payment_type | false    | int  | `1`: 感應(NFC) </br> `2`: 掃碼 </br> `3`: 條碼 | Payment type

*OfferUpperBound*

Key                   | Type     | Enums | Description
--------------------- | -------- | ----- | -----------
upperbound_id         | string   |       | upperbound ID
cash_upper_bound      | int      |       | cashback upperbound value
frequency_upper_bound | int      |       | how many times can the offer got
upper_bound_period    | int      | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | upper bound period
store_independent     | bool     |       | is the upper bound calculate independent from each store
sharing_upper_bounds  | []string |       | array of upperbound ID share same upper bound

*RewardContent*

Key                  | Type    | Enums  | Description
-------------------- | ------- | ------ | -----------
mincost_period_times | int     |        | how many time for the min cost period
mincost_period       | int     | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | min cost period
excluded_places      | []Store |        | Places that excluded from the min cost
mincost_value        | int     |        | min cost value
reward_name          | string  |        | reward name (現金, Line Points, 街口幣, Open Points, P幣, Hami Point, 代幣...)
reward_value         | float   |        | reward value
coin_image           | string  |        | coin image URL

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get pending offers

> Get pending offers:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/offers/pending?page=1&creator=5f9a747p00c2abf3d4a54d4q \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/offers/pending?page=1&creator=5f9a747p00c2abf3d4a54d4q'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/offers/pending?page=1&creator=5f9a747p00c2abf3d4a54d4q', {
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
      "offer_id": "5f9a747p00c2abf3d4a54d4q",
      "option_array": [
        {
          "option": "OPT-1",
          "bindings": []
        }
      ],
      "offer_bank": {
        "bank": {
          "bank_info": "...",
        },
        "options": [
          {
            "issuer": "VISA",
            "level": 5
          }
        ]
      },
      "excluded_cards": [
        {
          "card_info": "..."
        }
      ],
      "cards": [
        {
          "card_info": "..."
        }
      ],
      "mobilepay_array": [
        {
          "mobilepay": {
            "mobilepay_info": "...",
          },
          "payment_type": 0
        }
      ],
      "mobilepay_option": 0,
      "eticket_payment": [
        {
          "eticket_info": "..."
        }
      ],
      "stores": [
        {
          "store": {
            "{store_info}": "..."
          },
          "channel": 0
        }
      ],
      "mpt_included_stores": [
        {
          "store": {
            "{store_info}": "..."
          },
          "channel": 1
        }
      ],
      "excluded_stores": [
        {
          "store": {
            "{store_info}": "..."
          },
          "channel": 2
        }
      ],
      "url": "https://url.com",
      "start_date": 1617601542000,
      "end_date": 1617601542000,
      "general_tags": [
        {
          "tag_info": "..."
        }
      ],
      "mobilepay_tags": [
        {
          "tag_info": "..."
        }
      ],
      "excluded_tags": [
        {
          "tag_info": "..."
        }
      ],
      "is_independent_reward": false,
      "reward_type": 1,
      "pre_conditions": [
        "pre1"
      ],
      "post_conditions": [
        "post1"
      ],
      "mobile_pay_binding": [
        {
          "mobilepay_info": "...",
        }
      ],
      "weekday": [
        1,
        7
      ],
      "month_days": [
        1,
        2
      ],
      "time": "10:00-12:00",
      "pay_methods": [
        {
          "mobilepay": {
            "mobilepay_info": "..."
          },
          "payment_type": 0
        }
      ],
      "register_url": "https://www.www.www",
      "coupon_code": "coupon",
      "discount_url": "https://www.www.www",
      "account_binding_type": 0,
      "account_name": "account",
      "electronic_bill_type": 1,
      "installment_required": false,
      "installment_acceptable": false,
      "installment_reward_type": "統一回饋",
      "note": "",
      "upper_bounds": [
        {
          "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
          "cash_upper_bound": 200,
          "frequency_upper_bound": 3,
          "upper_bound_period": 5,
          "store_independent": false,
          "sharing_upper_bounds": [
            "5f9a747p00c2abf3d4a54d4q"
          ]
        }
      ],
      "reward_content_type": 2,
      "mincost_type": 17,
      "reward_contents": [
        {
          "mincost_period_times": 1,
          "mincost_period": 5,
          "excluded_places": [],
          "mincost_value": 6000,
          "reward_name": "Line Points",
          "reward_value": 3.5,
          "coin_image": "https://image.png"
        }
      ]
    }
  ],
  "timestamp": 1617601542000
}
```

Get pending offers

### HTTP Request

`GET https://api.cardbo.info/api/v6/offers/pending`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Queries

Query   | Required | Muti-values | Description
------- | -------- | ----------- | -----------
page    | true     | false       | Page of the data
creator | false    | false       | Filter the creator

<aside class="notice">
There are 20 data each page.
</aside>

### Response

#### Success

*Offer*

Parameter               | Type              | Enums | Description
----------------------- | ----------------- | ----- | -----------
options                 | []string          |       | 方案 (事前問卷)
options_binding         | []string          |       | 不同方案組合 (`offer_id`)
offer_bank              | []OfferBank       |       | All bank of card can get the offer
excluded_cards          | []OfferCard       |       | Cards excluded from bank offer
cards                   | []OfferCard       |       | Array of OfferCard
mobilepay_array         | []OfferMobilePay  |       | mobile pays can get the offer
mobilepay_option        | int               | `1`: 不限制 </br> `2`: 限定帳戶綁定 </br> `3`: 限定綁定信用卡 | Option of the mobile pays to get the offer
eticket_payments        | []ETicket         |       | E-ticket of the card to use to get the offer
places                  | []Store           |       | Places to get the offer
mpt_included_places     | []Store           |       | Stores that can included for mobile pay tags
excluded_places         | []Store           |       | Stores that are excluded from the tags
url                     | string            |       | Offer URL
start_date              | int               |       | Offer start date in timeStamp
end_date                | int               |       | Offer end date in timeStamp
general_tags            | []Tag             |       | Tags which the type is general
mobilepay_tags          | []MobilePayTag    |       | Tags which the type is mobilepay
excluded_tags           | []Tag             |       | Tags excluded from the places
is_independent_reward   | bool              |       | Is the offer is independent or not
reward_type             | int               | `1`: 現金回饋-趴數 </br> `2`: 現金回饋-固定值 | Reward type
pre_conditions          | []string          |       | 事前問卷
post_conditions         | []string          |       | 事後問卷
mobile_pay_binding      | []MobilePay       |       | Mobile pays which need to bind to get the offer
weekday                 | []int             | [`1`-`7`] | The day in a week that can get the offer
month_days              | []int             | [`1`-`31`] | The day in a month that can get the offer
time                    | string            |       | The time in a day that can get the offer
pay_methods             | []OfferMobilePay  |       | Mobile pays to use to get the offer
register_url            | string            |       | 登錄網址
coupon_code             | string            |       | 優惠代碼
discount_url            | string            |       | 專屬連結
account_binding_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to bind account
account_name            | string            |       | Account name to bind
electronic_bill_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to apply electronic biil
installment_required    | bool              |       | Need to intall
installment_acceptable  | bool              |       | Can installment get the offer
installment_reward_type | string            | [`依分期回饋`, `統一回饋`] | The type of the installemnt offer
note                    | string            |       | Note
upper_bounds            | []OfferUpperBound |       | Upper bounds
reward_content_type     | int               | `1`: 優惠獨立計算 </br> `2`: 優惠累積計算 </br> `3`: 優惠分段累積計算 | Reward content type
mincost_type            | int               | `1`: 沒有最低消費限制 </br> `2`: 當下消費單筆滿 </br> `3`: 當下消費每滿 </br> `4`: 單一通路總共滿 </br> `5`: 單一通路個別滿 </br> `6`: 單一通路每滿 </br> `7`: 全通路總共滿 </br> `8`: 全通路個別滿 </br> `9`: 全通路每滿 </br> `10`: 一般消費總共滿 </br> `11`: 一般消費個別滿 </br> `12`: 一般消費每滿 </br> `13`: 國內一般消費總共滿 </br> `14`: 國內一般消費個別滿 </br> `15`: 國內一般消費每滿 </br> `16`: 總消費總共滿 </br> `17`: 總消費個別滿 </br> `18`: 總消費每滿 | Minimum cost type
reward_contents         | []RewardContent   |       | Reward contents

*OfferBank*

Parameter | Type         | Description
--------- | ------------ | -----------
bank      | Bank         | Bank info
options   | []CardOption | The options of the card in the bank which can get the offer

*CardOption*

Parameter  | Type   | Enums | Description
---------- | ------ | ----- | -----------
issuer     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | int    | [`1`-`8`] | level of the card
level_name | string |       | level name of the card

*OfferCard*

Parameter  | Type   | Enums | Description
---------- | ------ | ----- | -----------
card_id    | string |       | card id
name       | string |       | card name
issuer     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | int    | [`1`-`8`] | level of the card
level_name | string |       | level name of the card

*OfferMobilePay*

Parameter    | Type      | Enums | Description
------------ | --------- | ----- | -----------
mobilepay    | MobilePay |       | Mobile pay which can get the offer
payment_type | string    | `1`: 感應支付(NFC) </br> `2`: 掃碼支付 </br> `3`:條碼支付 | Payment tyoe to use to get the offer

*MobilePayTag*

Parameter    | Required | Type | Enums | Description
------------ | -------- | ---- | ----- | -----------
tag          | true     | Tag  |       | Tag info
scope        | true     | int  | `1`: 所有消費 </br> `2`: 一般消費 </br> `3`: 國內一般消費 | The scope of the expense
payment_type | false    | int  | `1`: 感應(NFC) </br> `2`: 掃碼 </br> `3`: 條碼 | Payment type

*OfferUpperBound*

Key                   | Type     | Enums | Description
--------------------- | -------- | ----- | -----------
upperbound_id         | string   |       | upperbound ID
cash_upper_bound      | int      |       | cashback upperbound value
frequency_upper_bound | int      |       | how many times can the offer got
upper_bound_period    | int      | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | upper bound period
store_independent     | bool     |       | is the upper bound calculate independent from each store
sharing_upper_bounds  | []string |       | array of upperbound ID share same upper bound

*RewardContent*

Key                  | Type    | Enums  | Description
-------------------- | ------- | ------ | -----------
mincost_period_times | int     |        | how many time for the min cost period
mincost_period       | int     | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | min cost period
excluded_places      | []Store |        | Places that excluded from the min cost
mincost_value        | int     |        | min cost value
reward_name          | string  |        | reward name (現金, Line Points, 街口幣, Open Points, P幣, Hami Point, 代幣...)
reward_value         | float   |        | reward value
coin_image           | string  |        | coin image URL

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get pending offer by ID

> Get pending offer by ID:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/offer/pending/5f9a747p00c2abf3d4a54d4q \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/offer/pending/5f9a747p00c2abf3d4a54d4q'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/offer/pending/5f9a747p00c2abf3d4a54d4q', {
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
    "offer_id": "5f9a747p00c2abf3d4a54d4q",
    "option_array": [
      {
        "option": "OPT-1",
        "bindings": []
      }
    ],
    "offer_bank": {
      "bank": {
        "bank_info": "...",
      },
      "options": [
        {
          "issuer": "VISA",
          "level": 5
        }
      ]
    },
    "excluded_cards": [
      {
        "card_info": "..."
      }
    ],
    "cards": [
      {
        "card_info": "..."
      }
    ],
    "mobilepay_array": [
      {
        "mobilepay": {
          "mobilepay_info": "...",
        },
        "payment_type": 0
      }
    ],
    "mobilepay_option": 0,
    "eticket_payment": [
      {
        "eticket_info": "..."
      }
    ],
    "stores": [
      {
        "store": {
          "{store_info}": "..."
        },
        "channel": 0
      }
    ],
    "mpt_included_stores": [
      {
        "store": {
          "{store_info}": "..."
        },
        "channel": 1
      }
    ],
    "excluded_stores": [
      {
        "store": {
          "{store_info}": "..."
        },
        "channel": 2
      }
    ],
    "url": "https://url.com",
    "start_date": 1617601542000,
    "end_date": 1617601542000,
    "general_tags": [
      {
        "tag_info": "..."
      }
    ],
    "mobilepay_tags": [
      {
        "tag_info": "..."
      }
    ],
    "excluded_tags": [
      {
        "tag_info": "..."
      }
    ],
    "is_independent_reward": false,
    "reward_type": 1,
    "pre_conditions": [
      "pre1"
    ],
    "post_conditions": [
      "post1"
    ],
    "mobile_pay_binding": [
      {
        "mobilepay_info": "...",
      }
    ],
    "weekday": [
      1,
      7
    ],
    "month_days": [
      1,
      2
    ],
    "time": "10:00-12:00",
    "pay_methods": [
      {
        "mobilepay": {
          "mobilepay_info": "..."
        },
        "payment_type": 0
      }
    ],
    "register_url": "https://www.www.www",
    "coupon_code": "coupon",
    "discount_url": "https://www.www.www",
    "account_binding_type": 0,
    "account_name": "account",
    "electronic_bill_type": 1,
    "installment_required": false,
    "installment_acceptable": false,
    "installment_reward_type": "統一回饋",
    "note": "",
    "upper_bounds": [
      {
        "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
        "cash_upper_bound": 200,
        "frequency_upper_bound": 3,
        "upper_bound_period": 5,
        "store_independent": false,
        "sharing_upper_bounds": [
          "5f9a747p00c2abf3d4a54d4q"
        ]
      }
    ],
    "reward_content_type": 2,
    "mincost_type": 17,
    "reward_contents": [
      {
        "mincost_period_times": 1,
        "mincost_period": 5,
        "excluded_places": [],
        "mincost_value": 6000,
        "reward_name": "Line Points",
        "reward_value": 3.5,
        "coin_image": "https://image.png"
      }
    ]
  },
  "timestamp": 1617601542000
}
```

Get pending offers

### HTTP Request

`GET https://api.cardbo.info/api/v6/offer/pending/{offer_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
offer_id  | Offer ID

### Response

#### Success

*Offer*

Parameter               | Type              | Enums | Description
----------------------- | ----------------- | ----- | -----------
options                 | []string          |       | 方案 (事前問卷)
options_binding         | []string          |       | 不同方案組合 (`offer_id`)
offer_bank              | []OfferBank       |       | All bank of card can get the offer
excluded_cards          | []OfferCard       |       | Cards excluded from bank offer
cards                   | []OfferCard       |       | Array of OfferCard
mobilepay_array         | []OfferMobilePay  |       | mobile pays can get the offer
mobilepay_option        | int               | `1`: 不限制 </br> `2`: 限定帳戶綁定 </br> `3`: 限定綁定信用卡 | Option of the mobile pays to get the offer
eticket_payments        | []ETicket         |       | E-ticket of the card to use to get the offer
places                  | []Store           |       | Places to get the offer
mpt_included_places     | []Store           |       | Stores that can included for mobile pay tags
excluded_places         | []Store           |       | Stores that are excluded from the tags
url                     | string            |       | Offer URL
start_date              | int               |       | Offer start date in timeStamp
end_date                | int               |       | Offer end date in timeStamp
general_tags            | []Tag             |       | Tags which the type is general
mobilepay_tags          | []MobilePayTag    |       | Tags which the type is mobilepay
excluded_tags           | []Tag             |       | Tags excluded from the places
is_independent_reward   | bool              |       | Is the offer is independent or not
reward_type             | int               | `1`: 現金回饋-趴數 </br> `2`: 現金回饋-固定值 | Reward type
pre_conditions          | []string          |       | 事前問卷
post_conditions         | []string          |       | 事後問卷
mobile_pay_binding      | []MobilePay       |       | Mobile pays which need to bind to get the offer
weekday                 | []int             | [`1`-`7`] | The day in a week that can get the offer
month_days              | []int             | [`1`-`31`] | The day in a month that can get the offer
time                    | string            |       | The time in a day that can get the offer
pay_methods             | []OfferMobilePay  |       | Mobile pays to use to get the offer
register_url            | string            |       | 登錄網址
coupon_code             | string            |       | 優惠代碼
discount_url            | string            |       | 專屬連結
account_binding_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to bind account
account_name            | string            |       | Account name to bind
electronic_bill_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to apply electronic biil
installment_required    | bool              |       | Need to intall
installment_acceptable  | bool              |       | Can installment get the offer
installment_reward_type | string            | [`依分期回饋`, `統一回饋`] | The type of the installemnt offer
note                    | string            |       | Note
upper_bounds            | []OfferUpperBound |       | Upper bounds
reward_content_type     | int               | `1`: 優惠獨立計算 </br> `2`: 優惠累積計算 </br> `3`: 優惠分段累積計算 | Reward content type
mincost_type            | int               | `1`: 沒有最低消費限制 </br> `2`: 當下消費單筆滿 </br> `3`: 當下消費每滿 </br> `4`: 單一通路總共滿 </br> `5`: 單一通路個別滿 </br> `6`: 單一通路每滿 </br> `7`: 全通路總共滿 </br> `8`: 全通路個別滿 </br> `9`: 全通路每滿 </br> `10`: 一般消費總共滿 </br> `11`: 一般消費個別滿 </br> `12`: 一般消費每滿 </br> `13`: 國內一般消費總共滿 </br> `14`: 國內一般消費個別滿 </br> `15`: 國內一般消費每滿 </br> `16`: 總消費總共滿 </br> `17`: 總消費個別滿 </br> `18`: 總消費每滿 | Minimum cost type
reward_contents         | []RewardContent   |       | Reward contents

*OfferBank*

Parameter | Type         | Description
--------- | ------------ | -----------
bank      | Bank         | Bank info
options   | []CardOption | The options of the card in the bank which can get the offer

*CardOption*

Parameter  | Type   | Enums | Description
---------- | ------ | ----- | -----------
issuer     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | int    | [`1`-`8`] | level of the card
level_name | string |       | level name of the card

*OfferCard*

Parameter  | Type   | Enums | Description
---------- | ------ | ----- | -----------
card_id    | string |       | card id
name       | string |       | card name
issuer     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | int    | [`1`-`8`] | level of the card
level_name | string |       | level name of the card

*OfferMobilePay*

Parameter    | Type      | Enums | Description
------------ | --------- | ----- | -----------
mobilepay    | MobilePay |       | Mobile pay which can get the offer
payment_type | string    | `1`: 感應支付(NFC) </br> `2`: 掃碼支付 </br> `3`:條碼支付 | Payment tyoe to use to get the offer

*MobilePayTag*

Parameter    | Required | Type | Enums | Description
------------ | -------- | ---- | ----- | -----------
tag          | true     | Tag  |       | Tag info
scope        | true     | int  | `1`: 所有消費 </br> `2`: 一般消費 </br> `3`: 國內一般消費 | The scope of the expense
payment_type | false    | int  | `1`: 感應(NFC) </br> `2`: 掃碼 </br> `3`: 條碼 | Payment type

*OfferUpperBound*

Key                   | Type     | Enums | Description
--------------------- | -------- | ----- | -----------
upperbound_id         | string   |       | upperbound ID
cash_upper_bound      | int      |       | cashback upperbound value
frequency_upper_bound | int      |       | how many times can the offer got
upper_bound_period    | int      | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | upper bound period
store_independent     | bool     |       | is the upper bound calculate independent from each store
sharing_upper_bounds  | []string |       | array of upperbound ID share same upper bound

*RewardContent*

Key                  | Type    | Enums  | Description
-------------------- | ------- | ------ | -----------
mincost_period_times | int     |        | how many time for the min cost period
mincost_period       | int     | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | min cost period
excluded_places      | []Store |        | Places that excluded from the min cost
mincost_value        | int     |        | min cost value
reward_name          | string  |        | reward name (現金, Line Points, 街口幣, Open Points, P幣, Hami Point, 代幣...)
reward_value         | float   |        | reward value
coin_image           | string  |        | coin image URL

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Update pending offer

> Update pending offer:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/offer/pending/5f9a747p00c2abf3d4a54d4q \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "option_array": [
      {
        "option": "OPT-1"
      }
    ],
    "offer_bank": {
      "bank": {
        "bank_id": "5f9a747p00c2abf3d4a54d4q"
      },
      "options": [
        {
          "issuer": "VISA",
          "level": 5
        }
      ]
    },
    "excluded_cards": [
      {
        "card_id": "5f9a747p00c2abf3d4a54d4q"
      }
    ],
    "cards": [
      {
        "card_id": "5f9a747p00c2abf3d4a54d4q"
      }
    ],
    "mobilepay_array": [
      {
        "mobilepay": {
          "mobilepay_id": "5f9a747p00c2abf3d4a54d4q"
        },
        "payment_type": 0
      }
    ],
    "mobilepay_option": 0,
    "eticket_payment": [
      {
        "eticket_id": "5f9a747p00c2abf3d4a54d4q"
      }
    ],
    "stores": [
      {
        "store": {
          "store_id": "5f9a747p00c2abf3d4a54d4q"
        },
        "channel": 0
      }
    ],
    "mpt_included_stores": [
      {
        "store": {
          "store_id": "5f9a747p00c2abf3d4a54d4q"
        },
        "channel": 1
      }
    ],
    "excluded_stores": [
      {
        "store": {
          "store_id": "5f9a747p00c2abf3d4a54d4q"
        },
        "channel": 2
      }
    ],
    "url": "https://url.com",
    "start_date": 1617601542000,
    "end_date": 1617601542000,
    "general_tags": [
      {
        "tag_id": "5f9a747p00c2abf3d4a54d4q",
      }
    ],
    "mobilepay_tags": [
      {
        "tag": {
          "tag_id": "5f9a747p00c2abf3d4a54d4q",
        },
        "scope": 1,
        "payment_type": 0
      }
    ],
    "excluded_tags": [
      {
        "tag_id": "5f9a747p00c2abf3d4a54d4q",
      }
    ],
    "is_independent_reward": false,
    "reward_type": 1,
    "pre_conditions": [
      "pre1"
    ],
    "post_conditions": [
      "post1"
    ],
    "mobile_pay_binding": [
      {
        "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
      }
    ],
    "weekday": [
      1,
      7
    ],
    "month_days": [
      1,
      2
    ],
    "time": "10:00-12:00",
    "pay_methods": [
      {
        "mobilepay": {
          "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
        },
        "payment_type": 0
      }
    ],
    "register_url": "https://www.www.www",
    "coupon_code": "coupon",
    "discount_url": "https://www.www.www",
    "account_binding_type": 1,
    "account_name": "account",
    "electronic_bill_type": 1,
    "installment_required": false,
    "installment_acceptable": false,
    "installment_reward_type": "依分期回饋",
    "note": "",
    "upper_bounds": [
      {
        "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
        "cash_upper_bound": 200,
        "frequency_upper_bound": 3,
        "upper_bound_period": 5,
        "store_independent": false,
        "sharing_upper_bounds": [
          "5f9a747p00c2abf3d4a54d4q"
        ]
      }
    ],
    "reward_content_type": 2,
    "mincost_type": 17,
    "reward_contents": [
      {
        "mincost_period_times": 1,
        "mincost_period": 5,
        "excluded_places": [],
        "mincost_value": 6000,
        "reward_name": "Line Points",
        "reward_value": 3.5,
        "coin_image": "https://image.png"
      }
    ]
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/offer/pending/5f9a747p00c2abf3d4a54d4q'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "option_array": [
    {
      "option": "OPT-1"
    }
  ],
  "offer_bank": {
    "bank": {
      "bank_id": "5f9a747p00c2abf3d4a54d4q"
    },
    "options": [
      {
        "issuer": "VISA",
        "level": 5
      }
    ]
  },
  "excluded_cards": [
    {
      "card_id": "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  "cards": [
    {
      "card_id": "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  "mobilepay_array": [
    {
      "mobilepay": {
        "mobilepay_id": "5f9a747p00c2abf3d4a54d4q"
      },
      "payment_type": 0
    }
  ],
  "mobilepay_option": 0,
  "eticket_payment": [
    {
      "eticket_id": "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  "stores": [
    {
      "store": {
        "store_id": "5f9a747p00c2abf3d4a54d4q"
      },
      "channel": 0
    }
  ],
  "mpt_included_stores": [
    {
      "store": {
        "store_id": "5f9a747p00c2abf3d4a54d4q"
      },
      "channel": 1
    }
  ],
  "excluded_stores": [
    {
      "store": {
        "store_id": "5f9a747p00c2abf3d4a54d4q"
      },
      "channel": 2
    }
  ],
  "url": "https://url.com",
  "start_date": 1617601542000,
  "end_date": 1617601542000,
  "general_tags": [
    {
      "tag_id": "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  "mobilepay_tags": [
    {
      "tag": {
        "tag_id": "5f9a747p00c2abf3d4a54d4q",
      },
      "scope": 1,
      "payment_type": 0
    }
  ],
  "excluded_tags": [
    {
      "tag_id": "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  "is_independent_reward": false,
  "reward_type": 1,
  "pre_conditions": [
    "pre1"
  ],
  "post_conditions": [
    "post1"
  ],
  "mobile_pay_binding": [
    {
      "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  "weekday": [
    1,
    7
  ],
  "month_days": [
    1,
    2
  ],
  "time": "10:00-12:00",
  "pay_methods": [
    {
      "mobilepay": {
        "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
      },
      "payment_type": 0
    }
  ],
  "register_url": "https://www.www.www",
  "coupon_code": "coupon",
  "discount_url": "https://www.www.www",
  "account_binding_type": 1,
  "account_name": "account",
  "electronic_bill_type": 1,
  "installment_required": false,
  "installment_acceptable": false,
  "installment_reward_type": "依分期回饋",
  "note": "",
  "upper_bounds": [
    {
      "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
      "cash_upper_bound": 200,
      "frequency_upper_bound": 3,
      "upper_bound_period": 5,
      "store_independent": false,
      "sharing_upper_bounds": [
        "5f9a747p00c2abf3d4a54d4q"
      ]
    }
  ],
  "reward_content_type": 2,
  "mincost_type": 17,
  "reward_contents": [
    {
      "mincost_period_times": 1,
      "mincost_period": 5,
      "excluded_places": [],
      "mincost_value": 6000,
      "reward_name": "Line Points",
      "reward_value": 3.5,
      "coin_image": "https://image.png"
    }
  ]
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  option_array: [
    {
      option: "OPT-1"
    }
  ],
  offer_bank: {
    bank: {
      "bank_id": "5f9a747p00c2abf3d4a54d4q"
    },
    options: [
      {
        issuer: VISA,
        level: 5
      }
    ]
  },
  excluded_cards: [
    {
      card_id: "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  cards: [
    {
      card_id: "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  mobilepay_array: [
    {
      mobilepay: {
        mobilepay_id: "5f9a747p00c2abf3d4a54d4q"
      },
      payment_type: 0
    }
  ],
  mobilepay_option: 0,
  eticket_payment: [
    {
      eticket_id: "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  stores: [
    {
      store: {
        store_id: "5f9a747p00c2abf3d4a54d4q"
      },
      channel: 0
    }
  ],
  mpt_included_stores: [
    {
      store: {
        store_id: "5f9a747p00c2abf3d4a54d4q"
      },
      channel: 1
    }
  ],
  excluded_stores: [
    {
      store: {
        store_id: "5f9a747p00c2abf3d4a54d4q"
      },
      channel: 2
    }
  ],
  url: "https://url.com",
  start_date: 1617601542000,
  end_date: 1617601542000,
  general_tags: [
    {
      tag_id: "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  mobilepay_tags: [
    {
      tag: {
        tag_id: "5f9a747p00c2abf3d4a54d4q",
      },
      scope: 1,
      payment_type: 0
    }
  ],
  excluded_tags: [
    {
      tag_id: "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  is_independent_reward: false,
  reward_type: 1,
  pre_conditions: [
    "pre1"
  ],
  post_conditions: [
    "post1"
  ],
  mobile_pay_binding: [
    {
      mobilepay_id: "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  weekday: [
    1,
    7
  ],
  month_days: [
    1,
    2
  ],
  time: "10:00-12:00",
  pay_methods: [
    {
      mobilepay: {
        mobilepay_id: "5f9a747p00c2abf3d4a54d4q",
      },
      payment_type: 0
    }
  ],
  register_url: "https://www.www.www",
  coupon_code: "coupon",
  discount_url: "https://www.www.www",
  account_binding_type: 1,
  account_name: "account",
  electronic_bill_type: 1,
  installment_required: false,
  installment_acceptable: false,
  installment_reward_type: "依分期回饋",
  note: "",
  upper_bounds: [
    {
      upperbound_id: "5f9a747p00c2abf3d4a54d4q",
      cash_upper_bound: 200,
      frequency_upper_bound: 3,
      upper_bound_period: 5,
      store_independent: false,
      sharing_upper_bounds: [
        "5f9a747p00c2abf3d4a54d4q"
      ]
    }
  ],
  reward_content_type: 2,
  mincost_type: 17,
  reward_contents: [
    {
      mincost_period_times: 1,
      mincost_period: 5,
      excluded_places: [],
      mincost_value: 6000,
      reward_name: "Line Points",
      reward_value: 3.5,
      coin_image: "https://image.png"
    }
  ]
}
axios.put('https://api.cardbo.info/api/v6/offer/pending', data, {
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
    "offer_id": "5f9a747p00c2abf3d4a54d4q",
    "option_array": [
      {
        "option": "OPT-1",
        "bindings": []
      }
    ],
    "offer_bank": {
      "bank": {
        "bank_info": "...",
      },
      "options": [
        {
          "issuer": "VISA",
          "level": 5
        }
      ]
    },
    "excluded_cards": [
      {
        "card_info": "..."
      }
    ],
    "cards": [
      {
        "card_info": "..."
      }
    ],
    "mobilepay_array": [
      {
        "mobilepay": {
          "mobilepay_info": "...",
        },
        "payment_type": 0
      }
    ],
    "mobilepay_option": 0,
    "eticket_payment": [
      {
        "eticket_info": "..."
      }
    ],
    "stores": [
      {
        "store": {
          "{store_info}": "..."
        },
        "channel": 0
      }
    ],
    "mpt_included_stores": [
      {
        "store": {
          "{store_info}": "..."
        },
        "channel": 1
      }
    ],
    "excluded_stores": [
      {
        "store": {
          "{store_info}": "..."
        },
        "channel": 2
      }
    ],
    "url": "https://url.com",
    "start_date": 1617601542000,
    "end_date": 1617601542000,
    "general_tags": [
      {
        "tag_info": "..."
      }
    ],
    "mobilepay_tags": [
      {
        "tag_info": "..."
      }
    ],
    "excluded_tags": [
      {
        "tag_info": "..."
      }
    ],
    "is_independent_reward": false,
    "reward_type": 1,
    "pre_conditions": [
      "pre1"
    ],
    "post_conditions": [
      "post1"
    ],
    "mobile_pay_binding": [
      {
        "mobilepay_info": "...",
      }
    ],
    "weekday": [
      1,
      7
    ],
    "month_days": [
      1,
      2
    ],
    "time": "10:00-12:00",
    "pay_methods": [
      {
        "mobilepay": {
          "mobilepay_info": "..."
        },
        "payment_type": 0
      }
    ],
    "register_url": "https://www.www.www",
    "coupon_code": "coupon",
    "discount_url": "https://www.www.www",
    "account_binding_type": 0,
    "account_name": "account",
    "electronic_bill_type": 1,
    "installment_required": false,
    "installment_acceptable": false,
    "installment_reward_type": "統一回饋",
    "note": "",
    "upper_bounds": [
      {
        "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
        "cash_upper_bound": 200,
        "frequency_upper_bound": 3,
        "upper_bound_period": 5,
        "store_independent": false,
        "sharing_upper_bounds": [
          "5f9a747p00c2abf3d4a54d4q"
        ]
      }
    ],
    "reward_content_type": 2,
    "mincost_type": 17,
    "reward_contents": [
      {
        "mincost_period_times": 1,
        "mincost_period": 5,
        "excluded_places": [],
        "mincost_value": 6000,
        "reward_name": "Line Points",
        "reward_value": 3.5,
        "coin_image": "https://image.png"
      }
    ]
  },
  "timestamp": 1617601542000
}
```

Update pending offer

### HTTP Request

`PUT https://api.cardbo.info/api/v6/offer/pending/{offer_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter               | Required | Type              | Enums | Description
----------------------- | -------- | ----------------- | ----- | -----------
option_array            | false    | []OfferOption     |       | Offer options for user questionnaire
offer_bank              | false    | []OfferBank       |       | All bank of card can get the offer
excluded_cards          | false    | []OfferCard       |       | Cards excluded from bank offer
cards                   | false    | []OfferCard       |       | Array of OfferCard
mobilepay_array         | false    | []OfferMobilePay  |       | mobile pays can get the offer
mobilepay_option        | false    | int               | `1`: 不限制 </br> `2`: 限定帳戶綁定 </br> `3`: 限定綁定信用卡 | Option of the mobile pays to get the offer
eticket_payments        | false    | []ETicket         |       | E-ticket of the card to use to get the offer
stores                  | false    | []OfferStore      |       | Stores to get the offer
mpt_included_stores     | false    | []OfferStore      |       | Stores that can included for mobile pay
excluded_stores         | false    | []OfferStore      |       | Stores that are excluded from the tags
url                     | true     | string            |       | Offer URL
start_date              | true     | int               |       | Offer start date in timeStamp
end_date                | true     | int               |       | Offer end date in timeStamp
general_tags            | false    | []Tag             |       | Tags which the type is general
mobilepay_tags          | false    | []MobilePayTag    |       | Tags which the type is mobilepay
excluded_tags           | false    | []Tag             |       | Tags excluded from the places
is_independent_reward   | true     | bool              |       | Is the offer is independent or not
reward_type             | true     | int               | `1`: 現金回饋-趴數 </br> `2`: 現金回饋-固定值 | Reward type
pre_conditions          | false    | []string          |       | 事前問卷
post_conditions         | false    | []string          |       | 事後問卷
mobile_pay_binding      | false    | []MobilePay       |       | Mobile pays which need to bind to get the offer
weekday                 | false    | []int             | [`1`-`7`] | The day in a week that can get the offer
month_days              | false    | []int             | [`1`-`31`] | The day in a month that can get the offer
time                    | false    | string            |       | The time in a day that can get the offer
pay_methods             | false    | []OfferMobilePay  |       | Mobile pays to use to get the offer
register_url            | false    | string            |       | 登錄網址
coupon_code             | false    | string            |       | 優惠代碼
discount_url            | false    | string            |       | 專屬連結
account_binding_type    | true     | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to bind account
account_name            | false    | string            |       | Account name to bind
electronic_bill_type    | true     | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to apply electronic biil
installment_required    | true     | bool              |       | Need to intall
installment_acceptable  | true     | bool              |       | Can installment get the offer
installment_reward_type | false    | string            | [`依分期回饋`, `統一回饋`] | The type of the installemnt offer
note                    | false    | string            |       | Note
upper_bounds            | false    | []OfferUpperBound |       | Upper bounds
reward_content_type     | true     | int               | `1`: 優惠獨立計算 </br> `2`: 優惠累積計算 </br> `3`: 優惠分段累積計算 | Reward content type
mincost_type            | true     | int               | `1`: 沒有最低消費限制 </br> `2`: 當下消費單筆滿 </br> `3`: 當下消費每滿 </br> `4`: 單一通路總共滿 </br> `5`: 單一通路個別滿 </br> `6`: 單一通路每滿 </br> `7`: 全通路總共滿 </br> `8`: 全通路個別滿 </br> `9`: 全通路每滿 </br> `10`: 一般消費總共滿 </br> `11`: 一般消費個別滿 </br> `12`: 一般消費每滿 </br> `13`: 國內一般消費總共滿 </br> `14`: 國內一般消費個別滿 </br> `15`: 國內一般消費每滿 </br> `16`: 總消費總共滿 </br> `17`: 總消費個別滿 </br> `18`: 總消費每滿 | Minimum cost type
reward_contents         | true     | []RewardContent   |       | Reward contents

*OfferOption*

Parameter | Required | Type   | Description
--------- | -------- | ------ | -----------
option    | true     | string | 方案 (事前問卷)

*OfferBank*

Parameter | Required | Type         | Description
--------- | -------- | ------------ | -----------
bank      | true     | Bank         | Bank info
options   | false    | []CardOption | The options of the card in the bank which can get the offer

*CardOption*

Parameter  | Required | Type   | Enums | Description
---------- | -------- | ------ | ----- | -----------
issuer     | true     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | true     | int    | [`1`-`8`] | level of the card

*OfferCard*

Parameter  | Required | Type   | Enums | Description
---------- | -------- | ------ | ----- | -----------
card_id    | true     | string |       | card id
issuer     | true     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | true     | int    | [`1`-`8`] | level of the card

*OfferMobilePay*

Parameter    | Required | Type      | Enums | Description
------------ | -------- | --------- | ----- | -----------
mobilepay    | true     | MobilePay |       | Mobile pay which can get the offer
payment_type | true     | string    | `1`: 感應支付(NFC) </br> `2`: 掃碼支付 </br> `3`:條碼支付 | Payment tyoe to use to get the offer

*OfferStore*

Parameter | Required | Type  | Enums | Description
--------- | -------- | ----- | ----- | -----------
store     | true     | Store |       | Store object
channel   | true     | int   | `0`: No restriction </br> `1`: Physical store </br> `2`: Web </br> `3`: App | The channel of the store

*MobilePayTag*

Parameter    | Required | Type | Enums | Description
------------ | -------- | ---- | ----- | -----------
tag          | true     | Tag  |       | Tag info
scope        | true     | int  | `1`: 所有消費 </br> `2`: 一般消費 </br> `3`: 國內一般消費 | The scope of the expense
payment_type | false    | int  | `1`: 感應(NFC) </br> `2`: 掃碼 </br> `3`: 條碼 | Payment type

*OfferUpperBound*

Key                   | Required | Type     | Enums | Description
--------------------- | -------- | -------- | ----- | -----------
cash_upper_bound      | false    | int      |       | cashback upperbound value
frequency_upper_bound | false    | int      |       | how many times can the offer got
upper_bound_period    | true     | int      | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | upper bound period
store_independent     | true     | bool     |       | is the upper bound calculate independent from each store
sharing_upper_bounds  | false    | []string |       | array of upperbound ID share same upper bound (`upper_bound_id`)

*RewardContent*

Key                  | Required | Type    | Enums  | Description
-------------------- | -------- | ------- | ------ | -----------
mincost_period_times | false    | int     |        | how many time for the min cost period
mincost_period       | false    | int     | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | min cost period
excluded_places      | false    | []Store |        | Places that excluded from the min cost
mincost_value        | false    | int     |        | min cost value
reward_name          | true     | string  |        | reward name (現金, Line Points, 街口幣, Open Points, P幣, Hami Point, 代幣...)
reward_value         | true     | float   |        | reward value

### Response

#### Success

*Offer*

Parameter               | Type              | Enums | Description
----------------------- | ----------------- | ----- | -----------
option_array            | []OfferOption     |       | Offer options for user questionnaire
offer_bank              | []OfferBank       |       | All bank of card can get the offer
excluded_cards          | []OfferCard       |       | Cards excluded from bank offer
cards                   | []OfferCard       |       | Array of OfferCard
mobilepay_array         | []OfferMobilePay  |       | mobile pays can get the offer
mobilepay_option        | int               | `1`: 不限制 </br> `2`: 限定帳戶綁定 </br> `3`: 限定綁定信用卡 | Option of the mobile pays to get the offer
eticket_payments        | []ETicket         |       | E-ticket of the card to use to get the offer
stores                  | []OfferStore      |       | Stores to get the offer
mpt_included_stores     | []OfferStore      |       | Stores that can included for mobile pay
excluded_stores         | []OfferStore      |       | Stores that are excluded from the tags
url                     | string            |       | Offer URL
start_date              | int               |       | Offer start date in timeStamp
end_date                | int               |       | Offer end date in timeStamp
general_tags            | []Tag             |       | Tags which the type is general
mobilepay_tags          | []MobilePayTag    |       | Tags which the type is mobilepay
excluded_tags           | []Tag             |       | Tags excluded from the places
is_independent_reward   | bool              |       | Is the offer is independent or not
reward_type             | int               | `1`: 現金回饋-趴數 </br> `2`: 現金回饋-固定值 | Reward type
pre_conditions          | []string          |       | 事前問卷
post_conditions         | []string          |       | 事後問卷
mobile_pay_binding      | []MobilePay       |       | Mobile pays which need to bind to get the offer
weekday                 | []int             | [`1`-`7`] | The day in a week that can get the offer
month_days              | []int             | [`1`-`31`] | The day in a month that can get the offer
time                    | string            |       | The time in a day that can get the offer
pay_methods             | []OfferMobilePay  |       | Mobile pays to use to get the offer
register_url            | string            |       | 登錄網址
coupon_code             | string            |       | 優惠代碼
discount_url            | string            |       | 專屬連結
account_binding_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to bind account
account_name            | string            |       | Account name to bind
electronic_bill_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to apply electronic biil
installment_required    | bool              |       | Need to intall
installment_acceptable  | bool              |       | Can installment get the offer
installment_reward_type | string            | [`依分期回饋`, `統一回饋`] | The type of the installemnt offer
note                    | string            |       | Note
upper_bounds            | []OfferUpperBound |       | Upper bounds
reward_content_type     | int               | `1`: 優惠獨立計算 </br> `2`: 優惠累積計算 </br> `3`: 優惠分段累積計算 | Reward content type
mincost_type            | int               | `1`: 沒有最低消費限制 </br> `2`: 當下消費單筆滿 </br> `3`: 當下消費每滿 </br> `4`: 單一通路總共滿 </br> `5`: 單一通路個別滿 </br> `6`: 單一通路每滿 </br> `7`: 全通路總共滿 </br> `8`: 全通路個別滿 </br> `9`: 全通路每滿 </br> `10`: 一般消費總共滿 </br> `11`: 一般消費個別滿 </br> `12`: 一般消費每滿 </br> `13`: 國內一般消費總共滿 </br> `14`: 國內一般消費個別滿 </br> `15`: 國內一般消費每滿 </br> `16`: 總消費總共滿 </br> `17`: 總消費個別滿 </br> `18`: 總消費每滿 | Minimum cost type
reward_contents         | []RewardContent   |       | Reward contents

*OfferOption*

Parameter | Required | Type   | Description
--------- | -------- | ------ | -----------
option    | true     | string | 方案 (事前問卷)

*OfferBank*

Parameter | Type         | Description
--------- | ------------ | -----------
bank      | Bank         | Bank info
options   | []CardOption | The options of the card in the bank which can get the offer

*CardOption*

Parameter  | Type   | Enums | Description
---------- | ------ | ----- | -----------
issuer     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | int    | [`1`-`8`] | level of the card
level_name | string |       | level name of the card

*OfferCard*

Parameter  | Type   | Enums | Description
---------- | ------ | ----- | -----------
card_id    | string |       | card id
name       | string |       | card name
issuer     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | int    | [`1`-`8`] | level of the card
level_name | string |       | level name of the card

*OfferMobilePay*

Parameter    | Type      | Enums | Description
------------ | --------- | ----- | -----------
mobilepay    | MobilePay |       | Mobile pay which can get the offer
payment_type | string    | `1`: 感應支付(NFC) </br> `2`: 掃碼支付 </br> `3`:條碼支付 | Payment tyoe to use to get the offer

*OfferStore*

Parameter | Required | Type  | Enums | Description
--------- | -------- | ----- | ----- | -----------
store     | true     | Store |       | Store object
channel   | true     | int   | `0`: No restriction </br> `1`: Physical store </br> `2`: Web </br> `3`: App | The channel of the store

*MobilePayTag*

Parameter    | Required | Type | Enums | Description
------------ | -------- | ---- | ----- | -----------
tag          | true     | Tag  |       | Tag info
scope        | true     | int  | `1`: 所有消費 </br> `2`: 一般消費 </br> `3`: 國內一般消費 | The scope of the expense
payment_type | false    | int  | `1`: 感應(NFC) </br> `2`: 掃碼 </br> `3`: 條碼 | Payment type

*OfferUpperBound*

Key                   | Type     | Enums | Description
--------------------- | -------- | ----- | -----------
upperbound_id         | string   |       | upperbound ID
cash_upper_bound      | int      |       | cashback upperbound value
frequency_upper_bound | int      |       | how many times can the offer got
upper_bound_period    | int      | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | upper bound period
store_independent     | bool     |       | is the upper bound calculate independent from each store
sharing_upper_bounds  | []string |       | array of upperbound ID share same upper bound

*RewardContent*

Key                  | Type    | Enums  | Description
-------------------- | ------- | ------ | -----------
mincost_period_times | int     |        | how many time for the min cost period
mincost_period       | int     | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | min cost period
excluded_places      | []Store |        | Places that excluded from the min cost
mincost_value        | int     |        | min cost value
reward_name          | string  |        | reward name (現金, Line Points, 街口幣, Open Points, P幣, Hami Point, 代幣...)
reward_value         | float   |        | reward value
coin_image           | string  |        | coin image URL

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Remove pending offer (TODO)

## • Pass pending offer to formal offer (TODO)

## • Fail pending offer (TODO)

## • Get pending offers (TODO)

## • Bind pending offers sharing upper bound

> Bind pending offers sharing upper bound:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/offer/pending/upperbound \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
  "upperbound_ids": [
    "5f9a747p00c2abf3d4a54d4q",
    "5f9a747p00c2abf3d4a54d4q"
  ]
}'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/offer/pending/upperbound'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "upperbound_ids": [
    "5f9a747p00c2abf3d4a54d4q",
    "5f9a747p00c2abf3d4a54d4q"
  ]
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  upperbound_ids: [
    "5f9a747p00c2abf3d4a54d4q",
    "5f9a747p00c2abf3d4a54d4q"
  ]
}
axios.put('https://api.cardbo.info/api/v6/offer/pending/upperbound', data, {
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
      "offer_id": "5f9a747p00c2abf3d4a54d4q",
      "option_array": [
        {
          "option": "OPT-1",
          "bindings": []
        }
      ],
      "offer_bank": {
        "bank": {
          "bank_info": "...",
        },
        "options": [
          {
            "issuer": "VISA",
            "level": 5
          }
        ]
      },
      "excluded_cards": [
        {
          "card_info": "..."
        }
      ],
      "cards": [
        {
          "card_info": "..."
        }
      ],
      "mobilepay_array": [
        {
          "mobilepay": {
            "mobilepay_info": "...",
          },
          "payment_type": 0
        }
      ],
      "mobilepay_option": 0,
      "eticket_payment": [
        {
          "eticket_info": "..."
        }
      ],
      "stores": [
        {
          "store": {
            "{store_info}": "..."
          },
          "channel": 0
        }
      ],
      "mpt_included_stores": [
        {
          "store": {
            "{store_info}": "..."
          },
          "channel": 1
        }
      ],
      "excluded_stores": [
        {
          "store": {
            "{store_info}": "..."
          },
          "channel": 2
        }
      ],
      "url": "https://url.com",
      "start_date": 1617601542000,
      "end_date": 1617601542000,
      "general_tags": [
        {
          "tag_info": "..."
        }
      ],
      "mobilepay_tags": [
        {
          "tag_info": "..."
        }
      ],
      "excluded_tags": [
        {
          "tag_info": "..."
        }
      ],
      "is_independent_reward": false,
      "reward_type": 1,
      "pre_conditions": [
        "pre1"
      ],
      "post_conditions": [
        "post1"
      ],
      "mobile_pay_binding": [
        {
          "mobilepay_info": "...",
        }
      ],
      "weekday": [
        1,
        7
      ],
      "month_days": [
        1,
        2
      ],
      "time": "10:00-12:00",
      "pay_methods": [
        {
          "mobilepay": {
            "mobilepay_info": "..."
          },
          "payment_type": 0
        }
      ],
      "register_url": "https://www.www.www",
      "coupon_code": "coupon",
      "discount_url": "https://www.www.www",
      "account_binding_type": 0,
      "account_name": "account",
      "electronic_bill_type": 1,
      "installment_required": false,
      "installment_acceptable": false,
      "installment_reward_type": "統一回饋",
      "note": "",
      "upper_bounds": [
        {
          "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
          "cash_upper_bound": 200,
          "frequency_upper_bound": 3,
          "upper_bound_period": 5,
          "store_independent": false,
          "sharing_upper_bounds": [
            "5f9a747p00c2abf3d4a54d4q"
          ]
        }
      ],
      "reward_content_type": 2,
      "mincost_type": 17,
      "reward_contents": [
        {
          "mincost_period_times": 1,
          "mincost_period": 5,
          "excluded_places": [],
          "mincost_value": 6000,
          "reward_name": "Line Points",
          "reward_value": 3.5,
          "coin_image": "https://image.png"
        }
      ]
    }
  ],
  "timestamp": 1617601542000
}
```

Bind pending offers sharing upper bound

### HTTP Request

`PUT https://api.cardbo.info/api/v6/offer/pending/upperbound`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter      | Required | Type     | Description
-------------- | -------- | -------- | -----------
upperbound_ids | true     | []string | Array of `upperbound_id` which need to bind together

### Response

#### Success

*Offer*

Parameter               | Type              | Enums | Description
----------------------- | ----------------- | ----- | -----------
option_array            | []OfferOption     |       | Offer options for user questionnaire
offer_bank              | []OfferBank       |       | All bank of card can get the offer
excluded_cards          | []OfferCard       |       | Cards excluded from bank offer
cards                   | []OfferCard       |       | Array of OfferCard
mobilepay_array         | []OfferMobilePay  |       | mobile pays can get the offer
mobilepay_option        | int               | `1`: 不限制 </br> `2`: 限定帳戶綁定 </br> `3`: 限定綁定信用卡 | Option of the mobile pays to get the offer
eticket_payments        | []ETicket         |       | E-ticket of the card to use to get the offer
stores                  | []OfferStore      |       | Stores to get the offer
mpt_included_stores     | []OfferStore      |       | Stores that can included for mobile pay
excluded_stores         | []OfferStore      |       | Stores that are excluded from the tags
url                     | string            |       | Offer URL
start_date              | int               |       | Offer start date in timeStamp
end_date                | int               |       | Offer end date in timeStamp
general_tags            | []Tag             |       | Tags which the type is general
mobilepay_tags          | []MobilePayTag    |       | Tags which the type is mobilepay
excluded_tags           | []Tag             |       | Tags excluded from the places
is_independent_reward   | bool              |       | Is the offer is independent or not
reward_type             | int               | `1`: 現金回饋-趴數 </br> `2`: 現金回饋-固定值 | Reward type
pre_conditions          | []string          |       | 事前問卷
post_conditions         | []string          |       | 事後問卷
mobile_pay_binding      | []MobilePay       |       | Mobile pays which need to bind to get the offer
weekday                 | []int             | [`1`-`7`] | The day in a week that can get the offer
month_days              | []int             | [`1`-`31`] | The day in a month that can get the offer
time                    | string            |       | The time in a day that can get the offer
pay_methods             | []OfferMobilePay  |       | Mobile pays to use to get the offer
register_url            | string            |       | 登錄網址
coupon_code             | string            |       | 優惠代碼
discount_url            | string            |       | 專屬連結
account_binding_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to bind account
account_name            | string            |       | Account name to bind
electronic_bill_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to apply electronic biil
installment_required    | bool              |       | Need to intall
installment_acceptable  | bool              |       | Can installment get the offer
installment_reward_type | string            | [`依分期回饋`, `統一回饋`] | The type of the installemnt offer
note                    | string            |       | Note
upper_bounds            | []OfferUpperBound |       | Upper bounds
reward_content_type     | int               | `1`: 優惠獨立計算 </br> `2`: 優惠累積計算 </br> `3`: 優惠分段累積計算 | Reward content type
mincost_type            | int               | `1`: 沒有最低消費限制 </br> `2`: 當下消費單筆滿 </br> `3`: 當下消費每滿 </br> `4`: 單一通路總共滿 </br> `5`: 單一通路個別滿 </br> `6`: 單一通路每滿 </br> `7`: 全通路總共滿 </br> `8`: 全通路個別滿 </br> `9`: 全通路每滿 </br> `10`: 一般消費總共滿 </br> `11`: 一般消費個別滿 </br> `12`: 一般消費每滿 </br> `13`: 國內一般消費總共滿 </br> `14`: 國內一般消費個別滿 </br> `15`: 國內一般消費每滿 </br> `16`: 總消費總共滿 </br> `17`: 總消費個別滿 </br> `18`: 總消費每滿 | Minimum cost type
reward_contents         | []RewardContent   |       | Reward contents

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Bind formal offers sharing upper bound

> Bind formal offers sharing upper bound:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/offer/formal/upperbound \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
  "upperbound_ids": [
    "5f9a747p00c2abf3d4a54d4q",
    "5f9a747p00c2abf3d4a54d4q"
  ]
}'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/offer/formal/upperbound'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "upperbound_ids": [
    "5f9a747p00c2abf3d4a54d4q",
    "5f9a747p00c2abf3d4a54d4q"
  ]
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  upperbound_ids: [
    "5f9a747p00c2abf3d4a54d4q",
    "5f9a747p00c2abf3d4a54d4q"
  ]
}
axios.put('https://api.cardbo.info/api/v6/offer/formal/upperbound', data, {
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
      "offer_id": "5f9a747p00c2abf3d4a54d4q",
      "option_array": [
        {
          "option": "OPT-1",
          "bindings": []
        }
      ],
      "offer_bank": {
        "bank": {
          "bank_info": "...",
        },
        "options": [
          {
            "issuer": "VISA",
            "level": 5
          }
        ]
      },
      "excluded_cards": [
        {
          "card_info": "..."
        }
      ],
      "cards": [
        {
          "card_info": "..."
        }
      ],
      "mobilepay_array": [
        {
          "mobilepay": {
            "mobilepay_info": "...",
          },
          "payment_type": 0
        }
      ],
      "mobilepay_option": 0,
      "eticket_payment": [
        {
          "eticket_info": "..."
        }
      ],
      "stores": [
        {
          "store": {
            "{store_info}": "..."
          },
          "channel": 0
        }
      ],
      "mpt_included_stores": [
        {
          "store": {
            "{store_info}": "..."
          },
          "channel": 1
        }
      ],
      "excluded_stores": [
        {
          "store": {
            "{store_info}": "..."
          },
          "channel": 2
        }
      ],
      "url": "https://url.com",
      "start_date": 1617601542000,
      "end_date": 1617601542000,
      "general_tags": [
        {
          "tag_info": "..."
        }
      ],
      "mobilepay_tags": [
        {
          "tag_info": "..."
        }
      ],
      "excluded_tags": [
        {
          "tag_info": "..."
        }
      ],
      "is_independent_reward": false,
      "reward_type": 1,
      "pre_conditions": [
        "pre1"
      ],
      "post_conditions": [
        "post1"
      ],
      "mobile_pay_binding": [
        {
          "mobilepay_info": "...",
        }
      ],
      "weekday": [
        1,
        7
      ],
      "month_days": [
        1,
        2
      ],
      "time": "10:00-12:00",
      "pay_methods": [
        {
          "mobilepay": {
            "mobilepay_info": "..."
          },
          "payment_type": 0
        }
      ],
      "register_url": "https://www.www.www",
      "coupon_code": "coupon",
      "discount_url": "https://www.www.www",
      "account_binding_type": 0,
      "account_name": "account",
      "electronic_bill_type": 1,
      "installment_required": false,
      "installment_acceptable": false,
      "installment_reward_type": "統一回饋",
      "note": "",
      "upper_bounds": [
        {
          "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
          "cash_upper_bound": 200,
          "frequency_upper_bound": 3,
          "upper_bound_period": 5,
          "store_independent": false,
          "sharing_upper_bounds": [
            "5f9a747p00c2abf3d4a54d4q"
          ]
        }
      ],
      "reward_content_type": 2,
      "mincost_type": 17,
      "reward_contents": [
        {
          "mincost_period_times": 1,
          "mincost_period": 5,
          "excluded_places": [],
          "mincost_value": 6000,
          "reward_name": "Line Points",
          "reward_value": 3.5,
          "coin_image": "https://image.png"
        }
      ]
    }
  ],
  "timestamp": 1617601542000
}
```

Bind formal offers sharing upper bound

### HTTP Request

`PUT https://api.cardbo.info/api/v6/offer/formal/upperbound`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter      | Required | Type     | Description
-------------- | -------- | -------- | -----------
upperbound_ids | true     | []string | Array of `upperbound_id` which need to bind together

### Response

#### Success

*Offer*

Parameter               | Type              | Enums | Description
----------------------- | ----------------- | ----- | -----------
option_array            | []OfferOption     |       | Offer options for user questionnaire
offer_bank              | []OfferBank       |       | All bank of card can get the offer
excluded_cards          | []OfferCard       |       | Cards excluded from bank offer
cards                   | []OfferCard       |       | Array of OfferCard
mobilepay_array         | []OfferMobilePay  |       | mobile pays can get the offer
mobilepay_option        | int               | `1`: 不限制 </br> `2`: 限定帳戶綁定 </br> `3`: 限定綁定信用卡 | Option of the mobile pays to get the offer
eticket_payments        | []ETicket         |       | E-ticket of the card to use to get the offer
stores                  | []OfferStore      |       | Stores to get the offer
mpt_included_stores     | []OfferStore      |       | Stores that can included for mobile pay
excluded_stores         | []OfferStore      |       | Stores that are excluded from the tags
url                     | string            |       | Offer URL
start_date              | int               |       | Offer start date in timeStamp
end_date                | int               |       | Offer end date in timeStamp
general_tags            | []Tag             |       | Tags which the type is general
mobilepay_tags          | []MobilePayTag    |       | Tags which the type is mobilepay
excluded_tags           | []Tag             |       | Tags excluded from the places
is_independent_reward   | bool              |       | Is the offer is independent or not
reward_type             | int               | `1`: 現金回饋-趴數 </br> `2`: 現金回饋-固定值 | Reward type
pre_conditions          | []string          |       | 事前問卷
post_conditions         | []string          |       | 事後問卷
mobile_pay_binding      | []MobilePay       |       | Mobile pays which need to bind to get the offer
weekday                 | []int             | [`1`-`7`] | The day in a week that can get the offer
month_days              | []int             | [`1`-`31`] | The day in a month that can get the offer
time                    | string            |       | The time in a day that can get the offer
pay_methods             | []OfferMobilePay  |       | Mobile pays to use to get the offer
register_url            | string            |       | 登錄網址
coupon_code             | string            |       | 優惠代碼
discount_url            | string            |       | 專屬連結
account_binding_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to bind account
account_name            | string            |       | Account name to bind
electronic_bill_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to apply electronic biil
installment_required    | bool              |       | Need to intall
installment_acceptable  | bool              |       | Can installment get the offer
installment_reward_type | string            | [`依分期回饋`, `統一回饋`] | The type of the installemnt offer
note                    | string            |       | Note
upper_bounds            | []OfferUpperBound |       | Upper bounds
reward_content_type     | int               | `1`: 優惠獨立計算 </br> `2`: 優惠累積計算 </br> `3`: 優惠分段累積計算 | Reward content type
mincost_type            | int               | `1`: 沒有最低消費限制 </br> `2`: 當下消費單筆滿 </br> `3`: 當下消費每滿 </br> `4`: 單一通路總共滿 </br> `5`: 單一通路個別滿 </br> `6`: 單一通路每滿 </br> `7`: 全通路總共滿 </br> `8`: 全通路個別滿 </br> `9`: 全通路每滿 </br> `10`: 一般消費總共滿 </br> `11`: 一般消費個別滿 </br> `12`: 一般消費每滿 </br> `13`: 國內一般消費總共滿 </br> `14`: 國內一般消費個別滿 </br> `15`: 國內一般消費每滿 </br> `16`: 總消費總共滿 </br> `17`: 總消費個別滿 </br> `18`: 總消費每滿 | Minimum cost type
reward_contents         | []RewardContent   |       | Reward contents

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Remove pending offer sharing upper bound (TODO)

## • Link pending offers options bindong (TODO)

## • Remove pending offer options binding (TODO)

## • Get formal offer by offer id (TODO)

## • Update formal offer

> Update formal offer:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/offer/formal/5f9a747p00c2abf3d4a54d4q \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "option_array": [
      {
        "option": "OPT-1"
      }
    ],
    "offer_bank": {
      "bank": {
        "bank_id": "5f9a747p00c2abf3d4a54d4q"
      },
      "options": [
        {
          "issuer": "VISA",
          "level": 5
        }
      ]
    },
    "excluded_cards": [
      {
        "card_id": "5f9a747p00c2abf3d4a54d4q"
      }
    ],
    "cards": [
      {
        "card_id": "5f9a747p00c2abf3d4a54d4q"
      }
    ],
    "mobilepay_array": [
      {
        "mobilepay": {
          "mobilepay_id": "5f9a747p00c2abf3d4a54d4q"
        },
        "payment_type": 0
      }
    ],
    "mobilepay_option": 0,
    "eticket_payment": [
      {
        "eticket_id": "5f9a747p00c2abf3d4a54d4q"
      }
    ],
    "stores": [
      {
        "store": {
          "store_id": "5f9a747p00c2abf3d4a54d4q"
        },
        "channel": 0
      }
    ],
    "mpt_included_stores": [
      {
        "store": {
          "store_id": "5f9a747p00c2abf3d4a54d4q"
        },
        "channel": 1
      }
    ],
    "excluded_stores": [
      {
        "store": {
          "store_id": "5f9a747p00c2abf3d4a54d4q"
        },
        "channel": 2
      }
    ],
    "url": "https://url.com",
    "start_date": 1617601542000,
    "end_date": 1617601542000,
    "general_tags": [
      {
        "tag_id": "5f9a747p00c2abf3d4a54d4q",
      }
    ],
    "mobilepay_tags": [
      {
        "tag": {
          "tag_id": "5f9a747p00c2abf3d4a54d4q",
        },
        "scope": 1,
        "payment_type": 0
      }
    ],
    "excluded_tags": [
      {
        "tag_id": "5f9a747p00c2abf3d4a54d4q",
      }
    ],
    "is_independent_reward": false,
    "reward_type": 1,
    "pre_conditions": [
      "pre1"
    ],
    "post_conditions": [
      "post1"
    ],
    "mobile_pay_binding": [
      {
        "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
      }
    ],
    "weekday": [
      1,
      7
    ],
    "month_days": [
      1,
      2
    ],
    "time": "10:00-12:00",
    "pay_methods": [
      {
        "mobilepay": {
          "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
        },
        "payment_type": 0
      }
    ],
    "register_url": "https://www.www.www",
    "coupon_code": "coupon",
    "discount_url": "https://www.www.www",
    "account_binding_type": 1,
    "account_name": "account",
    "electronic_bill_type": 1,
    "installment_required": false,
    "installment_acceptable": false,
    "installment_reward_type": "依分期回饋",
    "note": "",
    "upper_bounds": [
      {
        "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
        "cash_upper_bound": 200,
        "frequency_upper_bound": 3,
        "upper_bound_period": 5,
        "store_independent": false,
        "sharing_upper_bounds": [
          "5f9a747p00c2abf3d4a54d4q"
        ]
      }
    ],
    "reward_content_type": 2,
    "mincost_type": 17,
    "reward_contents": [
      {
        "mincost_period_times": 1,
        "mincost_period": 5,
        "excluded_places": [],
        "mincost_value": 6000,
        "reward_name": "Line Points",
        "reward_value": 3.5,
        "coin_image": "https://image.png"
      }
    ]
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/offer/formal/5f9a747p00c2abf3d4a54d4q'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "option_array": [
    {
      "option": "OPT-1"
    }
  ],
  "offer_bank": {
    "bank": {
      "bank_id": "5f9a747p00c2abf3d4a54d4q"
    },
    "options": [
      {
        "issuer": "VISA",
        "level": 5
      }
    ]
  },
  "excluded_cards": [
    {
      "card_id": "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  "cards": [
    {
      "card_id": "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  "mobilepay_array": [
    {
      "mobilepay": {
        "mobilepay_id": "5f9a747p00c2abf3d4a54d4q"
      },
      "payment_type": 0
    }
  ],
  "mobilepay_option": 0,
  "eticket_payment": [
    {
      "eticket_id": "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  "stores": [
    {
      "store": {
        "store_id": "5f9a747p00c2abf3d4a54d4q"
      },
      "channel": 0
    }
  ],
  "mpt_included_stores": [
    {
      "store": {
        "store_id": "5f9a747p00c2abf3d4a54d4q"
      },
      "channel": 1
    }
  ],
  "excluded_stores": [
    {
      "store": {
        "store_id": "5f9a747p00c2abf3d4a54d4q"
      },
      "channel": 2
    }
  ],
  "url": "https://url.com",
  "start_date": 1617601542000,
  "end_date": 1617601542000,
  "general_tags": [
    {
      "tag_id": "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  "mobilepay_tags": [
    {
      "tag": {
        "tag_id": "5f9a747p00c2abf3d4a54d4q",
      },
      "scope": 1,
      "payment_type": 0
    }
  ],
  "excluded_tags": [
    {
      "tag_id": "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  "is_independent_reward": false,
  "reward_type": 1,
  "pre_conditions": [
    "pre1"
  ],
  "post_conditions": [
    "post1"
  ],
  "mobile_pay_binding": [
    {
      "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  "weekday": [
    1,
    7
  ],
  "month_days": [
    1,
    2
  ],
  "time": "10:00-12:00",
  "pay_methods": [
    {
      "mobilepay": {
        "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
      },
      "payment_type": 0
    }
  ],
  "register_url": "https://www.www.www",
  "coupon_code": "coupon",
  "discount_url": "https://www.www.www",
  "account_binding_type": 1,
  "account_name": "account",
  "electronic_bill_type": 1,
  "installment_required": false,
  "installment_acceptable": false,
  "installment_reward_type": "依分期回饋",
  "note": "",
  "upper_bounds": [
    {
      "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
      "cash_upper_bound": 200,
      "frequency_upper_bound": 3,
      "upper_bound_period": 5,
      "store_independent": false,
      "sharing_upper_bounds": [
        "5f9a747p00c2abf3d4a54d4q"
      ]
    }
  ],
  "reward_content_type": 2,
  "mincost_type": 17,
  "reward_contents": [
    {
      "mincost_period_times": 1,
      "mincost_period": 5,
      "excluded_places": [],
      "mincost_value": 6000,
      "reward_name": "Line Points",
      "reward_value": 3.5,
      "coin_image": "https://image.png"
    }
  ]
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  option_array: [
    {
      option: "OPT-1"
    }
  ],
  offer_bank: {
    bank: {
      "bank_id": "5f9a747p00c2abf3d4a54d4q"
    },
    options: [
      {
        issuer: VISA,
        level: 5
      }
    ]
  },
  excluded_cards: [
    {
      card_id: "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  cards: [
    {
      card_id: "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  mobilepay_array: [
    {
      mobilepay: {
        mobilepay_id: "5f9a747p00c2abf3d4a54d4q"
      },
      payment_type: 0
    }
  ],
  mobilepay_option: 0,
  eticket_payment: [
    {
      eticket_id: "5f9a747p00c2abf3d4a54d4q"
    }
  ],
  stores: [
    {
      store: {
        store_id: "5f9a747p00c2abf3d4a54d4q"
      },
      channel: 0
    }
  ],
  mpt_included_stores: [
    {
      store: {
        store_id: "5f9a747p00c2abf3d4a54d4q"
      },
      channel: 1
    }
  ],
  excluded_stores: [
    {
      store: {
        store_id: "5f9a747p00c2abf3d4a54d4q"
      },
      channel: 2
    }
  ],
  url: "https://url.com",
  start_date: 1617601542000,
  end_date: 1617601542000,
  general_tags: [
    {
      tag_id: "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  mobilepay_tags: [
    {
      tag: {
        tag_id: "5f9a747p00c2abf3d4a54d4q",
      },
      scope: 1,
      payment_type: 0
    }
  ],
  excluded_tags: [
    {
      tag_id: "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  is_independent_reward: false,
  reward_type: 1,
  pre_conditions: [
    "pre1"
  ],
  post_conditions: [
    "post1"
  ],
  mobile_pay_binding: [
    {
      mobilepay_id: "5f9a747p00c2abf3d4a54d4q",
    }
  ],
  weekday: [
    1,
    7
  ],
  month_days: [
    1,
    2
  ],
  time: "10:00-12:00",
  pay_methods: [
    {
      mobilepay: {
        mobilepay_id: "5f9a747p00c2abf3d4a54d4q",
      },
      payment_type: 0
    }
  ],
  register_url: "https://www.www.www",
  coupon_code: "coupon",
  discount_url: "https://www.www.www",
  account_binding_type: 1,
  account_name: "account",
  electronic_bill_type: 1,
  installment_required: false,
  installment_acceptable: false,
  installment_reward_type: "依分期回饋",
  note: "",
  upper_bounds: [
    {
      upperbound_id: "5f9a747p00c2abf3d4a54d4q",
      cash_upper_bound: 200,
      frequency_upper_bound: 3,
      upper_bound_period: 5,
      store_independent: false,
      sharing_upper_bounds: [
        "5f9a747p00c2abf3d4a54d4q"
      ]
    }
  ],
  reward_content_type: 2,
  mincost_type: 17,
  reward_contents: [
    {
      mincost_period_times: 1,
      mincost_period: 5,
      excluded_places: [],
      mincost_value: 6000,
      reward_name: "Line Points",
      reward_value: 3.5,
      coin_image: "https://image.png"
    }
  ]
}
axios.put('https://api.cardbo.info/api/v6/offer/formal/5f9a747p00c2abf3d4a54d4q', data, {
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
    "offer_id": "5f9a747p00c2abf3d4a54d4q",
    "option_array": [
      {
        "option": "OPT-1",
        "bindings": []
      }
    ],
    "offer_bank": {
      "bank": {
        "bank_info": "...",
      },
      "options": [
        {
          "issuer": "VISA",
          "level": 5
        }
      ]
    },
    "excluded_cards": [
      {
        "card_info": "..."
      }
    ],
    "cards": [
      {
        "card_info": "..."
      }
    ],
    "mobilepay_array": [
      {
        "mobilepay": {
          "mobilepay_info": "...",
        },
        "payment_type": 0
      }
    ],
    "mobilepay_option": 0,
    "eticket_payment": [
      {
        "eticket_info": "..."
      }
    ],
    "stores": [
      {
        "store": {
          "{store_info}": "..."
        },
        "channel": 0
      }
    ],
    "mpt_included_stores": [
      {
        "store": {
          "{store_info}": "..."
        },
        "channel": 1
      }
    ],
    "excluded_stores": [
      {
        "store": {
          "{store_info}": "..."
        },
        "channel": 2
      }
    ],
    "url": "https://url.com",
    "start_date": 1617601542000,
    "end_date": 1617601542000,
    "general_tags": [
      {
        "tag_info": "..."
      }
    ],
    "mobilepay_tags": [
      {
        "tag_info": "..."
      }
    ],
    "excluded_tags": [
      {
        "tag_info": "..."
      }
    ],
    "is_independent_reward": false,
    "reward_type": 1,
    "pre_conditions": [
      "pre1"
    ],
    "post_conditions": [
      "post1"
    ],
    "mobile_pay_binding": [
      {
        "mobilepay_info": "...",
      }
    ],
    "weekday": [
      1,
      7
    ],
    "month_days": [
      1,
      2
    ],
    "time": "10:00-12:00",
    "pay_methods": [
      {
        "mobilepay": {
          "mobilepay_info": "..."
        },
        "payment_type": 0
      }
    ],
    "register_url": "https://www.www.www",
    "coupon_code": "coupon",
    "discount_url": "https://www.www.www",
    "account_binding_type": 0,
    "account_name": "account",
    "electronic_bill_type": 1,
    "installment_required": false,
    "installment_acceptable": false,
    "installment_reward_type": "統一回饋",
    "note": "",
    "upper_bounds": [
      {
        "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
        "cash_upper_bound": 200,
        "frequency_upper_bound": 3,
        "upper_bound_period": 5,
        "store_independent": false,
        "sharing_upper_bounds": [
          "5f9a747p00c2abf3d4a54d4q"
        ]
      }
    ],
    "reward_content_type": 2,
    "mincost_type": 17,
    "reward_contents": [
      {
        "mincost_period_times": 1,
        "mincost_period": 5,
        "excluded_places": [],
        "mincost_value": 6000,
        "reward_name": "Line Points",
        "reward_value": 3.5,
        "coin_image": "https://image.png"
      }
    ]
  },
  "timestamp": 1617601542000
}
```

Update formal offer

### HTTP Request

`PUT https://api.cardbo.info/api/v6/offer/formal/{offer_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter               | Required | Type              | Enums | Description
----------------------- | -------- | ----------------- | ----- | -----------
option_array            | false    | []OfferOption     |       | Offer options for user questionnaire
offer_bank              | false    | []OfferBank       |       | All bank of card can get the offer
excluded_cards          | false    | []OfferCard       |       | Cards excluded from bank offer
cards                   | false    | []OfferCard       |       | Array of OfferCard
mobilepay_array         | false    | []OfferMobilePay  |       | mobile pays can get the offer
mobilepay_option        | false    | int               | `1`: 不限制 </br> `2`: 限定帳戶綁定 </br> `3`: 限定綁定信用卡 | Option of the mobile pays to get the offer
eticket_payments        | false    | []ETicket         |       | E-ticket of the card to use to get the offer
stores                  | false    | []OfferStore      |       | Stores to get the offer
mpt_included_stores     | false    | []OfferStore      |       | Stores that can included for mobile pay
excluded_stores         | false    | []OfferStore      |       | Stores that are excluded from the tags
url                     | true     | string            |       | Offer URL
start_date              | true     | int               |       | Offer start date in timeStamp
end_date                | true     | int               |       | Offer end date in timeStamp
general_tags            | false    | []Tag             |       | Tags which the type is general
mobilepay_tags          | false    | []MobilePayTag    |       | Tags which the type is mobilepay
excluded_tags           | false    | []Tag             |       | Tags excluded from the places
is_independent_reward   | true     | bool              |       | Is the offer is independent or not
reward_type             | true     | int               | `1`: 現金回饋-趴數 </br> `2`: 現金回饋-固定值 | Reward type
pre_conditions          | false    | []string          |       | 事前問卷
post_conditions         | false    | []string          |       | 事後問卷
mobile_pay_binding      | false    | []MobilePay       |       | Mobile pays which need to bind to get the offer
weekday                 | false    | []int             | [`1`-`7`] | The day in a week that can get the offer
month_days              | false    | []int             | [`1`-`31`] | The day in a month that can get the offer
time                    | false    | string            |       | The time in a day that can get the offer
pay_methods             | false    | []OfferMobilePay  |       | Mobile pays to use to get the offer
register_url            | false    | string            |       | 登錄網址
coupon_code             | false    | string            |       | 優惠代碼
discount_url            | false    | string            |       | 專屬連結
account_binding_type    | true     | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to bind account
account_name            | false    | string            |       | Account name to bind
electronic_bill_type    | true     | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to apply electronic biil
installment_required    | true     | bool              |       | Need to intall
installment_acceptable  | true     | bool              |       | Can installment get the offer
installment_reward_type | false    | string            | [`依分期回饋`, `統一回饋`] | The type of the installemnt offer
note                    | false    | string            |       | Note
upper_bounds            | false    | []OfferUpperBound |       | Upper bounds
reward_content_type     | true     | int               | `1`: 優惠獨立計算 </br> `2`: 優惠累積計算 </br> `3`: 優惠分段累積計算 | Reward content type
mincost_type            | true     | int               | `1`: 沒有最低消費限制 </br> `2`: 當下消費單筆滿 </br> `3`: 當下消費每滿 </br> `4`: 單一通路總共滿 </br> `5`: 單一通路個別滿 </br> `6`: 單一通路每滿 </br> `7`: 全通路總共滿 </br> `8`: 全通路個別滿 </br> `9`: 全通路每滿 </br> `10`: 一般消費總共滿 </br> `11`: 一般消費個別滿 </br> `12`: 一般消費每滿 </br> `13`: 國內一般消費總共滿 </br> `14`: 國內一般消費個別滿 </br> `15`: 國內一般消費每滿 </br> `16`: 總消費總共滿 </br> `17`: 總消費個別滿 </br> `18`: 總消費每滿 | Minimum cost type
reward_contents         | true     | []RewardContent   |       | Reward contents

*OfferOption*

Parameter | Required | Type   | Description
--------- | -------- | ------ | -----------
option    | true     | string | 方案 (事前問卷)

*OfferBank*

Parameter | Required | Type         | Description
--------- | -------- | ------------ | -----------
bank      | true     | Bank         | Bank info
options   | false    | []CardOption | The options of the card in the bank which can get the offer

*CardOption*

Parameter  | Required | Type   | Enums | Description
---------- | -------- | ------ | ----- | -----------
issuer     | true     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | true     | int    | [`1`-`8`] | level of the card

*OfferCard*

Parameter  | Required | Type   | Enums | Description
---------- | -------- | ------ | ----- | -----------
card_id    | true     | string |       | card id
issuer     | true     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | true     | int    | [`1`-`8`] | level of the card

*OfferMobilePay*

Parameter    | Required | Type      | Enums | Description
------------ | -------- | --------- | ----- | -----------
mobilepay    | true     | MobilePay |       | Mobile pay which can get the offer
payment_type | true     | string    | `1`: 感應支付(NFC) </br> `2`: 掃碼支付 </br> `3`:條碼支付 | Payment tyoe to use to get the offer

*OfferStore*

Parameter | Required | Type  | Enums | Description
--------- | -------- | ----- | ----- | -----------
store     | true     | Store |       | Store object
channel   | true     | int   | `0`: No restriction </br> `1`: Physical store </br> `2`: Web </br> `3`: App | The channel of the store

*MobilePayTag*

Parameter    | Required | Type | Enums | Description
------------ | -------- | ---- | ----- | -----------
tag          | true     | Tag  |       | Tag info
scope        | true     | int  | `1`: 所有消費 </br> `2`: 一般消費 </br> `3`: 國內一般消費 | The scope of the expense
payment_type | false    | int  | `1`: 感應(NFC) </br> `2`: 掃碼 </br> `3`: 條碼 | Payment type

*OfferUpperBound*

Key                   | Required | Type     | Enums | Description
--------------------- | -------- | -------- | ----- | -----------
cash_upper_bound      | false    | int      |       | cashback upperbound value
frequency_upper_bound | false    | int      |       | how many times can the offer got
upper_bound_period    | true     | int      | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | upper bound period
store_independent     | true     | bool     |       | is the upper bound calculate independent from each store
sharing_upper_bounds  | false    | []string |       | array of upperbound ID share same upper bound (`upper_bound_id`)

*RewardContent*

Key                  | Required | Type    | Enums  | Description
-------------------- | -------- | ------- | ------ | -----------
mincost_period_times | false    | int     |        | how many time for the min cost period
mincost_period       | false    | int     | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | min cost period
excluded_places      | false    | []Store |        | Places that excluded from the min cost
mincost_value        | false    | int     |        | min cost value
reward_name          | true     | string  |        | reward name (現金, Line Points, 街口幣, Open Points, P幣, Hami Point, 代幣...)
reward_value         | true     | float   |        | reward value

### Response

#### Success

*Offer*

Parameter               | Type              | Enums | Description
----------------------- | ----------------- | ----- | -----------
option_array            | []OfferOption     |       | Offer options for user questionnaire
offer_bank              | []OfferBank       |       | All bank of card can get the offer
excluded_cards          | []OfferCard       |       | Cards excluded from bank offer
cards                   | []OfferCard       |       | Array of OfferCard
mobilepay_array         | []OfferMobilePay  |       | mobile pays can get the offer
mobilepay_option        | int               | `1`: 不限制 </br> `2`: 限定帳戶綁定 </br> `3`: 限定綁定信用卡 | Option of the mobile pays to get the offer
eticket_payments        | []ETicket         |       | E-ticket of the card to use to get the offer
stores                  | []OfferStore      |       | Stores to get the offer
mpt_included_stores     | []OfferStore      |       | Stores that can included for mobile pay
excluded_stores         | []OfferStore      |       | Stores that are excluded from the tags
url                     | string            |       | Offer URL
start_date              | int               |       | Offer start date in timeStamp
end_date                | int               |       | Offer end date in timeStamp
general_tags            | []Tag             |       | Tags which the type is general
mobilepay_tags          | []MobilePayTag    |       | Tags which the type is mobilepay
excluded_tags           | []Tag             |       | Tags excluded from the places
is_independent_reward   | bool              |       | Is the offer is independent or not
reward_type             | int               | `1`: 現金回饋-趴數 </br> `2`: 現金回饋-固定值 | Reward type
pre_conditions          | []string          |       | 事前問卷
post_conditions         | []string          |       | 事後問卷
mobile_pay_binding      | []MobilePay       |       | Mobile pays which need to bind to get the offer
weekday                 | []int             | [`1`-`7`] | The day in a week that can get the offer
month_days              | []int             | [`1`-`31`] | The day in a month that can get the offer
time                    | string            |       | The time in a day that can get the offer
pay_methods             | []OfferMobilePay  |       | Mobile pays to use to get the offer
register_url            | string            |       | 登錄網址
coupon_code             | string            |       | 優惠代碼
discount_url            | string            |       | 專屬連結
account_binding_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to bind account
account_name            | string            |       | Account name to bind
electronic_bill_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to apply electronic biil
installment_required    | bool              |       | Need to intall
installment_acceptable  | bool              |       | Can installment get the offer
installment_reward_type | string            | [`依分期回饋`, `統一回饋`] | The type of the installemnt offer
note                    | string            |       | Note
upper_bounds            | []OfferUpperBound |       | Upper bounds
reward_content_type     | int               | `1`: 優惠獨立計算 </br> `2`: 優惠累積計算 </br> `3`: 優惠分段累積計算 | Reward content type
mincost_type            | int               | `1`: 沒有最低消費限制 </br> `2`: 當下消費單筆滿 </br> `3`: 當下消費每滿 </br> `4`: 單一通路總共滿 </br> `5`: 單一通路個別滿 </br> `6`: 單一通路每滿 </br> `7`: 全通路總共滿 </br> `8`: 全通路個別滿 </br> `9`: 全通路每滿 </br> `10`: 一般消費總共滿 </br> `11`: 一般消費個別滿 </br> `12`: 一般消費每滿 </br> `13`: 國內一般消費總共滿 </br> `14`: 國內一般消費個別滿 </br> `15`: 國內一般消費每滿 </br> `16`: 總消費總共滿 </br> `17`: 總消費個別滿 </br> `18`: 總消費每滿 | Minimum cost type
reward_contents         | []RewardContent   |       | Reward contents

*OfferOption*

Parameter | Required | Type   | Description
--------- | -------- | ------ | -----------
option    | true     | string | 方案 (事前問卷)

*OfferBank*

Parameter | Type         | Description
--------- | ------------ | -----------
bank      | Bank         | Bank info
options   | []CardOption | The options of the card in the bank which can get the offer

*CardOption*

Parameter  | Type   | Enums | Description
---------- | ------ | ----- | -----------
issuer     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | int    | [`1`-`8`] | level of the card
level_name | string |       | level name of the card

*OfferCard*

Parameter  | Type   | Enums | Description
---------- | ------ | ----- | -----------
card_id    | string |       | card id
name       | string |       | card name
issuer     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | int    | [`1`-`8`] | level of the card
level_name | string |       | level name of the card

*OfferMobilePay*

Parameter    | Type      | Enums | Description
------------ | --------- | ----- | -----------
mobilepay    | MobilePay |       | Mobile pay which can get the offer
payment_type | string    | `1`: 感應支付(NFC) </br> `2`: 掃碼支付 </br> `3`:條碼支付 | Payment tyoe to use to get the offer

*OfferStore*

Parameter | Required | Type  | Enums | Description
--------- | -------- | ----- | ----- | -----------
store     | true     | Store |       | Store object
channel   | true     | int   | `0`: No restriction </br> `1`: Physical store </br> `2`: Web </br> `3`: App | The channel of the store

*MobilePayTag*

Parameter    | Required | Type | Enums | Description
------------ | -------- | ---- | ----- | -----------
tag          | true     | Tag  |       | Tag info
scope        | true     | int  | `1`: 所有消費 </br> `2`: 一般消費 </br> `3`: 國內一般消費 | The scope of the expense
payment_type | false    | int  | `1`: 感應(NFC) </br> `2`: 掃碼 </br> `3`: 條碼 | Payment type

*OfferUpperBound*

Key                   | Type     | Enums | Description
--------------------- | -------- | ----- | -----------
upperbound_id         | string   |       | upperbound ID
cash_upper_bound      | int      |       | cashback upperbound value
frequency_upper_bound | int      |       | how many times can the offer got
upper_bound_period    | int      | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | upper bound period
store_independent     | bool     |       | is the upper bound calculate independent from each store
sharing_upper_bounds  | []string |       | array of upperbound ID share same upper bound

*RewardContent*

Key                  | Type    | Enums  | Description
-------------------- | ------- | ------ | -----------
mincost_period_times | int     |        | how many time for the min cost period
mincost_period       | int     | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | min cost period
excluded_places      | []Store |        | Places that excluded from the min cost
mincost_value        | int     |        | min cost value
reward_name          | string  |        | reward name (現金, Line Points, 街口幣, Open Points, P幣, Hami Point, 代幣...)
reward_value         | float   |        | reward value
coin_image           | string  |        | coin image URL

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Remove formal offer (TODO)

## • Get formal offers

> Get formal offers:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/offers/formal?page=1&creator=5f9a747p00c2abf3d4a54d4q \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/offers/formal?page=1&creator=5f9a747p00c2abf3d4a54d4q'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/offers/formal?page=1&creator=5f9a747p00c2abf3d4a54d4q', {
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
      "offer_id": "5f9a747p00c2abf3d4a54d4q",
      "option_array": [
        {
          "option": "OPT-1",
          "bindings": []
        }
      ],
      "offer_bank": {
        "bank": {
          "bank_info": "...",
        },
        "options": [
          {
            "issuer": "VISA",
            "level": 5
          }
        ]
      },
      "excluded_cards": [
        {
          "card_info": "..."
        }
      ],
      "cards": [
        {
          "card_info": "..."
        }
      ],
      "mobilepay_array": [
        {
          "mobilepay": {
            "mobilepay_info": "...",
          },
          "payment_type": 0
        }
      ],
      "mobilepay_option": 0,
      "eticket_payment": [
        {
          "eticket_info": "..."
        }
      ],
      "stores": [
        {
          "store": {
            "{store_info}": "..."
          },
          "channel": 0
        }
      ],
      "mpt_included_stores": [
        {
          "store": {
            "{store_info}": "..."
          },
          "channel": 1
        }
      ],
      "excluded_stores": [
        {
          "store": {
            "{store_info}": "..."
          },
          "channel": 2
        }
      ],
      "url": "https://url.com",
      "start_date": 1617601542000,
      "end_date": 1617601542000,
      "general_tags": [
        {
          "tag_info": "..."
        }
      ],
      "mobilepay_tags": [
        {
          "tag_info": "..."
        }
      ],
      "excluded_tags": [
        {
          "tag_info": "..."
        }
      ],
      "is_independent_reward": false,
      "reward_type": 1,
      "pre_conditions": [
        "pre1"
      ],
      "post_conditions": [
        "post1"
      ],
      "mobile_pay_binding": [
        {
          "mobilepay_info": "...",
        }
      ],
      "weekday": [
        1,
        7
      ],
      "month_days": [
        1,
        2
      ],
      "time": "10:00-12:00",
      "pay_methods": [
        {
          "mobilepay": {
            "mobilepay_info": "..."
          },
          "payment_type": 0
        }
      ],
      "register_url": "https://www.www.www",
      "coupon_code": "coupon",
      "discount_url": "https://www.www.www",
      "account_binding_type": 0,
      "account_name": "account",
      "electronic_bill_type": 1,
      "installment_required": false,
      "installment_acceptable": false,
      "installment_reward_type": "統一回饋",
      "note": "",
      "upper_bounds": [
        {
          "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
          "cash_upper_bound": 200,
          "frequency_upper_bound": 3,
          "upper_bound_period": 5,
          "store_independent": false,
          "sharing_upper_bounds": [
            "5f9a747p00c2abf3d4a54d4q"
          ]
        }
      ],
      "reward_content_type": 2,
      "mincost_type": 17,
      "reward_contents": [
        {
          "mincost_period_times": 1,
          "mincost_period": 5,
          "excluded_places": [],
          "mincost_value": 6000,
          "reward_name": "Line Points",
          "reward_value": 3.5,
          "coin_image": "https://image.png"
        }
      ]
    }
  ],
  "timestamp": 1617601542000
}
```

Get pending offers

### HTTP Request

`GET https://api.cardbo.info/api/v6/offers/formal`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Queries

Query   | Required | Muti-values | Description
------- | -------- | ----------- | -----------
page    | true     | false       | Page of the data
creator | false    | false       | Filter the creator

<aside class="notice">
There are 20 data each page.
</aside>

### Response

#### Success

*Offer*

Parameter               | Type              | Enums | Description
----------------------- | ----------------- | ----- | -----------
options                 | []string          |       | 方案 (事前問卷)
options_binding         | []string          |       | 不同方案組合 (`offer_id`)
offer_bank              | []OfferBank       |       | All bank of card can get the offer
excluded_cards          | []OfferCard       |       | Cards excluded from bank offer
cards                   | []OfferCard       |       | Array of OfferCard
mobilepay_array         | []OfferMobilePay  |       | mobile pays can get the offer
mobilepay_option        | int               | `1`: 不限制 </br> `2`: 限定帳戶綁定 </br> `3`: 限定綁定信用卡 | Option of the mobile pays to get the offer
eticket_payments        | []ETicket         |       | E-ticket of the card to use to get the offer
places                  | []Store           |       | Places to get the offer
mpt_included_places     | []Store           |       | Stores that can included for mobile pay tags
excluded_places         | []Store           |       | Stores that are excluded from the tags
url                     | string            |       | Offer URL
start_date              | int               |       | Offer start date in timeStamp
end_date                | int               |       | Offer end date in timeStamp
general_tags            | []Tag             |       | Tags which the type is general
mobilepay_tags          | []MobilePayTag    |       | Tags which the type is mobilepay
excluded_tags           | []Tag             |       | Tags excluded from the places
is_independent_reward   | bool              |       | Is the offer is independent or not
reward_type             | int               | `1`: 現金回饋-趴數 </br> `2`: 現金回饋-固定值 | Reward type
pre_conditions          | []string          |       | 事前問卷
post_conditions         | []string          |       | 事後問卷
mobile_pay_binding      | []MobilePay       |       | Mobile pays which need to bind to get the offer
weekday                 | []int             | [`1`-`7`] | The day in a week that can get the offer
month_days              | []int             | [`1`-`31`] | The day in a month that can get the offer
time                    | string            |       | The time in a day that can get the offer
pay_methods             | []OfferMobilePay  |       | Mobile pays to use to get the offer
register_url            | string            |       | 登錄網址
coupon_code             | string            |       | 優惠代碼
discount_url            | string            |       | 專屬連結
account_binding_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to bind account
account_name            | string            |       | Account name to bind
electronic_bill_type    | int               | `0`: 不限制 </br> `1`: 必須是 </br> `2`: 必須否 | Need to apply electronic biil
installment_required    | bool              |       | Need to intall
installment_acceptable  | bool              |       | Can installment get the offer
installment_reward_type | string            | [`依分期回饋`, `統一回饋`] | The type of the installemnt offer
note                    | string            |       | Note
upper_bounds            | []OfferUpperBound |       | Upper bounds
reward_content_type     | int               | `1`: 優惠獨立計算 </br> `2`: 優惠累積計算 </br> `3`: 優惠分段累積計算 | Reward content type
mincost_type            | int               | `1`: 沒有最低消費限制 </br> `2`: 當下消費單筆滿 </br> `3`: 當下消費每滿 </br> `4`: 單一通路總共滿 </br> `5`: 單一通路個別滿 </br> `6`: 單一通路每滿 </br> `7`: 全通路總共滿 </br> `8`: 全通路個別滿 </br> `9`: 全通路每滿 </br> `10`: 一般消費總共滿 </br> `11`: 一般消費個別滿 </br> `12`: 一般消費每滿 </br> `13`: 國內一般消費總共滿 </br> `14`: 國內一般消費個別滿 </br> `15`: 國內一般消費每滿 </br> `16`: 總消費總共滿 </br> `17`: 總消費個別滿 </br> `18`: 總消費每滿 | Minimum cost type
reward_contents         | []RewardContent   |       | Reward contents

*OfferBank*

Parameter | Type         | Description
--------- | ------------ | -----------
bank      | Bank         | Bank info
options   | []CardOption | The options of the card in the bank which can get the offer

*CardOption*

Parameter  | Type   | Enums | Description
---------- | ------ | ----- | -----------
issuer     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | int    | [`1`-`8`] | level of the card
level_name | string |       | level name of the card

*OfferCard*

Parameter  | Type   | Enums | Description
---------- | ------ | ----- | -----------
card_id    | string |       | card id
name       | string |       | card name
issuer     | string | `VISA`, `MASTERCARD`, `JCB`, `AMERICAN EXPRESS`, `UNION PAY` | issuer of the card
level      | int    | [`1`-`8`] | level of the card
level_name | string |       | level name of the card

*OfferMobilePay*

Parameter    | Type      | Enums | Description
------------ | --------- | ----- | -----------
mobilepay    | MobilePay |       | Mobile pay which can get the offer
payment_type | string    | `1`: 感應支付(NFC) </br> `2`: 掃碼支付 </br> `3`:條碼支付 | Payment tyoe to use to get the offer

*MobilePayTag*

Parameter    | Required | Type | Enums | Description
------------ | -------- | ---- | ----- | -----------
tag          | true     | Tag  |       | Tag info
scope        | true     | int  | `1`: 所有消費 </br> `2`: 一般消費 </br> `3`: 國內一般消費 | The scope of the expense
payment_type | false    | int  | `1`: 感應(NFC) </br> `2`: 掃碼 </br> `3`: 條碼 | Payment type

*OfferUpperBound*

Key                   | Type     | Enums | Description
--------------------- | -------- | ----- | -----------
upperbound_id         | string   |       | upperbound ID
cash_upper_bound      | int      |       | cashback upperbound value
frequency_upper_bound | int      |       | how many times can the offer got
upper_bound_period    | int      | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | upper bound period
store_independent     | bool     |       | is the upper bound calculate independent from each store
sharing_upper_bounds  | []string |       | array of upperbound ID share same upper bound

*RewardContent*

Key                  | Type    | Enums  | Description
-------------------- | ------- | ------ | -----------
mincost_period_times | int     |        | how many time for the min cost period
mincost_period       | int     | `1`: TOTAL <br/> `2`: EVERY <br/> `3`: DAILY <br/> `4`: WEEKLY <br/> `5`: MONTHLY <br/> `6`: ANNUALLY | min cost period
excluded_places      | []Store |        | Places that excluded from the min cost
mincost_value        | int     |        | min cost value
reward_name          | string  |        | reward name (現金, Line Points, 街口幣, Open Points, P幣, Hami Point, 代幣...)
reward_value         | float   |        | reward value
coin_image           | string  |        | coin image URL

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get card offers

> Get all offers and new user offers of a card

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v5.5/offers/formal/card/5f9a747p00c2abf3d4a54d4q \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v5.5/offers/formal/card/5f9a747p00c2abf3d4a54d4q'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.delete(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.delete('https://api.cardbo.info/api/v5.5/offers/formal/card/5f9a747p00c2abf3d4a54d4q', {
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
    "offers": [
      {
        "offer": {
          "offer_info": "...",
        },
        "recently_updated": false
      }
    ],
    "new_user_offers": [
      {
        "new_user_offer_info": "..."
      }
    ]
  },
  "timestamp": 1617601542000
}
```

Get all offers and new user offers of a card

### HTTP Request

`GET https://api.cardbo.info/api/v5.5/offers/formal/card/{card_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

<aside class="notice">
At least one of <b>card_id</b> and <b>mobilepay_id</b> is required.
</aside>

### Response

#### Success

Key             | Type              | Description
--------------- | ----------------- | -----------
offers          | []OfferUpdateInfo | Array of OfferUpdateInfo object
new_user_offers | []NewUserOffer    | Array of  NewUserOffer object

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Search offers By store

> search offers from user's card

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v6/offers/formal/search \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "store": "711",
    "amount": 100,
    "has_post_condition": true,
    "post_condition": {
      "post_conditions": ["上網登錄"],
      "channel": 0,
      "register_url": true,
      "coupon_code": false
    }
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/offers/formal/search'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "store": "711",
  "amount": 100,
  "has_post_condition": true,
  "post_condition": {
    "post_conditions": ["上網登錄"],
    "channel": 0,
    "register_url": true,
    "coupon_code": false
  }
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  store: "711",
  amount: 100,
  has_post_condition: true,
  post_condition: {
    post_conditions: ["上網登錄"],
    channel: 0,
    register_url: true,
    coupon_code: false
  }
}
axios.post('https://api.cardbo.info/api/v6/offers/formal/search', data, {
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
    "user_type": 3,
    "store": {
      "store": "...",
    },
    "amount": 100,
    "search_result_type": 1,
    "results": [
      {
        "result_type": 1,
        "special_condition": false,
        "card": {
          "card_id": "5f9a747p00c2abf3d4a54d4q",
          "name": "信用卡",
          "bank": {
            "{bank_info}": "...",
          },
          "level": 1,
          "image": "https://image.png",
          "issuer": "VISA",
          "payment_date": 0,
          "card_last_no": "",
          "reward_day": 0,
          "has_questionnaire": true,
          "questionnaire_completed": false,
          "enable_reward": false
        },
        "mobilepay": {
          "{mobilepay_info}": "..."
        },
        "mobilepays": [
          {
            "{mobilepay_info}": "..."
          }
        ],
        "eticket": {
          "{eticket_info}": "..."
        },
        "cashback_value": {
          "cashback_value": 500,
          "cashback_coins": [
            {
              "reward_name": "Line Points",
              "image": "https://image.png"
            }
          ]
        },
        "cashback_percentage": {
          "max_expense": 200,
          "max_cashback": 18,
          "cashback_coins": [
            {
              "reward_name": "Line Points",
              "image": "https://image.png"
            }
          ],
          "offers": [
            {
              "offer_id": "5f9a747p00c2abf3d4a54d4q",
              "options": [],
              "end_date": 1617601542000,
              "pre_conditions": [
                "綁定 Line 帳號"
              ],
              "post_conditions": null,
              "register_url": "",
              "coupon_code": "",
              "discount_url": "",
              "upper_bounds": [
                {
                  "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
                  "cash_upper_bound": 200,
                  "frequency_upper_bound": 3,
                  "upper_bound_period": 5,
                  "store_independent": false,
                  "sharing_upper_bounds": [
                    "5f9a747p00c2abf3d4a54d4q"
                  ]
                }
              ],
              "reward_type": 1,
              "max_reward_content": {
                "mincost_period_times": 0,
                "mincost_period": 0,
                "excluded_places": [],
                "mincost_value": 0,
                "reward_name": "Line Points",
                "reward_value": 15,
                "coin_image": "https://image.png"
              },
              "reward_contents": [
                {
                  "mincost_period_times": 0,
                  "mincost_period": 0,
                  "excluded_places": [],
                  "mincost_value": 0,
                  "reward_name": "Line Points",
                  "reward_value": 15,
                  "coin_image": "https://image.png"
                }
              ],
              "selected": true
            }
          ]
        },
        "cashback_fixed": {
          "max_expense": 0,
          "max_cashback": 0,
          "cashback_coins": [],
          "offers": []
        },
        "offers": [
          {
            "offer_id": "5f9a747p00c2abf3d4a54d4q",
            "options": [],
            "end_date": 1617601542000,
            "pre_conditions": [
              "綁定 Line 帳號"
            ],
            "post_conditions": null,
            "register_url": "",
            "coupon_code": "",
            "discount_url": "",
            "upper_bounds": [
              {
                "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
                "cash_upper_bound": 200,
                "frequency_upper_bound": 3,
                "upper_bound_period": 5,
                "store_independent": false,
                "sharing_upper_bounds": [
                  "5f9a747p00c2abf3d4a54d4q"
                ]
              }
            ],
            "reward_type": 1,
            "max_reward_content": {
              "mincost_period_times": 0,
              "mincost_period": 0,
              "excluded_places": [],
              "mincost_value": 0,
              "reward_name": "Line Points",
              "reward_value": 15,
              "coin_image": "https://image.png"
            },
            "reward_contents": [
              {
                "mincost_period_times": 0,
                "mincost_period": 0,
                "excluded_places": [],
                "mincost_value": 0,
                "reward_name": "Line Points",
                "reward_value": 15,
                "coin_image": "https://image.png"
              }
            ],
            "selected": true
          }
        ],
        "conditions": [
          {
            "condition_type": 1,
            "name": "綁定 Line 帳號",
            "url": ""
          }
        ]
      }
    ],
    "post_condition": {
      "post_conditions": ["使用APP"],
      "channels": [0, 1, 2],
      "register_url": true,
      "coupon_code": false
    },
    "categories": ["國內一般消費", "國外一般消費", "網購", "Apple Pay"]
  },
  "timestamp": 1617601542000
}
```

Search offers by store

### HTTP Request

`POST https://api.cardbo.info/api/v6/offers/formal/search`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter          | Required | Type                 | Description
------------------ | -------- | -------------------- | -----------
store              | true     | string               | Store name
amount             | false    | int                  | Expense amount
has_post_condition | true     | bool                 | Does request contain post condition info
post_condition     | false    | PostConditionRequest | Post condition info

*PostConditionRequest*

Parameter       | Required | Type     | Enums | Description
--------------- | -------- | -------- | ----- | -----------
post_conditions | false    | []string |       | Post conditions provided from response
channel         | false    | int      | `0`: 不限制通路 </br> `1`: 實體店 </br> `2`: 官網(線上通路) </br> `3`: APP | The channel from user's answer
register_url    | false    | bool     |       | Would user register or not
coupon_code     | false    | bool     |       | Would user user coupon code or not

### Response

#### Success

<aside class="notice">
When <code>search_result_type=1</code>, <code>results</code> has value; when <code>search_result_type=2</code>, <code>post_condition</code> has value; when <code>search_result_type=3</code>, <code>categories</code> has value. If API returns <code>search_result_type=2</code>, need to provide <code>post_condition</code> which meet user's condtion and call API again.
</aside>

Key                | Type                      | Enums | Description
------------------ | ------------------------- | ----- | -----------
store              | Store                     |       | Store object
amount             | int                       |       | Expense amount
search_result_type | int                       | `1`: Has result </br> `2`: Need post conditions </br> `3`: No results </br> `4`: Unsupported store type `5`: No store data | The search result type
results            | []OfferSearchResultDetail |       | Offer search result when `search_result_type=1`
post_condition     | PostCondition             |       | Post condition array when `search_result_type=2`
categories         | []string                  |       | Category array when `search_result_type=3`

*OfferSearchResultDetail*

Key                 | Type                    | Enums | Description
------------------- | ----------------------- | ----- | -----------
result_type         | int                     | `1`: MobilePay Only </br> `2`: Card Only </br> `3`: Card with MobilePay </br> `4`: Card with ETicket | Result payment type
special_condition   | bool                    |       | Is special condition
mobilepay           | MobilePay               |       | Mobeile pay for `result_type=1`
card                | UserCard                |       | User card for `result_type=2` and `result_type=3`
mobilepays          | []MobilePay             |       | Mobile pays used with card for `result_type=3`
eticket             | ETicket                 |       | The eticket used with the card for  `result_type=3`
cashback_value      | CashbackValue           |       | Cashback value for `user_type=3`
cashback_percentage | RewardDetail            |       | Cashback percentage info
cashback_fixed      | RewardDetail            |       | Cashback fixed info
offers              | []OfferResult           |       | All offers
conditions          | []SearchResultCondition |       | Array of conditions

*CashbackValue*

Key            | Type           | Description
-------------- | -------------- | -----------
cashback_value | float          | Reward value
cashback_coins | []CashbackCoin | Coin info of the cashback

*RewardDetail*

Key            | Type           | Description
-------------- | -------------- | -----------
max_expense    | int            | Max expense for the reward
max_cashback   | float          | Max cashback percentage/fixed value
cashback_coins | []CashbackCoin | Coin info of the cashback
offers         | []OfferResult  | All offers match the result

*PostCondition*

Key             | Type     | Enums | Description
--------------- |--------- | ----- | -----------
post_conditions | []string |       | Post condition question
channels        | []int    |`0`: 不限制通路 </br> `1`: 實體店 </br> `2`: 官網(線上通路) </br> `3`: APP | Channels to get offers
register_url    | bool     |       | Does the offers need register from ULR
coupon_code     | bool     |       | Does the offers need coupon code

*SearchResultCondition*

Key            | Type   | Enums | Description
-------------- |------- | ----- | -----------
condition_type | int    | `1`: 一般條件 </br> `2`: 登錄 </br> `3`: 優惠碼 </br> `4`: 專屬連結 </br> `5`: 最低消費條件(特殊) | Conditiogn type
name           | string |       | Condition description
url            | string |       | Condition URL

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Search offers By category

> Search offers By category

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v6/offers/formal/search/category \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "category": "國內一般消費",
    "amount": 100,
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/offers/formal/search/category'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "category": "國內一般消費",
  "amount": 100,
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  category: "國內一般消費",
  amount: 100,
}
axios.post('https://api.cardbo.info/api/v6/offers/formal/search/category', data, {
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
    "user_type": 3,
    "tag": {
      "{tag_info}": "..."
    },
    "amount": 100,
    "search_result_type": 1,
    "results": [
      {
        "result_type": 1,
        "special_condition": false,
        "card": {
          "card_id": "5f9a747p00c2abf3d4a54d4q",
          "name": "信用卡",
          "bank": {
            "{bank_info}": "...",
          },
          "level": 1,
          "image": "https://image.png",
          "issuer": "VISA",
          "payment_date": 0,
          "card_last_no": "",
          "reward_day": 0,
          "has_questionnaire": true,
          "questionnaire_completed": false,
          "enable_reward": false
        },
        "mobilepay": {
          "{mobilepay_info}": "..."
        },
        "mobilepays": [
          {
            "{mobilepay_info}": "..."
          }
        ],
        "cashback_value": {
          "cashback_value": 500,
          "cashback_coins": [
            {
              "reward_name": "Line Points",
              "image": "https://image.png"
            }
          ]
        },
        "cashback_percentage": {
          "max_expense": 200,
          "max_cashback": 18,
          "cashback_coins": [
            {
              "reward_name": "Line Points",
              "image": "https://image.png"
            }
          ],
          "offers": [
            {
              "offer_id": "5f9a747p00c2abf3d4a54d4q",
              "options": [],
              "end_date": 1617601542000,
              "pre_conditions": [
                "綁定 Line 帳號"
              ],
              "post_conditions": null,
              "register_url": "",
              "coupon_code": "",
              "discount_url": "",
              "upper_bounds": [
                {
                  "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
                  "cash_upper_bound": 200,
                  "frequency_upper_bound": 3,
                  "upper_bound_period": 5,
                  "store_independent": false,
                  "sharing_upper_bounds": [
                    "5f9a747p00c2abf3d4a54d4q"
                  ]
                }
              ],
              "reward_type": 1,
              "max_reward_content": {
                "mincost_period_times": 0,
                "mincost_period": 0,
                "excluded_places": [],
                "mincost_value": 0,
                "reward_name": "Line Points",
                "reward_value": 15,
                "coin_image": "https://image.png"
              },
              "reward_contents": [
                {
                  "mincost_period_times": 0,
                  "mincost_period": 0,
                  "excluded_places": [],
                  "mincost_value": 0,
                  "reward_name": "Line Points",
                  "reward_value": 15,
                  "coin_image": "https://image.png"
                }
              ],
              "selected": true
            }
          ]
        },
        "cashback_fixed": {
          "max_expense": 0,
          "max_cashback": 0,
          "cashback_coins": [],
          "offers": []
        },
        "offers": [
          {
            "offer_id": "5f9a747p00c2abf3d4a54d4q",
            "options": [],
            "end_date": 1617601542000,
            "pre_conditions": [
              "綁定 Line 帳號"
            ],
            "post_conditions": null,
            "register_url": "",
            "coupon_code": "",
            "discount_url": "",
            "upper_bounds": [
              {
                "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
                "cash_upper_bound": 200,
                "frequency_upper_bound": 3,
                "upper_bound_period": 5,
                "store_independent": false,
                "sharing_upper_bounds": [
                  "5f9a747p00c2abf3d4a54d4q"
                ]
              }
            ],
            "reward_type": 1,
            "max_reward_content": {
              "mincost_period_times": 0,
              "mincost_period": 0,
              "excluded_places": [],
              "mincost_value": 0,
              "reward_name": "Line Points",
              "reward_value": 15,
              "coin_image": "https://image.png"
            },
            "reward_contents": [
              {
                "mincost_period_times": 0,
                "mincost_period": 0,
                "excluded_places": [],
                "mincost_value": 0,
                "reward_name": "Line Points",
                "reward_value": 15,
                "coin_image": "https://image.png"
              }
            ],
            "selected": true
          }
        ],
        "conditions": [
          {
            "condition_type": 1,
            "name": "綁定 Line 帳號",
            "url": ""
          }
        ]
      }
    ]
  },
  "timestamp": 1617601542000
}
```

Search offers by category

### HTTP Request

`POST https://api.cardbo.info/api/v6/offers/formal/search/category`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter | Required | Type                 | Description
--------- | -------- | -------------------- | -----------
category  | true     | string               | Category name
amount    | true     | int                  | Expense amount

### Response

#### Success

Key                | Type                      | Enums | Description
------------------ | ------------------------- | ----- | -----------
category           | Store                     |       | Store object
amount             | int                       |       | Expense amount
search_result_type | int                       | `1`: Has result </br> `3`: No results    | The search result type
results            | []OfferSearchResultDetail |       | Offer search result when `search_result_type=1`

*OfferSearchResultDetail*

Key                 | Type                    | Enums | Description
------------------- | ----------------------- | ----- | -----------
result_type         | int                     | `1`: MobilePay Only </br> `2`: Card Only </br> `3`: Card with MobilePay/ETicket | Result payment type
special_condition   | bool                    |       | Is special condition
mobilepay           | MobilePay               |       | Mobeile pay for `result_type=1`
card                | UserCard                |       | User card for `result_type=2` and `result_type=3`
mobilepays          | []MobilePay             |       | Mobile pays used with card for `result_type=3`
eticket             | ETicket                 |       | The eticket used with the card for  `result_type=3`
cashback_value      | CashbackValue           |       | Cashback value for `user_type=3`
cashback_percentage | RewardDetail            |       | Cashback percentage info
cashback_fixed      | RewardDetail            |       | Cashback fixed info
offers              | []OfferResult           |       | All offers
conditions          | []SearchResultCondition |       | Array of conditions

*CashbackValue*

Key            | Type           | Description
-------------- | -------------- | -----------
cashback_value | float          | Reward value
cashback_coins | []CashbackCoin | Coin info of the cashback

*RewardDetail*

Key            | Type           | Description
-------------- | -------------- | -----------
max_expense    | int            | Max expense for the reward
max_cashback   | float          | Max cashback percentage/fixed value
cashback_coins | []CashbackCoin | Coin info of the cashback
offers         | []OfferResult  | All offers match the result

*SearchResultCondition*

Key            | Type   | Enums | Description
-------------- |------- | ----- | -----------
condition_type | int    | `1`: 一般條件 </br> `2`: 登錄 </br> `3`: 優惠碼 </br> `4`: 專屬連結 </br> `5`: 最低消費條件(特殊) | Conditiogn type
name           | string |       | Condition description
url            | string |       | Condition URL

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Search accounting offers

> Search accounting offers

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v6/offers/formal/search/accounting \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "store": "711",
    "amount": 100,
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
    "date": 1617601542000
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/offers/formal/search/accounting'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
    "store": "711",
    "amount": 100,
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
    "date": 1617601542000
  }
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
    store: "711",
    amount: 100,
    card_id: "5f9a747p00c2abf3d4a54d4q",
    mobilepay_id: "5f9a747p00c2abf3d4a54d4q",
    date: 1617601542000
  }
axios.post('https://api.cardbo.info/api/v6/offers/formal/search/accounting', data, {
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
    "user_type": 3,
    "store": {
      "store": "...",
    },
    "amount": 100,
    "search_result_type": 1,
    "results": [
      {
        "result_type": 1,
        "special_condition": false,
        "card": {
          "card_id": "5f9a747p00c2abf3d4a54d4q",
          "name": "信用卡",
          "bank": {
            "{bank_info}": "...",
          },
          "level": 1,
          "image": "https://image.png",
          "issuer": "VISA",
          "payment_date": 0,
          "card_last_no": "",
          "reward_day": 0,
          "has_questionnaire": true,
          "questionnaire_completed": false,
          "enable_reward": false
        },
        "mobilepay": {
          "{mobilepay_info}": "..."
        },
        "mobilepays": [
          {
            "{mobilepay_info}": "..."
          }
        ],
        "cashback_value": {
          "cashback_value": 500,
          "cashback_coins": [
            {
              "reward_name": "Line Points",
              "image": "https://image.png"
            }
          ]
        },
        "cashback_percentage": {
          "max_expense": 200,
          "max_cashback": 18,
          "cashback_coins": [
            {
              "reward_name": "Line Points",
              "image": "https://image.png"
            }
          ],
          "offers": [
            {
              "offer_id": "5f9a747p00c2abf3d4a54d4q",
              "options": [],
              "end_date": 1617601542000,
              "pre_conditions": [
                "綁定 Line 帳號"
              ],
              "post_conditions": null,
              "register_url": "",
              "coupon_code": "",
              "discount_url": "",
              "upper_bounds": [
                {
                  "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
                  "cash_upper_bound": 200,
                  "frequency_upper_bound": 3,
                  "upper_bound_period": 5,
                  "store_independent": false,
                  "sharing_upper_bounds": [
                    "5f9a747p00c2abf3d4a54d4q"
                  ]
                }
              ],
              "reward_type": 1,
              "max_reward_content": {
                "mincost_period_times": 0,
                "mincost_period": 0,
                "excluded_places": [],
                "mincost_value": 0,
                "reward_name": "Line Points",
                "reward_value": 15,
                "coin_image": "https://image.png"
              },
              "reward_contents": [
                {
                  "mincost_period_times": 0,
                  "mincost_period": 0,
                  "excluded_places": [],
                  "mincost_value": 0,
                  "reward_name": "Line Points",
                  "reward_value": 15,
                  "coin_image": "https://image.png"
                }
              ],
              "selected": true
            }
          ]
        },
        "cashback_fixed": {
          "max_expense": 0,
          "max_cashback": 0,
          "cashback_coins": [],
          "offers": []
        },
        "offers": [
          {
            "offer_id": "5f9a747p00c2abf3d4a54d4q",
            "options": [],
            "end_date": 1617601542000,
            "pre_conditions": [
              "綁定 Line 帳號"
            ],
            "post_conditions": null,
            "register_url": "",
            "coupon_code": "",
            "discount_url": "",
            "upper_bounds": [
              {
                "upperbound_id": "5f9a747p00c2abf3d4a54d4q",
                "cash_upper_bound": 200,
                "frequency_upper_bound": 3,
                "upper_bound_period": 5,
                "store_independent": false,
                "sharing_upper_bounds": [
                  "5f9a747p00c2abf3d4a54d4q"
                ]
              }
            ],
            "reward_type": 1,
            "max_reward_content": {
              "mincost_period_times": 0,
              "mincost_period": 0,
              "excluded_places": [],
              "mincost_value": 0,
              "reward_name": "Line Points",
              "reward_value": 15,
              "coin_image": "https://image.png"
            },
            "reward_contents": [
              {
                "mincost_period_times": 0,
                "mincost_period": 0,
                "excluded_places": [],
                "mincost_value": 0,
                "reward_name": "Line Points",
                "reward_value": 15,
                "coin_image": "https://image.png"
              }
            ],
            "selected": true
          }
        ],
        "conditions": [
          {
            "condition_type": 1,
            "name": "綁定 Line 帳號",
            "url": ""
          }
        ]
      }
    ],
  },
  "timestamp": 1617601542000
}
```

Search accounting offers

### HTTP Request

`POST https://api.cardbo.info/api/v6/offers/formal/search/accounting`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter    | Required | Type   | Description
------------ | -------- | ------ | -----------
store        | true     | string | Store name
amount       | true     | int    | Expense amount
card_id      | true     | string | Card ID to use
mobilepay_id | false    | string | Mobile pay ID to use
date         | true     | int    | Date of the record in timestamp

### Response

#### Success

<aside class="notice">
When <code>search_result_type=1</code>, <code>results</code> has value; when <code>search_result_type=2</code>, <code>post_condition</code> has value; when <code>search_result_type=3</code>, <code>categories</code> has value. If API returns <code>search_result_type=2</code>, need to provide <code>post_condition</code> which meet user's condtion and call API again.
</aside>

Key                | Type                      | Enums | Description
------------------ | ------------------------- | ----- | -----------
store              | Store                     |       | Store object
amount             | int                       |       | Expense amount
search_result_type | int                       | `1`: Has result </br> `3`: No results    | The search result type
results            | []OfferSearchResultDetail |       | Offer search result when `search_result_type=1`

*OfferSearchResultDetail*

Key                 | Type                    | Enums | Description
------------------- | ----------------------- | ----- | -----------
result_type         | int                     | `1`: MobilePay Only </br> `2`: Card Only </br> `3`: Card with MobilePay/ETicket | Result payment type
special_condition   | bool                    |       | Is special condition
mobilepay           | MobilePay               |       | Mobeile pay for `result_type=1`
card                | UserCard                |       | User card for `result_type=2` and `result_type=3`
mobilepays          | []MobilePay             |       | Mobile pays used with card for `result_type=3`
eticket             | ETicket                 |       | The eticket used with the card for  `result_type=3`
cashback_value      | CashbackValue           |       | Cashback value for `user_type=3`
cashback_percentage | RewardDetail            |       | Cashback percentage info
cashback_fixed      | RewardDetail            |       | Cashback fixed info
offers              | []OfferResult           |       | All offers
conditions          | []SearchResultCondition |       | Array of conditions

*CashbackValue*

Key            | Type           | Description
-------------- | -------------- | -----------
cashback_value | float          | Reward value
cashback_coins | []CashbackCoin | Coin info of the cashback

*RewardDetail*

Key            | Type           | Description
-------------- | -------------- | -----------
max_expense    | int            | Max expense for the reward
max_cashback   | float          | Max cashback percentage/fixed value
cashback_coins | []CashbackCoin | Coin info of the cashback
offers         | []OfferResult  | All offers match the result

*SearchResultCondition*

Key            | Type   | Enums | Description
-------------- |------- | ----- | -----------
condition_type | int    | `1`: 一般條件 </br> `2`: 登錄 </br> `3`: 優惠碼 </br> `4`: 專屬連結 </br> `5`: 最低消費條件(特殊) | Conditiogn type
name           | string |       | Condition description
url            | string |       | Condition URL

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# ◉ Store

## • Insert pending store (TODO)

## • Get pending store by store_id (TODO)

## • Update pending store (TODO)

## • Pass pending store to formal (TODO)

## • Fail pending store (TODO)

## • Add pending store combo options (TODO)

## • Remove pending store combo options (TODO)

## • Delete pending store (TODO)

## • Get pending stores (TODO)

## • Get formal store by store_id (TODO)

## • Update formal store (TODO)

## • Add formal store combo options (TODO)

## • Remove formal store combo options (TODO)

## • Get formal stores (TODO)

## • Search stores by keyword

> Search stores by keyword:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/stores/formal/search?keyword=pc \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/stores/formal/search?keyword=pc'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.delete(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.delete('https://api.cardbo.info/api/v6/stores/formal/search?keyword=pc', {
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
      "store_id": "5f9a747p00c2abf3d4a54d4q",
      "name": "BeingFit",
      "alias": [
        "Being Fit"
      ]
    }
  ],
  "timestamp": 1617601542000
}
```

Search stores by keyword

### HTTP Request

`GET https://api.cardbo.info/api/v6/stores/formal/search`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Queries

Query   | Required | Muti-values | Description
------- | -------- | ----------- | -----------
keyword | true     | false       | keyword

### Response

#### Success

Key      | Type     | Description
-------- | -------- | -----------
store_id | string   | store id
name     | string   | store name
alias    | []string | store alias

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# ◉ Tag

## • Get tags

> Get tags:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/tags?type=1 \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/tags?type=1'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/tags?type=2', {
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
      "tag_id": "5f9a747p00c2abf3d4a54d4q",
      "name": "tagname",
      "description": "tag description",
      "tag_type": 2
    }
  ],
  "timestamp": 1617601542000
}
```

Get pending offers

### HTTP Request

`GET https://api.cardbo.info/api/v6/tags`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Queries

Query | Required | Muti-values | Enums                                                 | Description
----- | -------- | ----------- | ----------------------------------------------------- | -----------
type  | false    | false       | `0`: All Type </br> `1`: General </br> `2`: MobilePay | The type of the tag

### Response

#### Success

*Tag*

Parameter   | Type   | Enums | Description
----------- | ------ | ----- | -----------
tag_id      | string |       | Tag ID
name        | string |       | Tag name
description | string |       | Tag description
tag_type    | int    | `1`: MobilePay </br> `2`: General | Tag type

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# ◉ ErrorReport

## • Insert error report

> Insert an error report:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v6/error_report \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "accounting_id": "5f9a747p00c2abf3d4a54d4q",
    "store_id": "5f9a747p00c2abf3d4a54d4q",
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
    "content": "error..."
    "report_type": 2,
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/error_report'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "accounting_id": "5f9a747p00c2abf3d4a54d4q",
  "store_id": "5f9a747p00c2abf3d4a54d4q",
  "card_id": "5f9a747p00c2abf3d4a54d4q",
  "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
  "content": "error..."
  "report_type": 2,
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  accounting_id: "5f9a747p00c2abf3d4a54d4q",
  store_id: "5f9a747p00c2abf3d4a54d4q",
  card_id: "5f9a747p00c2abf3d4a54d4q",
  mobilepay_id: "5f9a747p00c2abf3d4a54d4q",
  content: "error..."
  report_type: 2,
}
axios.post('https://api.cardbo.info/api/v6/error_report', data, {
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
  "code": 201,
  "message": "Ok",
  "result": {
    "report_id": "5f9a747p00c2abf3d4a54d4q",
    "report_type": 1,
    "user": {
      "user_info": "..."
    },
    "accounting_record": {
      "accounting_info": "..."
    },
    "card": {
      "card_info": "..."
    },
    "mobilepay": {
      "mobilepay_info": "..."
    },
    "store": {
      "store_info": "..."
    },
    "store_name": "",
    "offer_ids": [
      "5f9a747p00c2abf3d4a54d4q"
    ],
    "url_error": false,
    "content": "error",
    "status": 1,
    "created_at": 1617601542000,
    "updated_at": 0,
    "fixed_at": 0,
    "notified_at": 0
  },
  "timestamp": 1617601542000
}
```

Insert an error report

### HTTP Request

`POST https://api.cardbo.info/api/v6/error_report`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter          | Required  | Type     | Enums | Description
------------------ | --------- | -------- | ----- | -----------
report_type        | true      | int      | OFFER_DETAIL: `1` <br/> CARD_REWARD: `2` <br/> ACCOUNTING: `3` | report type
accounting_id      | false     | string   |       | accounting record ID
card_id            | false(*1) | string   |       | card ID
mobilepay_id       | false(*1) | string   |       | mobile pay ID
store_id           | false(*2) | string   |       | store ID
store_name         | false(*2) | int      |       | store name when the store is not in our DB
offer_ids          | false     | string   |       | offer ID array
new_user_offer_ids | false     | string   |       | new user offer ID array
url_error          | false     | bool     |       | is the offer URL error
content            | false     | string   |       | report content

<aside class="notice">
*1: one of <code>card_id</code> and <code>mobilepay_id</code> is required when report_type is <code>1</code> <br/>
*2: one of <code>store_id</code> and <code>store_name</code> is required when report_type is <code>1</code> and <code>3</code>
</aside>

### Response

#### Success

Key                | Type             | Enums | Description
------------------ | ---------------- | ----- | -----------
report_id          | string           |       | report id
report_type        | int              | OFFER_DETAIL: `1` <br/> CARD_REWARD: `2` <br/> ACCOUNTING: `3` | report type
user               | User             |       | User Object
accounting_record  | AccountingRecord |       | AccountingRecord object
card               | Card             |       | Card object
mobilepay          | MobilePay        |       | MobilePay object
store              | Store            |       | Store object
store_name         | string           |       | store name when store is not in our DB
offer_ids          | []string         |       | offer id array
new_user_offer_ids | []string         |       | new user offer id array
url_error          | bool             |       | is the offer URL error
content            | string           |       | report content
note               | string           |       | error handling note
status             | int              | PENDING: `1` <br/> WAITING_NOTIFY: `2` <br/> FINISHED: `3` | the handling status of the report
created_at         | int              |       | create time in timestamp
updated_at         | int              |       | update time in timestamp
fixed_at           | int              |       | fixing time in timestamp
notified_at        | int              |       | notification time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get error reports

> Get error reports:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/error_reports?report_type=1 \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/error_reports?report_type=1'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/error_reports?report_type=1', {
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
      "report_id": "5f9a747p00c2abf3d4a54d4q",
      "report_type": 1,
      "user": {
        "user_info": "..."
      },
      "accounting_record": {
        "accounting_info": "..."
      },
      "card": {
        "card_info": "..."
      },
      "mobilepay": {
        "mobilepay_info": "..."
      },
      "store": {
        "store_info": "..."
      },
      "store_name": "",
      "offer_ids": [
        "5f9a747p00c2abf3d4a54d4q"
      ],
      "url_error": false,
      "content": "error",
      "status": 1,
      "created_at": 1617601542000,
      "updated_at": 0,
      "fixed_at": 0,
      "notified_at": 0
    }
  ],
  "timestamp": 1617601542000
}
```

Get error reports

### HTTP Request

`GET https://api.cardbo.info/api/v6/error_reports?report_type=1`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Queries

Query       | Required | Muti-values | Enums | Description
----------- | -------- | ----------- | ----- | -----------
report_type | true     | false       | OFFER_DETAIL: `1` <br/> CARD_REWARD: `2` <br/> ACCOUNTING: `3` | report type

### Response

#### Success

Key                | Type             | Enums | Description
------------------ | ---------------- | ----- | -----------
report_id          | string           |       | report id
report_type        | int              | OFFER_DETAIL: `1` <br/> CARD_REWARD: `2` <br/> ACCOUNTING: `3` | report type
user               | User             |       | User Object
accounting_record  | AccountingRecord |       | AccountingRecord object
card               | Card             |       | Card object
mobilepay          | MobilePay        |       | MobilePay object
store              | Store            |       | Store object
store_name         | string           |       | store name when store is not in our DB
offer_ids          | []string         |       | offer id array
new_user_offer_ids | []string         |       | new user offer id array
url_error          | bool             |       | is the offer URL error
content            | string           |       | report content
note               | string           |       | error handling note
status             | int              | PENDING: `1` <br/> WAITING_NOTIFY: `2` <br/> FINISHED: `3` | the handling status of the report
created_at         | int              |       | create time in timestamp
updated_at         | int              |       | update time in timestamp
fixed_at           | int              |       | fixing time in timestamp
notified_at        | int              |       | notification time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get error report by report_id

> Get error report by report_id:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/error_report/5f9a747p00c2abf3d4a54d4q \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/error_report/5f9a747p00c2abf3d4a54d4q'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/error_report/5f9a747p00c2abf3d4a54d4q', {
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
    "report_id": "5f9a747p00c2abf3d4a54d4q",
    "report_type": 1,
    "user": {
      "user_info": "..."
    },
    "accounting_record": {
      "accounting_info": "..."
    },
    "card": {
      "card_info": "..."
    },
    "mobilepay": {
      "mobilepay_info": "..."
    },
    "store": {
      "store_info": "..."
    },
    "store_name": "",
    "offer_ids": [
      "5f9a747p00c2abf3d4a54d4q"
    ],
    "url_error": false,
    "content": "error",
    "status": 1,
    "created_at": 1617601542000,
    "updated_at": 0,
    "fixed_at": 0,
    "notified_at": 0
  },
  "timestamp": 1617601542000
}
```

Get error report by report_id

### HTTP Request

`GET https://api.cardbo.info/api/v6/error_report/5f9a747p00c2abf3d4a54d4q`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
report_id | report id

### Response

#### Success

Key                | Type             | Enums | Description
------------------ | ---------------- | ----- | -----------
report_id          | string           |       | report id
report_type        | int              | OFFER_DETAIL: `1` <br/> CARD_REWARD: `2` <br/> ACCOUNTING: `3` | report type
user               | User             |       | User Object
accounting_record  | AccountingRecord |       | AccountingRecord object
card               | Card             |       | Card object
mobilepay          | MobilePay        |       | MobilePay object
store              | Store            |       | Store object
store_name         | string           |       | store name when store is not in our DB
offer_ids          | []string         |       | offer id array
new_user_offer_ids | []string         |       | new user offer id array
url_error          | bool             |       | is the offer URL error
content            | string           |       | report content
note               | string           |       | error handling note
status             | int              | PENDING: `1` <br/> WAITING_NOTIFY: `2` <br/> FINISHED: `3` | the handling status of the report
created_at         | int              |       | create time in timestamp
updated_at         | int              |       | update time in timestamp
fixed_at           | int              |       | fixing time in timestamp
notified_at        | int              |       | notification time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Make report status to FIXED

> Make report status to FIXED:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/error_report/5f9a747p00c2abf3d4a54d4q/fixed \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json'
  --data '{
    "note": "the note content..."
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/error_report/5f9a747p00c2abf3d4a54d4q/fixed'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "note": "the note content..."
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  note: "the note content...",
}
axios.put('https://api.cardbo.info/api/v6/error_report/5f9a747p00c2abf3d4a54d4q/fixed', data, {
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
    "report_id": "5f9a747p00c2abf3d4a54d4q",
    "report_type": 1,
    "user": {
      "user_info": "..."
    },
    "accounting_record": {
      "accounting_info": "..."
    },
    "card": {
      "card_info": "..."
    },
    "mobilepay": {
      "mobilepay_info": "..."
    },
    "store": {
      "store_info": "..."
    },
    "store_name": "",
    "offer_ids": [
      "5f9a747p00c2abf3d4a54d4q"
    ],
    "url_error": false,
    "content": "error",
    "status": 1,
    "created_at": 1617601542000,
    "updated_at": 0,
    "fixed_at": 0,
    "notified_at": 0
  },
  "timestamp": 1617601542000
}
```

Make report status to FIXED

### HTTP Request

`PUT https://api.cardbo.info/api/v6/error_report/5f9a747p00c2abf3d4a54d4q/fixed`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter | Required  | Type     | Description
--------- | --------- | -------- | -----------
note      | false     | string   | The note for the error report

### Response

#### Success

Key                | Type             | Enums | Description
------------------ | ---------------- | ----- | -----------
report_id          | string           |       | report id
report_type        | int              | OFFER_DETAIL: `1` <br/> CARD_REWARD: `2` <br/> ACCOUNTING: `3` | report type
user               | User             |       | User Object
accounting_record  | AccountingRecord |       | AccountingRecord object
card               | Card             |       | Card object
mobilepay          | MobilePay        |       | MobilePay object
store              | Store            |       | Store object
store_name         | string           |       | store name when store is not in our DB
offer_ids          | []string         |       | offer id array
new_user_offer_ids | []string         |       | new user offer id array
url_error          | bool             |       | is the offer URL error
content            | string           |       | report content
note               | string           |       | error handling note
status             | int              | PENDING: `1` <br/> WAITING_NOTIFY: `2` <br/> FINISHED: `3` | the handling status of the report
created_at         | int              |       | create time in timestamp
updated_at         | int              |       | update time in timestamp
fixed_at           | int              |       | fixing time in timestamp
notified_at        | int              |       | notification time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Make report status to NOTIFIED

> Make report status to NOTIFIED:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/error_report/5f9a747p00c2abf3d4a54d4q/notified \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/error_report/5f9a747p00c2abf3d4a54d4q/notified'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.put(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.put('https://api.cardbo.info/api/v6/error_report/5f9a747p00c2abf3d4a54d4q/notified', {
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
    "report_id": "5f9a747p00c2abf3d4a54d4q",
    "report_type": 1,
    "user": {
      "user_info": "..."
    },
    "accounting_record": {
      "accounting_info": "..."
    },
    "card": {
      "card_info": "..."
    },
    "mobilepay": {
      "mobilepay_info": "..."
    },
    "store": {
      "store_info": "..."
    },
    "store_name": "",
    "offer_ids": [
      "5f9a747p00c2abf3d4a54d4q"
    ],
    "url_error": false,
    "content": "error",
    "status": 1,
    "created_at": 1617601542000,
    "updated_at": 0,
    "fixed_at": 0,
    "notified_at": 0
  },
  "timestamp": 1617601542000
}
```

Make report status to NOTIFIED

### HTTP Request

`PUT https://api.cardbo.info/api/v6/error_report/5f9a747p00c2abf3d4a54d4q/notified`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key                | Type             | Enums | Description
------------------ | ---------------- | ----- | -----------
report_id          | string           |       | report id
report_type        | int              | OFFER_DETAIL: `1` <br/> CARD_REWARD: `2` <br/> ACCOUNTING: `3` | report type
user               | User             |       | User Object
accounting_record  | AccountingRecord |       | AccountingRecord object
card               | Card             |       | Card object
mobilepay          | MobilePay        |       | MobilePay object
store              | Store            |       | Store object
store_name         | string           |       | store name when store is not in our DB
offer_ids          | []string         |       | offer id array
new_user_offer_ids | []string         |       | new user offer id array
url_error          | bool             |       | is the offer URL error
content            | string           |       | report content
note               | string           |       | error handling note
status             | int              | PENDING: `1` <br/> WAITING_NOTIFY: `2` <br/> FINISHED: `3` | the handling status of the report
created_at         | int              |       | create time in timestamp
updated_at         | int              |       | update time in timestamp
fixed_at           | int              |       | fixing time in timestamp
notified_at        | int              |       | notification time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# ◉ AccountingRecord

## • Insert an accounting record without invoice

> Insert an accounting record without invoice:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v6/accounting \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
    "amount": 1000,
    "name": "午餐",
    "store_id": "5f9a747p00c2abf3d4a54d4q",
    "rewards": [
      "offer_id": "5f9a747p00c2abf3d4a54d4q"
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
  "card_id": "5f9a747p00c2abf3d4a54d4q",
  "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
  "amount": 1000,
  "name": "午餐",
  "store_id": "5f9a747p00c2abf3d4a54d4q",
  "rewards": [
    "offer_id": "5f9a747p00c2abf3d4a54d4q"
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
  card_id: "5f9a747p00c2abf3d4a54d4q",
  mobilepay_id: "5f9a747p00c2abf3d4a54d4q",
  amount: 1000,
  name: "午餐",
  store_id: "5f9a747p00c2abf3d4a54d4q",
  rewards: [
    "5f9a747p00c2abf3d4a54d4q"
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
  "code": 201,
  "message": "Ok",
  "result": {
    "_id": "5f9a747p00c2abf3d4a54d4q",
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
        "offer_id": "5f9a747p00c2abf3d4a54d4q",
        "reward_name": "現金",
        "reward_value": 28.83
      }
    ]
  },
  "timestamp": 1617601542000
}
```

Insert an accounting record without invoice

### HTTP Request

`POST https://api.cardbo.info/api/v6/accounting`

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
date          | true      | int      | the datetime of the expense in timestamp
rewards       | false     | []string | array of offer id that can get from the expense
completed     | true      | bool     | is the record completed

*1: one of `store_id` and `store_name` is required

### Response

#### Success

Key           | Type               | Enums | Description
------------- | ------------------ | ----- | -----------
accounting_id | string             |       | accotungin id
user          | User               |       | User object
card          | Card               |       | Card object
mobilepay     | MobilePay          |       | MobilePay object
invoice       | Invoice            |       | Invoice object
amount        | int                |       | how much money of the record
name          | string             |       | description of the record
store         | Store              |       | Store object
store_name    | string             |       | store name when the store is not in our database
date          | int                |       | date of the expese in timestamp
rewards       | []AccountingReward |       | array of AccountingReward object
invoice_type  | int                | QRCode: `1` <br/> Carrier: `2` <br/> NoInvoice: `3` | invoice tpye of the record
pending       | string             |       | is the record in pending or not
created_at    | int                |       | create time in timestamp
updated_at    | int                |       | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Insert an accounting record with QR code invoice

> Insert an accounting record with QR code invoice:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v6/accounting/qr_code \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
    "amount": 1000,
    "name": "午餐",
    "store_id": "5f9a747p00c2abf3d4a54d4q",
    "qr_code_left": "INVOICE_QR_CODE_LEFT",
    "qr_code_right": "INVOICE_QR_CODE_RIGHT",
    "rewards": [
      "offer_id": "5f9a747p00c2abf3d4a54d4q"
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
  "card_id": "5f9a747p00c2abf3d4a54d4q",
  "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
  "amount": 1000,
  "name": "午餐",
  "store_id": "5f9a747p00c2abf3d4a54d4q",
  "qr_code_left": "INVOICE_QR_CODE_LEFT",
  "qr_code_right": "INVOICE_QR_CODE_RIGHT",
  "rewards": [
    "offer_id": "5f9a747p00c2abf3d4a54d4q"
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
  card_id: "5f9a747p00c2abf3d4a54d4q",
  mobilepay_id: "5f9a747p00c2abf3d4a54d4q",
  amount: 1000,
  name: "午餐",
  store_id: "5f9a747p00c2abf3d4a54d4q",
  qr_code_left: "INVOICE_QR_CODE_LEFT",
  qr_code_right: "INVOICE_QR_CODE_RIGHT",
  rewards: [
    "5f9a747p00c2abf3d4a54d4q"
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
  "code": 201,
  "message": "Ok",
  "result": {
    "accounting_id": "5f9a747p00c2abf3d4a54d4q",
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
        "offer_id": "5f9a747p00c2abf3d4a54d4q",
        "reward_name": "現金",
        "reward_value": 28.83
      }
    ]
  },
  "timestamp": 1617601542000
}
```

Insert an accounting record with QR code invoice

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

Key           | Type               | Enums | Description
------------- | ------------------ | ----- | -----------
accounting_id | string             |       | accotungin id
user          | User               |       | User object
card          | Card               |       | Card object
mobilepay     | MobilePay          |       | MobilePay object
invoice       | Invoice            |       | Invoice object
amount        | int                |       | how much money of the record
name          | string             |       | description of the record
store         | Store              |       | Store object
store_name    | string             |       | store name when the store is not in our database
date          | int                |       | date of the expese in timestamp
rewards       | []AccountingReward |       | array of AccountingReward object
invoice_type  | int                | QRCode: `1` <br/> Carrier: `2` <br/> NoInvoice: `3` | invoice tpye of the record
pending       | string             |       | is the record in pending or not
created_at    | int                |       | create time in timestamp
updated_at    | int                |       | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Insert an accounting record with carrier invoice

> Insert an accounting record with carrier invoice:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v6/accounting/qr_code \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
    "amount": 1000,
    "name": "午餐",
    "store_id": "5f9a747p00c2abf3d4a54d4q",
    "invoice_id": "5f9a747p00c2abf3d4a54d4q",
    "rewards": [
      "offer_id": "5f9a747p00c2abf3d4a54d4q"
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
  "card_id": "5f9a747p00c2abf3d4a54d4q",
  "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
  "amount": 1000,
  "name": "午餐",
  "store_id": "5f9a747p00c2abf3d4a54d4q",
  "invoice_id": "5f9a747p00c2abf3d4a54d4q",
  "rewards": [
    "offer_id": "5f9a747p00c2abf3d4a54d4q"
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
  card_id: "5f9a747p00c2abf3d4a54d4q",
  mobilepay_id: "5f9a747p00c2abf3d4a54d4q",
  amount: 1000,
  name: "午餐",
  store_id: "5f9a747p00c2abf3d4a54d4q",
  invoice_id: "5f9a747p00c2abf3d4a54d4q",
  rewards: [
    "5f9a747p00c2abf3d4a54d4q"
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
  "code": 201,
  "message": "Ok",
  "result": {
    "accounting_id": "5f9a747p00c2abf3d4a54d4q",
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
        "offer_id": "5f9a747p00c2abf3d4a54d4q",
        "reward_name": "現金",
        "reward_value": 28.83
      }
    ]
  },
  "timestamp": 1617601542000
}
```

Insert an accounting record with carrier invoice

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

Key           | Type               | Enums | Description
------------- | ------------------ | ----- | -----------
accounting_id | string             |       | accotungin id
user          | User               |       | User object
card          | Card               |       | Card object
mobilepay     | MobilePay          |       | MobilePay object
invoice       | Invoice            |       | Invoice object
amount        | int                |       | how much money of the record
name          | string             |       | description of the record
store         | Store              |       | Store object
store_name    | string             |       | store name when the store is not in our database
date          | int                |       | date of the expese in timestamp
rewards       | []AccountingReward |       | array of AccountingReward object
invoice_type  | int                | QRCode: `1` <br/> Carrier: `2` <br/> NoInvoice: `3` | invoice tpye of the record
pending       | string             |       | is the record in pending or not
created_at    | int                |       | create time in timestamp
updated_at    | int                |       | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Update accounting record

> Update administrator profile:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/accounting/5f9a747p00c2abf3d4a54d4q \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card_id": "5f9a747p00c2abf3d4a54d4q",
    "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
    "amount": 100,
    "name": "sample_expense",
    "store_id": "5f9a747p00c2abf3d4a54d4q",
    "date": 1617601542000,
    "qr_code_right": "INVOICE_QR_CODE_RIGHT",
    "qr_code_left": "INVOICE_QR_CODE_LEFT",
    "rewards": [
      "5f9a747p00c2abf3d4a54d4q"
    ]
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/accounting/5f9a747p00c2abf3d4a54d4q'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "card_id": "5f9a747p00c2abf3d4a54d4q",
  "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
  "amount": 100,
  "name": "sample_expense",
  "store_id": "5f9a747p00c2abf3d4a54d4q",
  "date": 1617601542000,
  "qr_code_right": "INVOICE_QR_CODE_RIGHT",
  "qr_code_left": "INVOICE_QR_CODE_LEFT",
  "rewards": [
    "5f9a747p00c2abf3d4a54d4q"
  ]
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  card_id: "5f9a747p00c2abf3d4a54d4q",
  mobilepay_id: "5f9a747p00c2abf3d4a54d4q",
  amount: 100,
  name: "sample_expense",
  store_id: "5f9a747p00c2abf3d4a54d4q",
  date: 1617601542000,
  qr_code_right: "INVOICE_QR_CODE_RIGHT",
  qr_code_left: "INVOICE_QR_CODE_LEFT",
  rewards: [
    "5f9a747p00c2abf3d4a54d4q"
  ]
}
axios.put('https://api.cardbo.info/api/v6/accounting/5f9a747p00c2abf3d4a54d4q', data, {
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
  "_id": "5f9a747p00c2abf3d4a54d4q",
  "user": {
    "user_info": "..."
  },
  "card": {
    "card_info": "...",
  },
  "mobilepay": {
    "mobilepay_info": "...",
  },
  "amount": 100,
  "name": "sample_expense",
  "store": {
    "store_info": "...",
  },
  "store_name": "",
  "invoice": "AB99999999",
  "date": 1617601542000,
  "rewards": [
    {
      "offer_id": "5f9a747p00c2abf3d4a54d4q",
      "reward_name": "現金",
      "reward_value": 28.83
    }
  ]
}
```

Update a accounting record

### HTTP Request

`PUT https://api.cardbo.info/api/v6/accounting/{accounting_id}`

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

Parameter     | Required  | Type     | Description
------------- | --------- | -------- | -----------
card_id       | false(*1) | string   | card id
mobilepay_id  | false(*1) | string   | mobilepay id
amount        | true      | string   | amount of the expense
store_id      | false(*2) | string   | store id
store_name    | false(*2) | string   | stroe name if the stroe is not in our database
date          | true      | int      | date of the expense in timestamp
qr_code_right | false     | string   | right part of the invoice QR Code when updating QR Code invoice record
qr_code_left  | false     | string   | left part of the invoice QR Code when updating QR Code invoice record
invoice_id    | false     | string   | invoice id when updating carrier invoice record
rewards       | false(*3) | []string | array of offer id that can get from the expense
completed     | false     | bool     | is the record completed

*1: Must set at least one of `card_id` and `mobilepay_id`
*2: Must set one of `store_id` and `store_name`
*3: if `card_id` is set, `rewards` is required

### Response

#### Success

Key           | Type               | Enums | Description
------------- | ------------------ | ----- | -----------
accounting_id | string             |       | accotungin id
user          | User               |       | User object
card          | Card               |       | Card object
mobilepay     | MobilePay          |       | MobilePay object
invoice       | Invoice            |       | Invoice object
amount        | int                |       | how much money of the record
name          | string             |       | description of the record
store         | Store              |       | Store object
store_name    | string             |       | store name when the store is not in our database
date          | int                |       | date of the expese in timestamp
rewards       | []AccountingReward |       | array of AccountingReward object
invoice_type  | int                | QRCode: `1` <br/> Carrier: `2` <br/> NoInvoice: `3` | invoice tpye of the record
pending       | string             |       | is the record in pending or not
created_at    | int                |       | create time in timestamp
updated_at    | int                |       | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get pending accounting records

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
      "_id": "5f9a747p00c2abf3d4a54d4q",
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
          "offer_id": "5f9a747p00c2abf3d4a54d4q",
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

### HTTP Request

`GET https://api.cardbo.info/api/v6/accountings/pending`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key           | Type               | Enums | Description
------------- | ------------------ | ----- | -----------
accounting_id | string             |       | accotungin id
user          | User               |       | User object
card          | Card               |       | Card object
mobilepay     | MobilePay          |       | MobilePay object
invoice       | Invoice            |       | Invoice object
amount        | int                |       | how much money of the record
name          | string             |       | description of the record
store         | Store              |       | Store object
store_name    | string             |       | store name when the store is not in our database
date          | int                |       | date of the expese in timestamp
rewards       | []AccountingReward |       | array of AccountingReward object
invoice_type  | int                | QRCode: `1` <br/> Carrier: `2` <br/> NoInvoice: `3` | invoice tpye of the record
pending       | string             |       | is the record in pending or not
created_at    | int                |       | create time in timestamp
updated_at    | int                |       | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get accounting record by accounting_id

> Get accounting record by accounting_id:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/accounting/{accounting_id} \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/accounting/{accounting_id}'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/accounting/{accounting_id}', {
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
    "_id": "5f9a747p00c2abf3d4a54d4q",
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
        "offer_id": "5f9a747p00c2abf3d4a54d4q",
        "reward_name": "現金",
        "reward_value": 28.83
      }
    ]
  },
  "timestamp": 1617601542000
}
```

Get accounting record by accounting_id

### HTTP Request

`GET https://api.cardbo.info/api/v6/accounting/{accounting_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter     | Description
------------- | -----------
accounting_id | accounting id

### Response

#### Success

Key           | Type               | Enums | Description
------------- | ------------------ | ----- | -----------
accounting_id | string             |       | accotungin id
user          | User               |       | User object
card          | Card               |       | Card object
mobilepay     | MobilePay          |       | MobilePay object
invoice       | Invoice            |       | Invoice object
amount        | int                |       | how much money of the record
name          | string             |       | description of the record
store         | Store              |       | Store object
store_name    | string             |       | store name when the store is not in our database
date          | int                |       | date of the expese in timestamp
rewards       | []AccountingReward |       | array of AccountingReward object
invoice_type  | int                | QRCode: `1` <br/> Carrier: `2` <br/> NoInvoice: `3` | invoice tpye of the record
pending       | string             |       | is the record in pending or not
created_at    | int                |       | create time in timestamp
updated_at    | int                |       | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Delete an accounting record

> Delete an accounting record:

```shell
curl --request DELETE \
  --url https://api.cardbo.info/api/v6/accounting/{accounting_id} \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/accounting/{accounting_id}'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.delete(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.delete('https://api.cardbo.info/api/v6/accounting/{accounting_id}', {
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
    "_id": "5f9a747p00c2abf3d4a54d4q",
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
        "offer_id": "5f9a747p00c2abf3d4a54d4q",
        "reward_name": "現金",
        "reward_value": 28.83
      }
    ]
  },
  "timestamp": 1617601542000
}
```

Delete an accounting record

### HTTP Request

`DELETE https://api.cardbo.info/api/v6/accounting/{accounting_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter     | Description
------------- | -----------
accounting_id | accounting id

### Response

#### Success

Key           | Type               | Enums | Description
------------- | ------------------ | ----- | -----------
accounting_id | string             |       | accotungin id
user          | User               |       | User object
card          | Card               |       | Card object
mobilepay     | MobilePay          |       | MobilePay object
invoice       | Invoice            |       | Invoice object
amount        | int                |       | how much money of the record
name          | string             |       | description of the record
store         | Store              |       | Store object
store_name    | string             |       | store name when the store is not in our database
date          | int                |       | date of the expese in timestamp
rewards       | []AccountingReward |       | array of AccountingReward object
invoice_type  | int                | QRCode: `1` <br/> Carrier: `2` <br/> NoInvoice: `3` | invoice tpye of the record
pending       | string             |       | is the record in pending or not
created_at    | int                |       | create time in timestamp
updated_at    | int                |       | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get user's accounting summary

> Get user's accounting summary:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/accountings/summary \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/accountings/summary'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/accountings/summary', {
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
      "{user}": "..."
    },
    "month": 1,
    "total_expense": 1000,
    "total_reward": 100,
    "unrecorded_invoices": 10,
    "card_rewards": [
      {
        "card": {
          "{user_card}": "..."
        },
        "reward": {
          "reward_name": "Line Points",
          "multiple_reward": true,
          "coin_image": "https://image.png",
          "reward_value": 1,
          "reward_upper_bound": 100,
          "expense_upper_bound": 10000,
          "expense": 1000,
          "left_expense": 9000,
          "cashback": 10,
          "offer": {
            "{offer_reward}": "..."
          }
        }
      }
    ],
    "mobilepay_expenses": [
      {
        "mobilepay": {
          "{mobilepay}": "..."
        },
        "expense": 100
      }
    ],
    "total_records": 10
  },
  "timestamp": 1617601542000
}
```

Get user's accounting summary

### HTTP Request

`GET https://api.cardbo.info/api/v6/accountings/summary`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key                | Type             | Description
------------------ | ---------------- | -----------
user               | User             | User info
month              | int              | The month of the records
total_expense      | int              | monthly total expense
total_reward       | int              | monthly total reward
card_rewards       | CardReward       | The pinned reward info of all user's card
mobilepay_expenses | MobilePayExpense | The expense of all user's moblile pay
total_records      | int              | Total records of the user

*CardReward*

Key    | Type     | Description
------ | -------- | -----------
card   | UserCard | User's card info
reward | Reward   | The pinned reward of the card

*Reward*

Key                | Type        | Description
------------------ | ----------- | -----------
reward_name        | string      | Reward name (e.g. 現金, Line Points, 街口幣, Open Points, P幣, Hami Point, 代幣...)
multiple_reward    | bool        | Does the offer have multiple reward contents
cion_image         | string      | Coin image URL
reward_value       | float       | Reward value from the offer
reward_upperbound  | int         | Reward upper bound
expense_upperbound | int         | Expense upper bound
expense            | int         | Expense of the reward
left_expense       | int         | Left expense to get the max reward
cahsback           | float       | Cashbck user get fro m th reward
offer              | OfferResult | Offer info

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get card month accounting records and rewards

> Get month accounting records and rewards of a card:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/accountings/reward/5f9a747p00c2abf3d4a54d4q/2021/9 \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/accountings/reward/5f9a747p00c2abf3d4a54d4q/2021/9'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/accountings/reward/5f9a747p00c2abf3d4a54d4q/2021/9', {
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
  "result":  {
    "card": {
      "{user_card}": "..."
    },
    "expense": 100,
    "cashback": 10,
    "start_date": 1617601542000,
    "end_date": 1617601542000,
    "accounting_records": [
      {
        "{accounting_record}": "..." 
      }
    ],
    "rewards": [
      {
        "reward_name": "代幣",
        "multiple_reward": true,
        "coin_image": "",
        "reward_value": 3,
        "reward_upperbound": 0,
        "expense_upperbound": 0,
        "expense": 0,
        "left_expense": 0,
        "cashback": 0,
        "offer": {
          "{offer_result}": "..."
        }
      }
    ]
  },
  "timestamp": 1617601542000
}
```

Get month accounting records and rewards of a card

### HTTP Request

`GET https://api.cardbo.info/api/v6/accountings/reward/{card_id}/{year}/{month}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
card_id   | Card ID
year      | Year
month     | Month (If mont is `current`, respnse will depend on the card reward day)

### Response

#### Success

Key                | Type              | Description
------------------ | ----------------- | -----------
card               | UserCard          | Card info
expense            | int                | Expense from the card of a month
cahsback           | int                | Cashback from the card of a month
start_date         | int                | Month start date
end_date           | int                | Month end date
accounting_records | []AccountingRecord | All records from the card of a month (sorted by date)
rewards            | []Reward           | All rewards of the card (sorted by user's order)

*Reward*

Key                | Type        | Description
------------------ | ----------- | -----------
reward_name        | string      | Reward name (e.g. 現金, Line Points, 街口幣, Open Points, P幣, Hami Point, 代幣...)
multiple_reward    | bool        | Does the offer have multiple reward contents
cion_image         | string      | Coin image URL
reward_value       | float       | Reward value from the offer
reward_upperbound  | int         | Reward upper bound
expense_upperbound | int         | Expense upper bound
expense            | int         | Expense of the reward
left_expense       | int         | Left expense to get the max reward
cahsback           | float       | Cashbck user get fro m th reward
offer              | OfferResult | Offer info

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get month accounting records

> Get month accounting records:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/accountings/records/{year}/{months} \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/accountings/records/{year}/{months}'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/accountings/records/{year}/{months}', {
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
    "year": 2021,
    "month": 1,
    "accounting_records": [
      {
        "accounting_id": "5f9a747p00c2abf3d4a54d4q",
        "card": {
          "card_id": "5f9a747p00c2abf3d4a54d4q",
          "name": "台新@GoGo卡",
          "bank": {
            "bank_id": "5f9a747p00c2abf3d4a54d4q",
            "name": "台新銀行",
            "logo": "https://aishin-bank.png",
            "image": "https://aishin-bank.png",
            "code": "812"
          },
          "level": 4,
          "image": "https://card/5f9a747p00c2abf3d4a54d4q-1.png",
          "issuer": "VISA",
          "payment_date": 15
        },
        "mobilepay": {
          "mobilepay_id": "5f9a747p00c2abf3d4a54d4q",
          "name": "Line Pay",
          "image": "https://line-pay.png",
          "user_has": false
        },
        "amount": 100,
        "name": "便利商店",
        "date": 1617601542000
      }
    ]
  },
  "timestamp": 1617601542000
}
```

Get month accounting records

### HTTP Request

`GET https://api.cardbo.info/api/v6/accountings/records/{year}/{month}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
--------- | -----------
year      | year

### Response

#### Success

Key                | Type               | Enums      | Description
------------------ | ------------------ | ---------- | -----------
year               | int                |            | year
month              | int                | [`1`-`12`] | month
accounting_records | []AccountingRecord |            | array of AccountingRecord

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# ◉ Invoice

## • Get unrecorded invoices

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
      "invoice_id": "5f9a747p00c2abf3d4a54d4q",
      "UserID": "5f9a747p00c2abf3d4a54d4q",
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

### HTTP Request

`GET https://api.cardbo.info/api/v6/invoices/unrecorded`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key             | Type            | Enums | Description
--------------- | --------------- | ----- | -----------
invoice_id      | string          |       | invoice id
user_id         | string          |       | user id
invoice_no      | string          |       | invoice number
einvoice_status | string          |       | the status from the E-invcoie API
period          | string          |       | invoice period
seller_name     | string          |       | seller name
seller_tax_id   | string          |       | seller tax id
seller_address  | string          |       | seller address
invoice_time    | string          |       | time of the invoice in timestamp
buyer_tax_id    | string          |       | date of the expese in timestamp
currency        | string          |       | money currency
price           | int             |       | the price of the expense
details         | []InvoiceDetail |       | array of InvoiceDetail object
qr_code_items   | []QRCodeItem    |       | array of QRCodeItem object
store           | Store           |       | the store of the invoice
unrecorded      | bool            |       | is invoice is recorded or not
status          | int             | UNRECORDED: `1` <br/> PENDING: `2` <br/> RECORDED: `3` <br/> ARCHIVED: `4` | status of the invoice
created_at      | int             |       | create time in timestamp
updated_at      | int             |       | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Archive invoices

> Archive invoices:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/invoices/archive \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "invoice_id_list": [
      "5f9a747p00c2abf3d4a54d4q"
    ]
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/invoices/archive'
data = {
  'invoice_id_list': [
    '5f9a747p00c2abf3d4a54d4q'
  ]
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  invoice_id_list: [
    "5f9a747p00c2abf3d4a54d4q"
  ]
}
axios.put('https://api.cardbo.info/api/v6/invoices/archive', data, {
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

Archive invoices

### HTTP Request

`PUT https://api.cardbo.info/api/v6/invoices/archive`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key    | Type   | Description
------ | ------ | -----------
result | string | no result

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get QR Code invoice data

> Get QR Code invoice data:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/invoice/qrcode?qr_code_left={INVOICE_LEFT_QR_CODE} \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/invoice/qrcode?qr_code_left={INVOICE_LEFT_QR_CODE}'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/invoice/qrcode?qr_code_left={INVOICE_LEFT_QR_CODE}', {
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
    "store": {
      "store_info": "..."
    },
    "unrecorded": true,
    "created_at": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Get QR Code invoice data

### HTTP Request

`GET https://api.cardbo.info/api/v6/invoice/qrcode`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Queries

Query        | Required | Muti-values |  Description
------------ | -------- | ----------- |  -----------
qr_code_left | true     | false       | the left part of the QR Code on invoice

### Response

#### Success

Key             | Type            | Description
--------------- | --------------- | -----------
invoice_no      | string          | invoice number
einvoice_status | string          | the status from the E-invcoie API
period          | string          | invoice period
seller_name     | string          | seller name
seller_tax_id   | string          | seller tax id
seller_address  | string          | seller address
invoice_time    | string          | time of the invoice in timestamp
buyer_tax_id    | string          | date of the expese in timestamp
currency        | string          | money currency
price           | int             | the price of the expense
details         | []InvoiceDetail | array of InvoiceDetail object
qr_code_items   | []QRCodeItem    | array of QRCodeItem object
store           | Store           | the store of the invoice

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# ◉ Card Questionnaire

## • Insert card questionnaire

> Insert card questionnaire:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v6/questionnaire \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card": {
      "card_id": "5f756d85c2349d9139648a81"
    },
    "questionnaires": [
      {
        "question_type": 1,
        "tag": "手機提款",
        "question": "是否設定手機提款？",
        "description": "是否設定手機提款？"
      },
      {
        "question_type": 2,
        "question": "懂匯/超匯？",
        "options": [
          "懂匯",
          "超匯"
        ],
        "description": "懂匯：.../超匯：..."
      },
      {
        "question_type": 3,
        "question": "當期帳單以 Richart 帳戶自動扣繳",
        "description": "當期帳單以 Richart 帳戶自動扣繳"
      },
      {
        "question_type": 4,
        "question": "是否申辦電子帳單？",
        "description": "申辦電子帳單"
      },
      {
        "question_type": 5,
        "question": "電子票證",
        "description": "電子票證",
        "etickets": [
          {
            "eticket_id": "5f756d85c2349d9139648a81"
          }
        ]
      }
    ]
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/questionnaire'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "card": {
    "card_id": "5f756d85c2349d9139648a81"
  },
  "questionnaires": [
    {
      "question_type": 1,
      "tag": "手機提款",
      "question": "是否設定手機提款？",
      "description": "是否設定手機提款？"
    },
    {
      "question_type": 2,
      "question": "懂匯/超匯？",
      "options": [
        "懂匯",
        "超匯"
      ],
      "description": "懂匯：.../超匯：..."
    },
    {
      "question_type": 3,
      "question": "當期帳單以 Richart 帳戶自動扣繳",
      "description": "當期帳單以 Richart 帳戶自動扣繳"
    },
    {
      "question_type": 4,
      "question": "是否申辦電子帳單？",
      "description": "申辦電子帳單"
    },
    {
      "question_type": 5,
      "question": "電子票證",
      "description": "電子票證",
      "etickets": [
        {
          "eticket_id": "5f756d85c2349d9139648a81"
        }
      ]
    }
  ]
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  card: {
    card_id: "5f756d85c2349d9139648a81"
  },
  questionnaires: [
    {
      question_type: 1,
      tag: "手機提款",
      question: "是否設定手機提款？",
      description: "是否設定手機提款？"
    },
    {
      question_type: 2,
      question: "懂匯/超匯？",
      options: [
        "懂匯",
        "超匯"
      ],
      description: "懂匯：.../超匯：..."
    },
    {
      question_type: 3,
      question: "當期帳單以 Richart 帳戶自動扣繳",
      description: "當期帳單以 Richart 帳戶自動扣繳"
    },
    {
      question_type: 4,
      question: "是否申辦電子帳單？",
      description: "申辦電子帳單"
    },
    {
      question_type: 5,
      question: "電子票證",
      description: "電子票證",
      etickets: [
        {
          eticket_id: "5f756d85c2349d9139648a81"
        }
      ]
    }
  ]
}
axios.post('https://api.cardbo.info/api/v6/questionnaire', data, {
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
  "code": 201,
  "message": "Ok",
  "result": {
    "questionnaire_id": "60efac665532d3cc0fcf28f7",
    "card": {
      "card_info": "..."
    },
    "questionnaires": [
      {
        "question_type": 1,
        "tag": "手機提款",
        "question": "是否設定手機提款？",
        "description": "是否設定手機提款？"
      },
      {
        "question_type": 2,
        "question": "懂匯/超匯？",
        "options": [
          "懂匯",
          "超匯"
        ],
        "description": "懂匯：.../超匯：..."
      },
      {
        "question_type": 3,
        "question": "當期帳單以 Richart 帳戶自動扣繳",
        "description": "當期帳單以 Richart 帳戶自動扣繳"
      },
      {
        "question_type": 4,
        "question": "是否申辦電子帳單？",
        "description": "申辦電子帳單"
      },
      {
        "question_type": 5,
        "question": "電子票證",
        "description": "電子票證",
        "etickets": [
          {
            "eticket_id": "5f756d85c2349d9139648a81"
          }
        ]
      }
    ],
    "created_at": 1617601542000,
    "updated_at": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Insert card questionnaire

### HTTP Request

`POST https://api.cardbo.info/api/v6/questionnaire`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter      | Required | Type            | Description
-------------- | -------- | --------------- | -----------
card           | true     | Card            | Card object of the questionnaire
questionnaires | true     | []Questionnaire | array of questionnaires

<aside class="notice">
<b>Question Type</b> </br>
- TAG: <code>tag</code> is required & <code>options</code> cannot be set </br>
- OPTIONS: <code>options</code> is required & <code>tag</code> cannot be set </br>
- ACCOUNT BINDING: <code>options</code> & <code>tag</code> cannot be set </br>
- ELECTRONIC BILL: <code>options</code> & <code>tag</code> cannot be set </br>
- ETICKET: <code>etickets</code> is required
</aside>

### Response

#### Success

Key              | Type            | Description
---------------- | --------------- | -----------
questionnaire_id | string          | questionnaire id
card             | Card            | the card of the questionnaires
questionnaires   | []Questionnaire | array of questionnaire
created_at       | int             | create time in timestamp
updated_at       | int             | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Update card questionnaire

> Update card questionnaire:

```shell
curl --request PUT \
  --url https://api.cardbo.info/api/v6/questionnaire/{questionnaire_id} \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card": {
      "card_id": "5f756d85c2349d9139648a81"
    },
    "questionnaires": [
      {
        "question_type": 1,
        "tag": "手機提款",
        "question": "是否設定手機提款？",
        "description": "是否設定手機提款？"
      },
      {
        "question_type": 2,
        "question": "懂匯/超匯？",
        "options": [
          "懂匯",
          "超匯"
        ],
        "description": "懂匯：.../超匯：..."
      },
      {
        "question_type": 3,
        "question": "當期帳單以 Richart 帳戶自動扣繳",
        "description": "當期帳單以 Richart 帳戶自動扣繳"
      },
      {
        "question_type": 4,
        "question": "是否申辦電子帳單？",
        "description": "申辦電子帳單"
      },
      {
        "question_type": 5,
        "question": "電子票證",
        "description": "電子票證",
        "etickets": [
          {
            "eticket_id": "5f756d85c2349d9139648a81"
          }
        ]
      }
    ]
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/questionnaire/{questionnaire_id}'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "card": {
    "card_id": "5f756d85c2349d9139648a81"
  },
  "questionnaires": [
    {
      "question_type": 1,
      "tag": "手機提款",
      "question": "是否設定手機提款？",
      "description": "是否設定手機提款？"
    },
    {
      "question_type": 2,
      "question": "懂匯/超匯？",
      "options": [
        "懂匯",
        "超匯"
      ],
      "description": "懂匯：.../超匯：..."
    },
    {
      "question_type": 3,
      "question": "當期帳單以 Richart 帳戶自動扣繳",
      "description": "當期帳單以 Richart 帳戶自動扣繳"
    },
    {
      "question_type": 4,
      "question": "是否申辦電子帳單？",
      "description": "申辦電子帳單"
    },
    {
      "question_type": 5,
      "question": "電子票證",
      "description": "電子票證",
      "etickets": [
        {
          "eticket_id": "5f756d85c2349d9139648a81"
        }
      ]
    }
  ]
}
response = requests.put(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  card: {
    card_id: "5f756d85c2349d9139648a81"
  },
  questionnaires: [
    {
      question_type: 1,
      tag: "手機提款",
      question: "是否設定手機提款？",
      description: "是否設定手機提款？"
    },
    {
      question_type: 2,
      question: "懂匯/超匯？",
      options: [
        "懂匯",
        "超匯"
      ],
      description: "懂匯：.../超匯：..."
    },
    {
      question_type: 3,
      question: "當期帳單以 Richart 帳戶自動扣繳",
      description: "當期帳單以 Richart 帳戶自動扣繳"
    },
    {
      question_type: 4,
      question: "是否申辦電子帳單？",
      description: "申辦電子帳單"
    },
    {
      question_type: 5,
      question: "電子票證",
      description: "電子票證",
      etickets: [
        {
          eticket_id: "5f756d85c2349d9139648a81"
        }
      ]
    }
  ]
}
axios.put('https://api.cardbo.info/api/v6/questionnaire/{questionnaire_id}', data, {
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
  "code": 201,
  "message": "Ok",
  "result": {
    "questionnaire_id": "60efac665532d3cc0fcf28f7",
    "card": {
      "card_info": "..."
    },
    "questionnaires": [
      {
        "question_type": 1,
        "tag": "手機提款",
        "question": "是否設定手機提款？",
        "description": "是否設定手機提款？"
      },
      {
        "question_type": 2,
        "question": "懂匯/超匯？",
        "options": [
          "懂匯",
          "超匯"
        ],
        "description": "懂匯：.../超匯：..."
      },
      {
        "question_type": 3,
        "question": "當期帳單以 Richart 帳戶自動扣繳",
        "description": "當期帳單以 Richart 帳戶自動扣繳"
      },
      {
        "question_type": 4,
        "question": "是否申辦電子帳單？",
        "description": "申辦電子帳單"
      },
      {
        "question_type": 5,
        "question": "電子票證",
        "description": "電子票證",
        "etickets": [
          {
            "eticket_id": "5f756d85c2349d9139648a81"
          }
        ]
      }
    ],
    "created_at": 1617601542000,
    "updated_at": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Update card questionnaire

### HTTP Request

`PUT https://api.cardbo.info/api/v6/questionnaire/{questionnaire_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter        | Description
---------------- | -----------
questionnaire_id | questionnaire id

#### Parameters

Parameter      | Required | Type            | Description
-------------- | -------- | --------------- | -----------
card           | true     | Card            | Card object of the questionnaire
questionnaires | true     | []Questionnaire | array of questionnaires

<aside class="notice">
<b>Question Type</b> </br>
- TAG: <code>tag</code> is required & <code>options</code> cannot be set </br>
- OPTIONS: <code>options</code> is required & <code>tag</code> cannot be set </br>
- ACCOUNT BINDING: <code>options</code> & <code>tag</code> cannot be set </br>
- ELECTRONIC BILL: <code>options</code> & <code>tag</code> cannot be set </br>
- ETICKET: <code>etickets</code> is required
</aside>

### Response

#### Success

Key              | Type            | Description
---------------- | --------------- | -----------
questionnaire_id | string          | questionnaire id
card             | Card            | the card of the questionnaires
questionnaires   | []Questionnaire | array of questionnaire
created_at       | int             | create time in timestamp
updated_at       | int             | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get questionnaire by questionnaire_id

> Get questionnaire by questionnaire_id:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/questionnaire/id/{questionnaire_id} \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/questionnaire/id/{questionnaire_id}'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/questionnaire/id/{questionnaire_id}', {
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
    "questionnaire_id": "60efac665532d3cc0fcf28f7",
    "card": {
      "card_info": "..."
    },
    "questionnaires": [
      {
        "quesiton_no": 1,
        "question_type": 1,
        "question": "是否設定手機提款？",
        "options": [
          "是",
          "否"
        ],
        "tag": "手機提款",
        "description": "是否設定手機提款？",
        "etickets": []
      },
      {
        "quesiton_no": 2,
        "question_type": 2,
        "question": "懂匯/超匯？",
        "options": [
          "懂匯",
          "超匯"
        ],
        "tag": "",
        "description": "懂匯：.../超匯：...",
        "etickets": []
      },
      {
        "quesiton_no": 3,
        "question_type": 3,
        "question": "當期帳單以 Richart 帳戶自動扣繳",
        "options": [
          "是",
          "否"
        ],
        "tag": "",
        "description": "當期帳單以 Richart 帳戶自動扣繳",
        "etickets": []
      },
      {
        "quesiton_no": 4,
        "question_type": 4,
        "question": "是否申辦電子帳單？",
        "options": [
          "是",
          "否"
        ],
        "tag": "",
        "description": "申辦電子帳單",
        "etickets": []
      },
      {
        "quesiton_no": 5,
        "question_type": 5,
        "question": "電子票證",
        "options": [],
        "tag": "",
        "description": "電子票證",
        "etickets": [
          {
            "eticket_info": "..."
          }
        ]
      }
    ],
    "created_at": 1617601542000,
    "updated_at": 1617601542000
  },
  "timestamp": 1617601542000
}
```

Get questionnaire by questionnaire_id

### HTTP Request

`GET https://api.cardbo.info/api/v6/questionnaire/id/{questionnaire_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter        | Description
---------------- | -----------
questionnaire_id | questionnaire id

### Response

#### Success

Key              | Type            | Description
---------------- | --------------- | -----------
questionnaire_id | string          | questionnaire id
card             | Card            | the card of the questionnaires
questionnaires   | []Questionnaire | array of questionnaire
created_at       | int             | create time in timestamp
updated_at       | int             | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get user card questionnaire

> Get user card questionnaire:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/questionnaire/card/{card_id} \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/questionnaire/card/{card_id}'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/questionnaire/card/{card_id}', {
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
    "questionnaire": {
      "questionnaire_id": "60efac665532d3cc0fcf28f7",
      "card": {
        "card_info": "..."
      },
      "questionnaires": [
        {
          "quesiton_no": 1,
          "question_type": 1,
          "question": "是否設定手機提款？",
          "options": [
            "是",
            "否"
          ],
          "tag": "手機提款",
          "description": "是否設定手機提款？",
          "etickets": []
        },
        {
          "quesiton_no": 2,
          "question_type": 2,
          "question": "懂匯/超匯？",
          "options": [
            "懂匯",
            "超匯"
          ],
          "tag": "",
          "description": "懂匯：.../超匯：...",
          "etickets": []
        },
        {
          "quesiton_no": 3,
          "question_type": 3,
          "question": "當期帳單以 Richart 帳戶自動扣繳",
          "options": [
            "是",
            "否"
          ],
          "tag": "",
          "description": "當期帳單以 Richart 帳戶自動扣繳",
          "etickets": []
        },
        {
          "quesiton_no": 4,
          "question_type": 4,
          "question": "是否申辦電子帳單？",
          "options": [
            "是",
            "否"
          ],
          "tag": "",
          "description": "申辦電子帳單",
          "etickets": []
        },
        {
          "quesiton_no": 5,
          "question_type": 5,
          "question": "電子票證",
          "options": [],
          "tag": "",
          "description": "電子票證",
          "etickets": [
            {
              "eticket_info": "..."
            }
          ]
        }
      ],
      "created_at": 1617601542000,
      "updated_at": 1617601542000
    },
    "answer": {
      "questionnaire_id": "60efac665532d3cc0fcf28f7",
      "user": {
        "user_info": "...",
      },
      "card": {
        "card_info": "..."        
      },
      "card_last_no": "1234",
      "reward_day": 30,
      "questionnaires": [
        {
          "question_no": 1,
          "question_type": 1,
          "answer": "否",
          "tag": "數位帳戶綁定"
        },
        {
          "question_no": 2,
          "question_type": 2,
          "answer": "方案1",
          "tag": ""
        },
        {
          "question_no": 3,
          "question_type": 3,
          "answer": "是",
          "tag": ""
        },
        {
          "question_no": 4,
          "question_type": 4,
          "answer": "是",
          "tag": ""
        },
        {
          "question_no": 5,
          "question_type": 5,
          "answer": "60efac665532d3cc0fcf28f7",
          "tag": ""
        }
      ],
      "completed": true,
      "created_at": 1626850077000,
      "updated_at": 1626857480000
    }
  },
  "timestamp": 1617601542000
}
```

Get questionnaire and user's answer of a card

### HTTP Request

`GET https://api.cardbo.info/api/v6/questionnaire/card/{card_id}`

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

Key           | Type                    | Description
------------- | ----------------------- | -----------
questionnaire | CardQuestionnaire       | CardQuestionnaire object
answer        | CardQuestionnaireAnswer | CardQuestionnaireAnswer object

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get questionnaires

> Get questionnaires:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/questionnaires \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/questionnaires'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/questionnaires', {
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
      "questionnaire_id": "60efac665532d3cc0fcf28f7",
      "card": {
        "card_info": "..."
      },
      "questionnaires": [
        {
          "quesiton_no": 1,
          "question_type": 1,
          "question": "是否設定手機提款？",
          "options": [
            "是",
            "否"
          ],
          "tag": "手機提款",
          "description": "是否設定手機提款？",
          "etickets": []
        },
        {
          "quesiton_no": 2,
          "question_type": 2,
          "question": "懂匯/超匯？",
          "options": [
            "懂匯",
            "超匯"
          ],
          "tag": "",
          "description": "懂匯：.../超匯：...",
          "etickets": []
        },
        {
          "quesiton_no": 3,
          "question_type": 3,
          "question": "當期帳單以 Richart 帳戶自動扣繳",
          "options": [
            "是",
            "否"
          ],
          "tag": "",
          "description": "當期帳單以 Richart 帳戶自動扣繳",
          "etickets": []
        },
        {
          "quesiton_no": 4,
          "question_type": 4,
          "question": "是否申辦電子帳單？",
          "options": [
            "是",
            "否"
          ],
          "tag": "",
          "description": "申辦電子帳單",
          "etickets": []
        },
        {
          "quesiton_no": 5,
          "question_type": 5,
          "question": "電子票證",
          "options": [],
          "tag": "",
          "description": "電子票證",
          "etickets": [
            {
              "eticket_info": "..."
            }
          ]
        }
      ],
      "created_at": 1617601542000,
      "updated_at": 1617601542000
    }
  ],
  "timestamp": 1617601542000
}
```

Get questionnaires

### HTTP Request

`GET https://api.cardbo.info/api/v6/questionnaires`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key              | Type            | Description
---------------- | --------------- | -----------
questionnaire_id | string          | questionnaire id
card             | Card            | the card of the questionnaires
questionnaires   | []Questionnaire | array of questionnaire
created_at       | int             | create time in timestamp
updated_at       | int             | update time in timestamp

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Submit questionnaire

> Submit questionnaire:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v6/questionnaire/submit/{card_id} \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "card_last_no": "0134",
    "reward_day": 30,
    "questionnaires": [
      {
        "question_no": 1,
        "question_type": 1,
        "answer": "是",
        "tag": "人臉辨識"
      },
      {
        "question_no": 2,
        "question_type": 2,
        "answer": "方案一"
      },
      {
        "question_no": 3,
        "question_type": 3,
        "answer": "是"
      },
      {
        "question_no": 4,
        "question_type": 4,
        "answer": "否"
      },
      {
        "question_no": 5,
        "question_type": 5,
        "answer": "5f756d85c2349d9139648a81"
      }
    ]
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/questionnaire/submit/{card_id}'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "card_last_no": "0134",
  "reward_day": 30,
  "questionnaires": [
    {
      "question_no": 1,
      "question_type": 1,
      "answer": "是",
      "tag": "人臉辨識"
    },
    {
      "question_no": 2,
      "question_type": 2,
      "answer": "方案一"
    },
    {
      "question_no": 3,
      "question_type": 3,
      "answer": "是"
    },
    {
      "question_no": 4,
      "question_type": 4,
      "answer": "否"
    },
    {
      "question_no": 5,
      "question_type": 5,
      "answer": "5f756d85c2349d9139648a81"
    }
  ]
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  card_last_no: "0134",
  reward_day: 30,
  questionnaires: [
    {
      question_no: 1,
      questin_type: 1,
      answer: "是",
      tag: "人臉辨識"
    },
    {
      question_no: 2,
      question_type: 2,
      answer: "方案一"
    },
      question_no: 3,
      question_type: 3,
      answer: "是"
    },
    {
      question_no: 4,
      question_type: 4,
      answer: "否"
    },
    {
      question_no: 5,
      question_type: 5,
      answer: "5f756d85c2349d9139648a81"
    }
  ]
}
axios.post('https://api.cardbo.info/api/v6/questionnaire/submit/{card_id}', data, {
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
  "code": 201,
  "message": "Ok",
  "result": {},
  "timestamp": 1617601542000
}
```

User submit questionaaire

### HTTP Request

`POST https://api.cardbo.info/api/v6/questionnaire/submit/{card_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter      | Required | Type                  | Description
-------------- | -------- | --------------------- | -----------
card_last_no   | false    | string                | the last 4 number of user's credit card
reward_day     | false    | int                   | the end day of a month of the reward
questionnaires | true     | []QuestionnaireAnswer | array of QuestionnaireAnswer object

<aside class="notice">
<b>Question Type</b> </br>
- TAG: answer can only be <code>是</code> or <code>否</code>, tag is the tag from the questionnaire <code>tag</code> field  </br>
- OPTIONS: answer is the option from the questionnaire <code>options</code> field </br>
- ACCOUNT BINDING: answer can only be <code>是</code> or <code>否</code> </br>
- ELECTRONIC BILL: answer can only be <code>是</code> or <code>否</code> </br>
- ETICKET: answer can only be the be <code>eticket_id<code>
</aside>

### Response

#### Success

Key    | Type | Description
------ | ---- | -----------
result | None | no success response

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

# ◉ ETicket

## • Insert eticket

> Insert eticket:

```shell
curl --request POST \
  --url https://api.cardbo.info/api/v6/eticket \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
  --data '{
    "name": "悠遊卡"
    "image": "https://www.image.com"
  }'
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/eticket'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
data = {
  "name": "悠遊卡"
  "image": "https://www.image.com"
}
response = requests.post(url, headers=headers, json=data)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
data = {
  name: "悠遊卡"
  image: "https://www.image.com"
}
axios.post('https://api.cardbo.info/api/v6/eticket', data, {
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
  "code": 201,
  "message": "Ok",
  "result": {
    "eticket_id": "5f9a747p00c2abf3d4a54d4q",
    "name": "悠遊卡",
    "image": "https://www.image.com"
  },
  "timestamp": 1617601542000
}
```

Insert eticket

<aside class="notice"></aside>
You must replace <code>meowmeowmeowaccess</code> with your personal API access token.
</aside>

### HTTP Request

`POST https://api.cardbo.info/api/v6/eticket`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Parameters

Parameter | Required | Type   | Description
--------- | -------- | ------ | -----------
name      | true     | string | eticket name
image     | false    | string | image URL

### Response

#### Success

Key        | Type  | Description
---------- | ------ | -----------
eticket_id | string | eticket id
name       | string | eticket name
image      | string | image URL

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get eticket by eticket_id

> Get eticket by eticket_id:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/eticket/{eticket_id} \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/eticket/{eticket_id}'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/eticket/{eticket_id}', {
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
    "eticket_id": "5f9a747p00c2abf3d4a54d4q",
    "name": "悠遊卡",
    "image": "https://www.image.com"
  },
  "timestamp": 1617601542000
}
```

Get eticket by eticket_id

### HTTP Request

`GET https://api.cardbo.info/api/v6/eticket/{eticket_id}`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

#### Path Parameters

Parameter | Description
---------- | -----------
eticket_id | eticket id

### Response

#### Success

Key        | Type  | Description
---------- | ------ | -----------
eticket_id | string | eticket id
name       | string | eticket name
image      | string | image URL

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message

## • Get etickets

> Get etickets:

```shell
curl --request GET \
  --url https://api.cardbo.info/api/v6/etickets \
  -H 'Authorization: Bearer meowmeowmeowaccess' \
  -H 'Content-Type: application/json' \
```

```python
import requests

url = 'https://api.cardbo.info/api/v6/etickets'
headers = {'Authorization': 'Bearer meowmeowmeowaccess'}
response = requests.get(url, headers=headers)
```

```javascript
const axios = require('axios');

headers = {Authorization: 'Bearer meowmeowmeowaccess'}
axios.get('https://api.cardbo.info/api/v6/etickets', {
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
      "eticket_id": "5f9a747p00c2abf3d4a54d4q",
      "name": "悠遊卡",
      "image": "https://www.image.com"
    }
  ],
  "timestamp": 1617601542000
}
```

Get etickets

### HTTP Request

`GET https://api.cardbo.info/api/v6/etickets`

### Request

#### Headers

Key           | Value        | Description
------------- | ------------ | -----------
Authorization | Bearer token | API access token

### Response

#### Success

Key        | Type  | Description
---------- | ------ | -----------
eticket_id | string | eticket id
name       | string | eticket name
image      | string | image URL

#### Error

Key   | Type   | Description
----- | ------ | -----------
error | string | error message
