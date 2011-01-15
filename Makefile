SRC_DIR = src

# This has linters,minifiers
TOOL_DIR = tools

PREFIX = .
DEST_DIR = $(PREFIX)/dist

SRC_FILES = $(SRC_DIR)/Project.Core.js\
            $(SRC_DIR}/Project.Module1.js\

JS_FILES = $(SRC_DIR)/intro.js\ 
           $(SRC_FILES)\
           $(SRC_DIR}/outro.js\

MERGED_FILE = $(DEST_DIR)/project.js
MINIFIED_FILE = $(DEST_DIR)/project.min.js

RHINO_JAR = $(TOOL_DIR)/rhino/rhino1_7R2/js.jar
CLOSURE_JAR = $(TOOL_DIR)/closure-compiler/compiler.jar


$(DEST_DIR) : 
			@@ mkdir -p $(DEST_DIR)

$(MERGED_FILE) : $(JS_FILES) | $(DEST_DIR)
			@@ echo "Merging " $@
			@@ cat $(JS_FILES) > $@

lint : $(MERGED_FILE)
			@@ java - jar $(RHINO_JAR) $<

$(MINIFED_FILE) : $(MERGED_FILE)
			@@ echo "Minifying file"
			@@ java -jar $(CLOSURE_JAR) --js $< --warning_level=VERBOSE --js_output_file $@

min : $(MINIFIED_FILE)

clean: 
		@@ echo "cleaning"
		@@ rm -f $(MERGED_FILE)
		@@ rm -f $(MINIFIED_FILE)

all: clean lint min 

.PHONY: clean
