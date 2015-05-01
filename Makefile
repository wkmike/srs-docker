.PHONY: all
all: build

.PHONY: build
build:
	docker build --rm -t ossrs/srs .

.PHONY: push
push:
	docker push ossrs/srs
  
