.PHONY: build run test clean

FIND     := find
JAVAC    := javac
MKDIR    := mkdir -p
RM       := rm -rf

SOURCE_DIR  := src
OUTPUT_DIR  := bin

JFLAGS = -sourcepath $(SOURCE_DIR) -d $(OUTPUT_DIR)

all_javas := $(OUTPUT_DIR)/all.javas

.PHONY: compile

.INTERMEDIATE: $(all_javas)
$(all_javas): $(OUTPUT_DIR)
	$(FIND) $(SOURCE_DIR) -name '*.java' > $@

$(OUTPUT_DIR):
	$(MKDIR) $(OUTPUT_DIR)

build: $(all_javas)
	$(JAVAC) $(JFLAGS) @$<

run:
	@java -classpath $(OUTPUT_DIR) com.xpsurgery.cornershop.main.Application

test: build
	rspec --color -fdoc -I.. ../spec

clean:
	$(RM) $(OUTPUT_DIR)
