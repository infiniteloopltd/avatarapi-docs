---
title: Avatar API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='https://www.avatarapi.com'>Sign Up for a Developer Account</a>


includes:
  - errors

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the Avatar API
---

# Usage

Welcome to the Avatar API. An API that can return a profile image, name and address from an email address. 
To get started, create an account on [Avatar API.com](https://www.avatarapi.com).

# Basic Usage

> Basic usage:

```ruby
require "uri"
require "net/http"

url = URI("https://avatarapi.com/v2/api.aspx")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = "text/plain"
request.body = "{\"username\":\"YOUR_USERNAME\",\"password\":\"YOUR_PASSWORD\",\"email\":\"Coco_crocodile@outlook.com\"}"

response = https.request(request)
puts response.read_body

```

```python
import requests

url = "https://avatarapi.com/v2/api.aspx"

payload = "{\"username\":\"YOUR_USERNAME\",\"password\":\"YOUR_PASSWORD\",\"email\":\"Coco_crocodile@outlook.com\"}"
headers = {
  'Content-Type': 'text/plain'
}
response = requests.request("POST", url, headers=headers, data=payload)
print(response.text)

```

```shell
# With shell, you can just pass the correct header with each request
curl --location --request POST 'https://avatarapi.com/v2/api.aspx' \
--data-raw '{ 
    "username" : "YOUR_USERNAME",
    "password" : "YOUR_PASSWORD",
    "email" : "Coco_crocodile@outlook.com"
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'https://avatarapi.com/v2/api.aspx',
  'headers': {
    'Content-Type': 'text/plain'
  },
  body: '{"username":"YOUR_USERNAME","password":"YOUR_PASSWORD","email":"Coco_crocodile@outlook.com"}'

};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Make sure to replace YOUR_USERNAME and YOUR_PASSWORD with your credentials.

> The above command returns JSON structured like this:

```json
{
    "Name": "",
    "Image": "https://s3.avatarapi.com/7b18eb6f263b1efb30f1dbb7f7c9a7accdebfbd710cc45d922d0c0dd48746876.gif",
    "Valid": true,
    "City": "",
    "Country": "",
    "IsDefault": true
}
```

AvatarAPI requires a username and password, which is passed in the HTTP body as JSON in a HTTP POST. 
Each request will consume one or more credits, depending on the sources used, once you run out of 
credits, the API will return an error.


<aside class="notice">
 In the examples, the username and password will be dispayed as YOUR_USERNAME and YOUR_PASSWORD, but these
 must be replaced with the values from your own account. Similarly. sample email addresses in this documentation
 are ficticious and do not represent real people.
</aside>

## Specified providers

> Using specified providers:

```ruby
require "uri"
require "net/http"

url = URI("https://avatarapi.com/v2/api.aspx")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = "text/plain"
request.body = "{\"username\":\"YOUR_USERNAME\",\"password\":\"YOUR_PASSWORD\",\"email\":\"Coco_crocodile@outlook.com\",\"provider\":\"Microsoft,Google\"}"

response = https.request(request)
puts response.read_body

```

```python
import requests

url = "https://avatarapi.com/v2/api.aspx"

payload = "{\"username\":\"YOUR_USERNAME\",\"password\":\"YOUR_PASSWORD\",\"email\":\"Coco_crocodile@outlook.com\",\"provider\":\"Microsoft,Google\"}"
headers = {
  'Content-Type': 'text/plain'
}
response = requests.request("POST", url, headers=headers, data=payload)
print(response.text)

```

```shell
# With shell, you can just pass the correct header with each request
curl --location --request POST 'https://avatarapi.com/v2/api.aspx' \
--data-raw '{ 
    "username" : "YOUR_USERNAME",
    "password" : "YOUR_PASSWORD",
    "provider" : "Microsoft,Google",
    "email" : "Coco_crocodile@outlook.com"
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'https://avatarapi.com/v2/api.aspx',
  'headers': {
    'Content-Type': 'text/plain'
  },
  body: '{"username":"YOUR_USERNAME","password":"YOUR_PASSWORD","email":"Coco_crocodile@outlook.com", "provider" : "Microsoft,Google"}'

};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> The above command returns JSON structured like this:

```json
{
    "Name": "",
    "Image": "https://s3.avatarapi.com/7b18eb6f263b1efb30f1dbb7f7c9a7accdebfbd710cc45d922d0c0dd48746876.gif",
    "Valid": true,
    "City": "",
    "Country": "",
    "IsDefault": true
}
```

> Make sure to replace YOUR_USERNAME and YOUR_PASSWORD with your credentials.

Optionally, you can pass a parameter named `provider` to AvatarAPI, which allows you to select the 
providers, and the order of the providers to be used in the search waterfall. Each provider is tested
in order, and if a match is found for the email address provided, then the API will return at that point. 

This feature allows you to fine-tune the operation of AvatarAPI, such that you can optimize for speed, cost
or comprehensivity. 

# Providers

## Get All Providers

```ruby
require "uri"
require "net/http"

url = URI("https://www.avatarapi.com/v2/providers.aspx")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
puts response.read_body

```

```python
import requests

url = "https://www.avatarapi.com/v2/providers.aspx"

payload={}
headers = {}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'https://www.avatarapi.com/v2/providers.aspx'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'https://www.avatarapi.com/v2/providers.aspx',
  'headers': {
  }
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});

```

> The above command returns JSON structured like this:

```json
[
    {
        "Name": "Adobe",
        "Cost": 1,
        "ExpectedProfileFields": [
            "Image"
        ]
    },
    {
        "Name": "Cache",
        "Cost": 0,
        "ExpectedProfileFields": [
            "Image",
            "Address",
            "Name"
        ]
    }
    ...
]
```

This endpoint retrieves all providers, this allows you to fine-tune your requests to AvatarAPI to 
optimize for speed, cost, or coverage. You can also decide which providers to use that match your
business case. If your use case requires a user's full name, then you shouldn't use any providers
that do not return this - or conversely, if you do not require the user's name, but need to optimize
for speed and cost, then you shouldn't use a provider that are costly, but return superflous data.

If you do not specify the providers you wish to use, then the order will default to;
Cache,Google,Microsoft,Gravatar,Skype,Flickr, then Adobe.

Costs accumulate over providers, and they are called in order. Once a match is found then the API
will return. You should prioritize the providers based on your business use case.



### HTTP Request

`GET https://www.avatarapi.com/v2/providers.aspx`


<aside class="success">
 This endpoint does not require authentication, and has no associated credit cost,
 new sources may be added over time, and the cost may change. A cost of 0 indicates that
 the particular source does not consume any credits when used (i.e. "Cache"). We recommend
 using "Cache" as the first source in your provider chain, since it is both fast and free.
 However, this may return user details that may have changed with respect to their current
 status. 
</aside>
