# VK API JSON Schema

This repository contains JSON Schema documents explaining all the VK.COM API objects and methods mentioned [here](https://vk.com/dev).

JSON Schema standard specifications and the most common usage scenarios could be found here: http://json-schema.org/ 

These schemes are compatible with JSON Schema version draft-06 and VK API [version](https://vk.com/dev/versions) 5.80.

[![Packagist](https://img.shields.io/packagist/v/vkcom/vk-api-schema.svg)](https://packagist.org/packages/vkcom/vk-api-schema)

## Structure

Repository contains four .json files. 
* "methods.json" describes all of VK API methods (could be found at [this page](https://vk.com/dev/methods)).
* "objects.json" describes objects which are used in methods responses.
* "responses.json" describes methods responses structure.
* "schema.json" describes additional keywords used in our implementation, such as "method", "error", "parameter" and others so to extend the canonical specification for our needs. 

## Samples

### users.get method description:

```JSON
{
      "name": "users.get",
      "description": "Returns detailed information on users.",
      "open": true,
      "parameters": [
        {
          "name": "user_ids",
          "description": "User IDs or screen names ('screen_name'). By default, current user ID.",
          "type": "array",
          "items": {
            "type": "string"
          },
          "maxItems": 1000
        },
        {
          "name": "domains",
          "type": "array",
          "items": {
            "type": "string"
          }
        },
        {
          "name": "fields",
          "description": "Profile fields to return. Sample values: 'nickname', 'screen_name', 'sex', 'bdate' (birthdate), 'city', 'country', 'timezone', 'photo', 'photo_medium', 'photo_big', 'has_mobile', 'contacts', 'education', 'online', 'counters', 'relation', 'last_seen', 'activity', 'can_write_private_message', 'can_see_all_posts', 'can_post', 'universities';",
          "type": "array",
          "items": {
            "type": "string"
          }
        },
        {
          "name": "name_case",
          "description": "Case for declension of user name and surname:; 'nom' — nominative (default); 'gen' — genitive ; 'dat' — dative; 'acc' — accusative ; 'ins' — instrumental ; 'abl' — prepositional",
          "type": "string"
        }
      ],
      "responses": {
        "response": {
          "$ref": "responses.json#/definitions/users_get_response"
        }
      }
    }
```

### market_market_album object description:

```JSON
"market_market_album": {
      "type": "object",
      "properties": {
        "id": {
          "type": "integer",
          "description": "Market album ID",
          "minimum": 1
        },
        "owner_id": {
          "type": "integer",
          "description": "Market album owner's ID"
        },
        "title": {
          "type": "string",
          "description": "Market album title"
        },
        "count": {
          "type": "integer",
          "description": "Items number",
          "minimum": 0
        },
        "updated_time": {
          "type": "integer",
          "description": "Date when album has been updated last time in Unixtime",
          "minimum": 0
        },
        "photo": {
          "$ref": "#/definitions/photos_photo"
        }
      },
      "required": [
        "id",
        "owner_id",
        "title",
        "count",
        "updated_time"
      ],
      "additionalProperties": false
    }
```


