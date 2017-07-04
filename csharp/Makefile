OBJDIR := ./obj

.PHONY: build run test clean

build: $(OBJDIR)
	dotnet build

run: build
	@dotnet run

test: build
	rspec --color -fdoc -I.. ../spec

$(OBJDIR):
	dotnet restore

clean:
	rm -rf $(OBJDIR) bin

