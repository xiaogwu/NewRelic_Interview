Sample API to send an email. 

Use with the following command

curl -X POST http://localhost:4567/send -d '{ "to": "John Doe <johndoe@example.com>", "subject": "hello world", "body": "Hi John! Sending you an email via this awesome API I just made on the interwebs." }'

or if you like better  wget 

wget -O- --post-data='{ "to": "John Doe <johndoe@example.com>", "subject": "hello world", "body": "Hi John! Sending you an email via this awesome API I just made on the interwebs." }' "http://localhost:4567/send"
