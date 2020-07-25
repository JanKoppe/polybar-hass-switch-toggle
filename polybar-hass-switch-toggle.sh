#!/bin/sh

TOKEN=""
BASE_URL=""

ENTITY_NAME="input_boolean.hs7"

STATE=$(curl -s -H "Authorization: Bearer ${TOKEN}" -H 'Content-Type: application/json' "${BASE_URL}/api/states/${ENTITY_NAME}" | jq -r ".state")
if [ "${1:x}" == "toggle" ]
then
  if [ "${STATE:x}" == "off" ]
  then
    STATE=$(curl -s -X POST -H "Authorization: Bearer ${TOKEN}" -H 'Content-Type: application/json' "${BASE_URL}/api/states/${ENTITY_NAME}" -d '{"state": "on"}' | jq -r ".state")
  else
    STATE=$(curl -s -X POST -H "Authorization: Bearer ${TOKEN}" -H 'Content-Type: application/json' "${BASE_URL}/api/states/${ENTITY_NAME}" -d '{"state": "off"}' | jq -r ".state")
  fi
fi

echo $STATE
