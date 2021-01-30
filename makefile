SHELL = /bin/bash -o pipefail
export REGISTRY_HOSTNAME = docker.io
export REGISTRY_ACCOUNT = tullo
export VERSION = 1.0

passgen:
	@docker buildx build -f dockerfile \
		-t $(REGISTRY_HOSTNAME)/$(REGISTRY_ACCOUNT)/passgen-amd64:$(VERSION) .

push:
	@docker image push $(REGISTRY_HOSTNAME)/$(REGISTRY_ACCOUNT)/passgen-amd64:$(VERSION)
