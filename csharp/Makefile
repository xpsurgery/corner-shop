.PHONY: build run test clean

build:
	dotnet build

run: build
	@dotnet run

test: build
	rspec --color -fdoc -I.. ../spec

clean:
	rm -rf obj bin
