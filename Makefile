
default: spec

LANGUAGES = java csharp ruby

.PHONY: subdirs $(LANGUAGES)

subdirs: $(LANGUAGES)

$(LANGUAGES):
	$(MAKE) -C $@ build

build: $(LANGUAGES)

.PHONY: spec
spec: build
	rspec --color -fdoc

clean:
	-for d in $(LANGUAGES); do (cd $$d; $(MAKE) clean ); done
