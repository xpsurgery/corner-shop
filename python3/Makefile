.PHONY: build run test clean

build:

run:
	./shop.py

test: build
	rspec --color -fdoc -I.. ../spec

clean:
	$(RM) -r **/__pycache__/
	$(RM) **/*.pyc

