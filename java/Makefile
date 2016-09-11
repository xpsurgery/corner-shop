.PHONY: build run clean

FIND     := find
JAVAC    := javac
MKDIR    := mkdir -p
RM       := rm -rf

SOURCE_DIR  := src
OUTPUT_DIR  := bin

JFLAGS = -sourcepath $(SOURCE_DIR) -d $(OUTPUT_DIR)

all_javas := $(OUTPUT_DIR)/all.javas

default: all

.PHONY: all
all: compile run

.PHONY: compile
compile: $(all_javas)
	$(JAVAC) $(JFLAGS) @$<

.INTERMEDIATE: $(all_javas)
$(all_javas): $(OUTPUT_DIR)
	$(FIND) $(SOURCE_DIR) -name '*.java' > $@

$(OUTPUT_DIR):
	$(MKDIR) $(OUTPUT_DIR)

build: compile

run:
	@java -classpath $(OUTPUT_DIR) com.xpsurgery.cornershop.main.Application

clean:
	$(RM) $(OUTPUT_DIR)
