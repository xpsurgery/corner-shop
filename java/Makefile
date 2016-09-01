
SOURCE_DIR  := src
OUTPUT_DIR  := bin

FIND        := find
MKDIR       := mkdir -p
RM          := rm -rf

JFLAGS = -sourcepath $(SOURCE_DIR) -d $(OUTPUT_DIR)
JAVAC = javac
.SUFFIXES: .java .class

all_javas := $(OUTPUT_DIR)/all.javas

.java.class:
	$(JC) $(JFLAGS) $*.java

default: run

.PHONY: all
all: compile

.PHONY: compile
compile: $(all_javas)
	$(JAVAC) $(JFLAGS) @$<

.INTERMEDIATE: $(all_javas)
$(all_javas): $(OUTPUT_DIR)
	$(FIND) $(SOURCE_DIR) -name '*.java' > $@

$(OUTPUT_DIR):
	$(MKDIR) $(OUTPUT_DIR)

clean:
	$(RM) $(OUTPUT_DIR)

run: compile
	@java -classpath $(OUTPUT_DIR) Main.Application

# DO NOT DELETE
