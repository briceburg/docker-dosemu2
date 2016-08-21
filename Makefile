
CWD:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: debian
all: debian

clean:
	rm -rf $(CWD)/dosemu2_amd64.deb

debian: dosemu2_amd64.deb
	cd $(CWD)
	docker build -t dosemu2 -f Dockerfile .

dosemu2_amd64.deb:
	cd $(CWD)
	docker build -t dosemu2-debsrc -f Dockerfile-debsrc .
	docker run --rm -v $(CWD):/tmp/vol/ dosemu2-debsrc
