.PHONY: build run clean

build:
	dotnet build

run:
	@dotnet run

test: build
	rspec --color -fdoc -I.. ../spec

clean:
	rm -rf obj bin
