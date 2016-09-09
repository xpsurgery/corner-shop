
default: spec

build:
	$(MAKE) -C java build
	$(MAKE) -C csharp build
	$(MAKE) -C ruby build

.PHONY: spec
spec: build
	rspec --color -fdoc
