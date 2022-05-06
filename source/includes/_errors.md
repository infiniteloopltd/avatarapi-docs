# Errors

The API will return a HTTP 200 Status code for all results, however, the JSON payload 
will contain a `"success" : false` attribute in the event of failure. Common failure reasons
could be that an email address did not match with any provider, or a login failure, or out
of credit. The error text will return the last error in the chain of providers.

> A failed search will return JSON such as the following

```json
{
    "success": false,
    "error": "Not found"
}
```