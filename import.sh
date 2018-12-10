#!/bin/bash

ls
echo $TOKEN
echo $ID

rm server.js
rm import.sh
rm README.md
rm .env
rm package.json

wget -qO- \
  --header "Authorization: export ${TOKEN}" \
  "https://bramble.mofostaging.net/en-US/projects/${ID}/export/data" \
  | tar -xv
  
curl -X PUT \
  -H "Authorization: export ${TOKEN}" \
  "https://bramble.mofostaging.net/en-US/projects/${ID}/export/finish"

rm -f .wget-hsts
refresh
