.PHONY: all
all: build

.PHONY: build
build:
	docker build --rm -t ossrs/srs:1.0.beta .

.PHONY: push
push:
	docker push ossrs/srs:1.0.beta
  
