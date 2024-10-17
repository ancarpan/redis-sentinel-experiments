# Targets for Docker builds
build_redis: Dockerfile.redis
	docker build -f Dockerfile.redis -t pdns-redis:latest .

# A combined target to build both images
build: build_redis

# Phony targets so they always run
.PHONY: build build_redis