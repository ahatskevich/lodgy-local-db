DOCKER_IMAGE=dynamo-local
CONTAINER_NAME=dynamo-local-container
PORT=8000

dynamo:
	docker build --platform linux/amd64 -t $(DOCKER_IMAGE) .
	docker run -d --name $(CONTAINER_NAME) -p $(PORT):8000 $(DOCKER_IMAGE)

stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true