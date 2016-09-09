.PHONY: build clean spec

default: spec

LANGUAGES = java csharp ruby

build:
	for d in $(LANGUAGES); do $(MAKE) -C $$d build; done

spec: build
	rspec --color -fdoc

clean:
	-for d in $(LANGUAGES); do $(MAKE) -C $$d clean; done
