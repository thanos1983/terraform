zoneid=$1
bearer=$2
curl --silent "https://api.cloudflare.com/client/v4/zones/$zoneid/dns_records?per_page=50000" --header "Authorization: Bearer $bearer" | jq --raw-output '.result[].id' | while read id
do
  curl --silent --request DELETE "https://api.cloudflare.com/client/v4/zones/$zoneid/dns_records/$id" --header "Authorization: Bearer $bearer"
done