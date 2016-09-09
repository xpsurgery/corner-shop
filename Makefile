.PHONY: build clean test

default: test

LANGUAGES = java csharp ruby

build:
	for d in $(LANGUAGES); do $(MAKE) -C $$d build; done

test: build
	rspec --color -fdoc

clean:
	-for d in $(LANGUAGES); do $(MAKE) -C $$d clean; done
