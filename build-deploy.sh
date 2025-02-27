docker build . -t ghcr.io/enydreio/enydreio
echo "${GITHUB_TOKEN}" | docker login ghcr.io -u "${GITHUB_ACTOR}" --password-stdin
docker push ghcr.io/enydreio/enydreio