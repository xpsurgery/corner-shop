.PHONY: build run clean

build:

run:
	@bin/shop.rb

test: build
	rspec --color -fdoc -I.. ../spec

clean:
