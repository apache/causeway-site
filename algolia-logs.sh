
. algolia.env
#echo "APPLICATION_ID=$APPLICATION_ID"
#echo "API_KEY=$API_KEY"
curl -s --request GET \
  --url "https://$APPLICATION_ID.algolia.net/1/logs?offset=0&length=10&indexName=products&type=all" \
  --header 'accept: application/json' \
  --header "x-algolia-api-key: $API_KEY" \
  --header "x-algolia-application-id: $APPLICATION_ID"
