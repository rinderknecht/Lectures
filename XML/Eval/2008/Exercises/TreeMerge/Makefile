#-*-makefile-*-

.RECIPEPREFIX = > # Use '>' instead of TAB for recipes

BASE := tmerge
XSL  := ${BASE:%=%.xsl}
XML  := num.xml

# Note: There is no DTD.

include saxon.mk

%.txt: %.xml %.xsl
> ${call saxon,$@,tmerge.xml,tmerge.xsl}

distclean::

%: ;
