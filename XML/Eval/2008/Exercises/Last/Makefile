#-*-makefile-*-

.RECIPEPREFIX = > # Use '>' instead of TAB for recipes

BASE := last
XSL  := ${BASE:%=%.xsl}
XML  := toc.xml
DTD  := book.dtd

include xmllint.mk
include saxon.mk

.last.valid: toc.xml book.dtd
> ${call xmllint,$<}

last.xml: .last.valid last.xsl
> ${call saxon,$@,toc.xml,last.xsl}

distclean::

%: ;
