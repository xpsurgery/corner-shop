.PHONY: build run test clean

build:

run:
	@bin/shop.rb

test: build
	rspec --color -fdoc -I.. ../spec

clean:
