# Send Mail API

Sample API to send an email. 

Use with the following command

JSON format

```shell
curl -H "Content-Type: application/json" -X POST http://localhost:4567/send -d '{ "to": "John Doe <johndoe@example.com>", "subject": "hello world", "body": "Hi John! Sending you an email via this awesome API I just made on the interwebs." }'
```


HTTP format

```shell
curl -X POST http://localhost:4567/send -d 'to=John Doe <johndoe@example.com>&subject=hello world&body=Hi John! Sending you an email via this awesome API I just made on the interwebs'
```
