SRC_DIR = src

# This has linters,minifiers
TOOL_DIR = tools

PREFIX = .
DEST_DIR = ${PREFIX}/dist

#Add your project's files here. Note we setup our namespaces in Core
SRC_FILES = ${SRC_DIR}/MyProject.Core.js\
			$(SRC_DIR}/MyProject.Functions.js\

MODULES = ${SRC_DIR}/intro.js\
		  ${SRC_FILES}\
		  $(SRC_DIR}/outro.js\
