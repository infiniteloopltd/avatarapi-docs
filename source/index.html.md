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
    "Image": "https://s3.avatarapi.com/fe975b72194e729e0883bab6f9d7e0d72c304fd2f28c9fe6a77afe840065aad7.gif",
    "Valid": true,
    "City": "",
    "Country": "",
    "IsDefault": true,
    "Success": true,
    "RawData": "",
    "Source": {
        "Name": "Microsoft"
    }
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
request.body = "{\"username\":\"YOUR_USERNAME\",\"password\":\"YOUR_PASSWORD\",\"email\":\"Coco_crocodile@outlook.com\",\"provider\":\"Gravatar,Microsoft\"}"

response = https.request(request)
puts response.read_body

```

```python
import requests

url = "https://avatarapi.com/v2/api.aspx"

payload = "{\"username\":\"YOUR_USERNAME\",\"password\":\"YOUR_PASSWORD\",\"email\":\"Coco_crocodile@outlook.com\",\"provider\":\"Gravatar,Microsoft\"}"
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
    "provider" : "Gravatar,Microsoft",
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
  body: '{"username":"YOUR_USERNAME","password":"YOUR_PASSWORD","email":"Coco_crocodile@outlook.com", "provider" : "Gravatar,Microsoft"}'

};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> The above command returns JSON structured like this:

```json
{
    "Name": "coco crocodile",
    "Image": "http://www.gravatar.com/avatar/90d0336f75e620d5ef8c4affbb2e9aac?s=181",
    "Valid": true,
    "City": "",
    "Country": "",
    "IsDefault": false,
    "Success": true,
    "RawData": "{\"entry\":[{\"hash\":\"90d0336f75e620d5ef8c4affbb2e9aac\",\"requestHash\":\"90d0336f75e620d5ef8c4affbb2e9aac\",\"profileUrl\":\"https:\/\/gravatar.com\/cococrocodile\",\"preferredUsername\":\"cococrocodile\",\"thumbnailUrl\":\"https:\/\/2.gravatar.com\/avatar\/90d0336f75e620d5ef8c4affbb2e9aac\",\"photos\":[{\"value\":\"https:\/\/2.gravatar.com\/avatar\/90d0336f75e620d5ef8c4affbb2e9aac\",\"type\":\"thumbnail\"}],\"last_profile_edit\":\"2023-09-24 15:57:45\",\"name\":{\"givenName\":\"coco\",\"familyName\":\"crocodile\",\"formatted\":\"coco crocodile\"},\"displayName\":\"Coco Crocodile\",\"urls\":[]}]}",
    "Source": {
        "Name": "Gravatar"
    }
}
```

> Make sure to replace YOUR_USERNAME and YOUR_PASSWORD with your credentials.

Optionally, you can pass a parameter named `provider` to AvatarAPI, which allows you to select the 
providers, and the order of the providers to be used in the search waterfall. Each provider is tested
in order, and if a match is found for the email address provided, then the API will return at that point. 

This feature allows you to fine-tune the operation of AvatarAPI, such that you can optimize for speed, cost
or comprehensivity. 

<aside class="notice">
 *Performance Tip*: You can include the optional parameter "parallel":"true" to search all specified providers
 in parallel. This will return a result much quicker, and often will return a more complete result, by combining
 profile elements of more than one provider. The downside is that the cost of the request will be higher, as you
 it will have the combined cost of all providers, not just the first provider that returns a result. 
</aside>

## Advanced settings

There are additional JSON elements that you can pass to the API that enable advanced functionality.

### Email Validation

If the element `AllowDefaultProfilePictures` is included in the JSON payload and set to TRUE, then providers will not
ignore placeholder profile pictures. This can be useful if AvatarAPI is being used to validate email addresses.

### LinkedIn Rate Limiting

If the elements `overrideAccount` and `overridePassword` are included in the JSON payload then these credentials will be
used to query the LinkedIn provider, and rate limiting will not be applied to the request. We would recommend that
you contact us to discuss the setup of this feature, before use.

## Get Credits

To get your current credit balance, make a HTTP POST request to `https://www.avatarapi.com/v2/credits.aspx` with
your username and password in the JSON body. 

```ruby
require "uri"
require "net/http"

url = URI("https://avatarapi.com/v2/credits.aspx")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = "text/plain"
request.body = "{\"username\":\"YOUR_USERNAME\",\"password\":\"YOUR_PASSWORD\"}"

response = https.request(request)
puts response.read_body

```

```python
import requests

url = "https://avatarapi.com/v2/credits.aspx"

payload = "{\"username\":\"YOUR_USERNAME\",\"password\":\"YOUR_PASSWORD\"}"
headers = {
  'Content-Type': 'text/plain'
}
response = requests.request("POST", url, headers=headers, data=payload)
print(response.text)

```

```shell
# With shell, you can just pass the correct header with each request
curl --location --request POST 'https://avatarapi.com/v2/credits.aspx' \
--data-raw '{ 
    "username" : "YOUR_USERNAME",
    "password" : "YOUR_PASSWORD"
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'https://avatarapi.com/v2/credits.aspx',
  'headers': {
    'Content-Type': 'text/plain'
  },
  body: '{"username":"YOUR_USERNAME","password":"YOUR_PASSWORD"}'

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
    "email": "you@company.com",
    "credits": 1000
}
```



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

## Provider Raw Data

Most providers also return raw data in the response payload, this raw data is typically JSON, but can
also be XML. The raw data is subject to change, and the exact format of the raw data is beyond the scope
of AvatarAPI, however, it may be used to obtain much richer information about a profile, given that you
should have adequate controls to ensure that your application is not dependent on the format and consistency
of this Raw data.

On the right hand side, is some examples of Raw Data that you can expect from various providers:

Google & Microsoft do not return additional Raw Data.

> Adobe

```json
[
    {
        "type": "individual",
        "authenticationMethods": [
            {
                "id": "google",
                "url": "https://adobeid-na1.services.adobe.com/renga-idprovider/social/v2/signin/google"
            }
        ],
        "status": {
            "code": "active",
            "reason": null
        },
        "images": {
            "50": "https://example.com/img/profile/avatars/generic-50.png?cb=264615658",
            "100": "https://example.com/img/profile/avatars/generic-100.png?cb=264615658",
            "115": "https://example.com/img/profile/avatars/generic-115.png?cb=264615658",
            "138": "https://example.com/img/profile/avatars/generic-138.png?cb=264615658",
            "230": "https://example.com/img/profile/avatars/generic-230.png?cb=264615658",
            "276": "https://example.com/img/profile/avatars/generic-276.png?cb=264615658"
        },
        "hasT2ELinked": false
    }
]

```

> Flickr

```php
<?xml version="1.0" encoding="utf-8" ?>
<rsp stat="ok">
 <person id="12345678@N04" nsid="12345678@N04" ispro="0" is_deleted="0" iconserver="2257" iconfarm="3" path_alias="random_alias" has_stats="0" has_adfree="0" has_free_standard_shipping="0" has_free_educational_resources="0">
  <username>Dr. Random</username>
  <realname>Random Name</realname>
  <location />
  <timezone label="Random City, Random State" offset="+00:00" timezone_id="Europe/London" timezone="57" />
  <description>Random Description</description>
  <photosurl>https://www.flickr.com/photos/random_alias/</photosurl>
  <profileurl>https://www.flickr.com/people/random_alias/</profileurl>
  <mobileurl>https://m.flickr.com/photostream.gne?id=12345678</mobileurl>
  <photos>
   <firstdatetaken>2000-01-01 00:00:00</firstdatetaken>
   <firstdate>946684800</firstdate>
   <count>10</count>
  </photos>
 </person>
</rsp>
```

> Gravatar

```json
{
    "entry": [
        {
            "hash": "abcdef1234567890abcdef1234567890",
            "requestHash": "abcdef1234567890abcdef1234567890",
            "profileUrl": "https://gravatar.com/genericuser",
            "preferredUsername": "genericuser",
            "thumbnailUrl": "https://2.gravatar.com/avatar/abcdef1234567890abcdef1234567890",
            "photos": [
                {
                    "value": "https://2.gravatar.com/avatar/abcdef1234567890abcdef1234567890",
                    "type": "thumbnail"
                }
            ],
            "last_profile_edit": "2023-09-24 15:57:45",
            "name": {
                "givenName": "generic",
                "familyName": "user",
                "formatted": "generic user"
            },
            "displayName": "Generic User",
            "urls": []
        }
    ]
}
```

> LinkedIn

```json
{
    "resultTemplate": "ExactMatch",
    "bound": true,
    "bindUrl": "https://login.live.com/accountbind.srf?provider=linkedin.com&redirect_uri=https://loki.delve.office.com/linkedInAuthRedirect.aspx&client_id=000000004C1E916B&dualbind=1&mkt=EN-US&external_app=Owa&dualbindmobile=True",
    "persons": [
        {
            "id": "urn:li:person:RandomID123456789",
            "displayName": "JOHN DOE",
            "firstName": "JOHN",
            "lastName": "DOE",
            "phoneNumbers": [],
            "headline": "Senior Education Consultant at Generic College",
            "companyName": "Generic College",
            "location": "Random City, Random State, United States",
            "photoUrl": "https://media.licdn.com/dms/image/C4E03AQEaByYCSkSXuA/profile-displayphoto-shrink_400_400/0/1651340361465?e=1695646800&v=beta&t=R2eHGHp5TDPC7DIfY1L2rPxWAqQ42p7Md8k2AbuUO3M",
            "linkedInUrl": "https://linkedin.com/in/john-doe-123456789",
            "reportProfileUrl": "https://linkedin.com/in/john-doe-123456789/report",
            "connectionCount": 22,
            "isConnectionCountObfuscated": false,
            "connectionDegree": "Out_of_Network",
            "connectionStatus": "NotConnected",
            "locale": {
                "country": "us",
                "language": "en"
            },
            "schools": {
                "educationsCount": 0,
                "educationHistory": []
            },
            "positions": {
                "positionsCount": 1,
                "positionHistory": [
                    {
                        "title": "Senior Education Consultant",
                        "startEndDate": {
                            "start": {},
                            "end": {}
                        },
                        "company": {
                            "companyName": "Generic College",
                            "companyLogo": "https://media.licdn.com/dms/image/C560BAQEamcxSpBiiqQ/company-logo_400_400/0/1657471677364?e=1695646800&v=beta&t=9N0sW8lobduAolA9mnFpY1CQqJx6J1eAadWxPJcWDyI",
                            "linkedInUrl": "https://www.linkedin.com/organization/generic-college"
                        },
                        "companyName": "Generic College",
                        "companyLogo": "https://media.licdn.com/dms/image/C560BAQEamcxSpBiiqQ/company-logo_400_400/0/1657471677364?e=1695646800&v=beta&t=9N0sW8lobduAolA9mnFpY1CQqJx6J1eAadWxPJcWDyI",
                        "linkedInUrl": "https://www.linkedin.com/organization/generic-college"
                    }
                ]
            },
            "skillEndorsements": {
                "skillEndorsementsCount": 0,
                "skillEndorsements": []
            },
            "newsMentions": {
                "newsMentionCount": 0,
                "newsMentions": []
            },
            "userGeneratedContents": {
                "userGeneratedContentCount": 2,
                "userGeneratedContents": [
                    {
                        "description": "",
                        "url": "https://www.linkedin.com/feed/update/urn:li:share:randomShareID1",
                        "createdOn": {
                            "month": 10,
                            "year": 2022,
                            "day": 18
                        },
                        "thumbnails": [],
                        "mediaCategory": "NONE"
                    },
                    {
                        "description": "",
                        "url": "https://www.linkedin.com/feed/update/urn:li:share:randomShareID2",
                        "createdOn": {
                            "month": 9,
                            "year": 2022,
                            "day": 5
                        },
                        "thumbnails": [],
                        "mediaCategory": "NONE"
                    }
                ]
            },
            "isPublic": false
        }
    ],
    "joinNowUrl": "https://www.linkedin.com/start/join"
}

```

> Skype

```json
{
    "requestId": "568521",
    "results": [
        {
            "nodeProfileData": {
                "skypeId": "live:.cid.randomid123456",
                "skypeHandle": "live:.cid.randomid123456",
                "name": "John Doe",
                "avatarUrl": "https://api.skype.com/users/live:.cid.randomid123456/profile/avatar",
                "countryCode": "",
                "contactType": "Skype4Consumer",
                "avatarImageUrl": "https://avatar.skype.com/v1/avatars/live:.cid.randomid123456/public?size=l"
            }
        }
    ]
}

```

> Zoho

```json
{
    "lookup": {
        "identifier": "12345678",
        "loginid": "john.doe@examplecorp.com",
        "modes": {
            "allowed_modes": [
                "password",
                "email"
            ],
            "email": {
                "data": [
                    {
                        "e_email": "abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef",
                        "email": "jo**********oe@example****.c**"
                    }
                ],
                "count": 1
            }
        },
        "doc_link": "https://zurl.to/contactadmin_signin",
        "digest": "abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef",
        "admin": "ad&#x2a;&#x2a;&#x2a;&#x2a;in&#x40;example&#x2a;&#x2a;&#x2a;&#x2a;.c&#x2a;&#x2a;",
        "href": "https://accounts.zoho.com/signin/v2/lookup/john.doe@examplecorp.com"
    },
    "status_code": 201,
    "code": "U200",
    "resource_name": "lookup",
    "message": "User exists"
}

```

> GitHub

```json
{
    "total_count": 1,
    "incomplete_results": false,
    "items": [
        {
            "login": "JohnDoe123",
            "id": 1234567,
            "node_id": "MDQ6VXNlcjEyMzQ1Njc=",
            "avatar_url": "https://avatars.githubusercontent.com/u/1234567?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/JohnDoe123",
            "html_url": "https://github.com/JohnDoe123",
            "followers_url": "https://api.github.com/users/JohnDoe123/followers",
            "following_url": "https://api.github.com/users/JohnDoe123/following{/other_user}",
            "gists_url": "https://api.github.com/users/JohnDoe123/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/JohnDoe123/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/JohnDoe123/subscriptions",
            "organizations_url": "https://api.github.com/users/JohnDoe123/orgs",
            "repos_url": "https://api.github.com/users/JohnDoe123/repos",
            "events_url": "https://api.github.com/users/JohnDoe123/events{/privacy}",
            "received_events_url": "https://api.github.com/users/JohnDoe123/received_events",
            "type": "User",
            "site_admin": false,
            "score": 1.0
        }
    ]
}

```

> Teams

```json
{
  "sheam47@hotmail.com": {
    "userProfiles": [
      {
        "isShortProfile": false,
        "phoneHashes": [],
        "emailHashes": [
          "uByCUImVVpqDuiuYGpI3OX8nMRw0JiVaiwSx84EzEx4="
        ],
        "imageUri": "https://substrate.office.com/profile/v1.0/users/cid:358D3FBCDBFA1768/image/$value?hashKey=''",
        "isBlocked": false,
        "cid": "358D3FBCDBFA1768",
        "userPrincipalName": "live:sheam47",
        "givenName": "Séamus",
        "surname": "Moran",
        "phonesInfo": [],
        "emailsInfo": [],
        "displayName": "Séamus Moran",
        "type": "TFLUser",
        "mri": "8:live:sheam47",
        "objectId": "00000000-0000-0000-358d-3fbcdbfa1768"
      }
    ],
    "status": "Success"
  }
}

```

> Yandex

```json
{
  "success": true,
  "verified": false,
  "owner": {
    "uid": "30760636",
    "login": "KoshkA5568",
    "name": "KoshkA5568",
    "avatarHash": "20706/enc-1161bf8603d2abebbac88c75762535ac98eee9008467e0d4eb455d6405be2647",
    "havePlus": null
  },
  "visibility": "public",
  "counts": {
    "likedArtists": 0,
    "likedAlbums": 0
  },
  "hasTracks": true
}

```

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
