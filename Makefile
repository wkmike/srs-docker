.PHONY: all
all: build

.PHONY: build
build:
	docker build --rm -t ziyan/srs .

.PHONY: push
push:
	docker push ziyan/srs
  
