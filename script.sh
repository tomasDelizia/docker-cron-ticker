docker buildx create \
  --name container-builder \
  --driver docker-container \
  --bootstrap --use

docker buildx build \
--platform linux/amd64,linux/arm64,linux/arm/v7 \
-t tomasdelizia/cron-ticker:latest --push .