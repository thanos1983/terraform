curl --silent "https://api.cloudflare.com/client/v4/zones/$ZONEID/dns_records?per_page=50000" --header "Authorization: Bearer $BEARER_TOKEN" | jq --raw-output '.result[].id' | while read id
do
  curl --silent --request DELETE "https://api.cloudflare.com/client/v4/zones/$ZONEID/dns_records/$id" --header "Authorization: Bearer $BEARER_TOKEN"
done