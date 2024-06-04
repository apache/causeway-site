pushd content
docker run -it --env-file=../algolia.env -e "CONFIG=$(cat ../algolia-config.json | jq -r tostring)" algolia/docsearch-scraper:v1.16.0
popd
