#!/bin/bash
# Sending email with cURL
# This script is based on gmail smtp server

SENDER_NAME="SENDER NAME"
SENDER_EMAIL="SENDER EMAIL ADDRESS"
RECIPIENT_NAME="RECIPIENT NAME"
RECIPIENT_EMAIL="RECIPIENT EMAIL ADDRESS"
SUBJECT="EMAIL SUBJECT"
BODY="EMAIL CONTENT"
APP_PASSWORD="SENDER'S GMAIL APP PASSWORD"

echo "From: $SENDER_NAME <$SENDER_EMAIL>\nTo: $RECIPIENT_NAME <$RECIPIENT_EMAIL>\nSubject: $SUBJECT\n\n" > email.txt
echo "$BODY" >> email.txt

curl \
  --url 'smtps://smtp.gmail.com:465' \
  --ssl-reqd --mail-from "$SENDER_EMAIL" \
  --mail-rcpt "$RECIPIENT_EMAIL" \
  --upload-file email.txt \
  --user "$SENDER_EMAIL:$APP_PASSWORD"
