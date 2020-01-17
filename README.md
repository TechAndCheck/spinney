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
TBD
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

TBD
