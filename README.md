# Spinney

Spinney is a [Puppeteer](https://github.com/puppeteer/puppeteer/)-as-a-service app
designed to be a headless Rails app that proxies the appropriate request to Puppeteer
via the [Grover](https://github.com/Studiosity/grover) gem, and returns the rendered
result. It is designed to run on the Heroku and AWS free tiers (probably).

Its only initial requirement is to take HTML input and spit out a JPEG, but we'd like
to support the entire Grover configuration surface as early as possible.

# Setup

TBD

# Request Format
POST /convert
```
{
	"api_key": "xxxxxxxxxxxxxxxxxx",
	"html": "<html><body>Hello world</body></html>"
}
```

# Response Format
TBD
```
{
    "image_data": "/9j/4AAQSkZJRgABAQAAAQABAAD/4gIoSUNDX1BST0ZJTEUAAQEAAAIYAAAA\nAAIQAABtbnRyUkdCIFhZWiAAAAAAAAAAAAAAAABhY3NwAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLQAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlkZXNjAAAA8AAA\nAHRyWFlaAAABZAAAABRnWFlaAAABeAAAABRiWFlaAAABjAAAABRyVFJDAAAB\noAAAAChnVFJDAAABoAAAAChiVFJDAAABoAAAACh3dHB0AAAByAAAABRjcHJ0\nAAAB3AAAADxtbHVjAAAAAAAAAAEAAAAMZW5VUwAAAFgAAAAcAHMAUgBHAE...."
}
```

# API Key management

API keys are managed through Rake tasks. This means that you must have access to the command line of the machine running Spinney. Since this is a backend-facing product that's the easiest to handle at the moment.

## Rake Tasks

### List

List all api keys in the system

###### Sample Command
`rails keys:list`

###### Sample Response
```
id: 1 | name: Kevin Glendalough | last_used: 2020-01-17T02:31:08 | key: 5d6daacd76019e39eb49b5a6b4ebaf7e
id: 2 | name: Ciarán Saigir     | last_used: 2020-01-17T02:31:08 | key: 5d6daacd76019e39eb49b5a6b4ebaf7e
```

### Create

Create a new api key

###### Sample Command
`rails keys:new[Elfodd Gwynedd]`

###### Sample Response
```
New key generated ⚙️
--------------------------------------------
id: 2 | name: Elfodd Gwynedd | last_used: Never | key: e984ddb6e40706014acfe206bdc59c21
```

### Delete

Delete an api key

###### Sample Command
`rails keys:delete[12]`

###### Sample Response
```
Successfully deleted key #2
```

# Development

TBD

Note: All sample names in the documentation should be those of Celtic bishops or saints prior to romanization of the church.
In cases where no surname is known, add the city of birth or known city of origin.
You can find some here: https://en.wikipedia.org/wiki/Celtic_Christianity
