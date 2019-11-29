
NAME := ossrs/srs
TAG := $$(cd ../srs && git describe --tags --abbrev=0 --match "v2.0-*")
IMGS := ${NAME}:${TAG}
LATEST := ${NAME}:2

all: source build

source:
	@echo "Prepare branch"
	@(cd ../srs && git checkout 2.0release && git pull)
	@(cd ../srs && git checkout ${TAG})
	@echo "Compress source files"
	@(cd .. && rm -f srs.tar.bz2 && tar jcf srs.tar.bz2 srs)
	@(rm -f srs.tar.bz2 && mv ../srs.tar.bz2 .)
	@(cd ../srs && git checkout 2.0release)

build: source
	@echo "Build ${TAG}"
	@echo docker build -t ${IMGS} -f Dockerfile .
	@docker build -t ${IMGS} -f Dockerfile .
	@echo docker tag ${IMGS} ${LATEST}
	@docker tag ${IMGS} ${LATEST}
	@echo docker tag ${LATEST} ${NAME}:latest
	@docker tag ${LATEST} ${NAME}:latest

push:
	@echo "Push ${IMGS} ${TAG}"
	@echo docker push ${IMGS}
	@docker push ${IMGS}
	@echo docker push ${LATEST}
	@docker push ${LATEST}
	@echo docker push ${NAME}:latest
	@docker push ${NAME}:latest

variables:
	@echo "NAME: ${NAME}"
	@echo "TAG: ${TAG}"
	@echo "IMGS: ${IMGS}"
	@echo "LATEST: ${LATEST}"
