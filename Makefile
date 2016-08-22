
CWD:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: debian dex
all: debian dex

clean:
	rm -rf $(CWD)/dosemu2_amd64.deb

dex: debian
	cd $(CWD)
	docker build -t briceburg/dosemu2:dex -t briceburg/dosemu2:dex-v1 -f Dockerfile-dex-v1 .

debian: dosemu2_amd64.deb
	cd $(CWD)
	docker build -t briceburg/dosemu2 -t briceburg/dosemu2:debian  -f Dockerfile .

dosemu2_amd64.deb:
	cd $(CWD)
	docker build -t briceburg/dosemu2:build-debian -f Dockerfile-build-debian .
	docker run --rm -v $(CWD):/tmp/vol/ dosemu2-build-debian
