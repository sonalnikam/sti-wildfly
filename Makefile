SKIP_SQUASH?=0
VERSIONS="8.1"

ifeq ($(TARGET),centos7)
	OS := centos7
else
	OS := rhel7
endif

ifeq ($(VERSION), 8.1)
	VERSION := 8.1
else
	VERSION :=
endif

.PHONY: build
build:
	SKIP_SQUASH=$(SKIP_SQUASH) VERSIONS=$(VERSIONS) hack/build.sh $(OS) $(VERSION)

.PHONY: test
test:
	SKIP_SQUASH=$(SKIP_SQUASH) VERSIONS=$(VERSIONS) TAG_ON_SUCCESS=$(TAG_ON_SUCCESS) TEST_MODE=true hack/build.sh $(OS) $(VERSION)
