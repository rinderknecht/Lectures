#-*-makefile-*-

.RECIPEPREFIX = > # Use '>' instead of TAB for recipes

# Neither built-in/suffix rules nor built-in variables
#
.SUFFIXES:
override MAKEFLAGS +=-Rr

MAIN  := FunObj
JAVA  := Stack.java EStack.java NStack.java BST.java Ext.java Int.java \
         ${MAIN}.java

include javac.mk

%: ;
