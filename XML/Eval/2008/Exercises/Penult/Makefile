#-*-makefile-*-

.RECIPEPREFIX = > # Use '>' instead of TAB for recipes

BASE := penult
XSL  := ${BASE:%=%.xsl}
XML  := toc.xml
DTD  := book.dtd

include xmllint.mk
include saxon.mk

.penult.valid: toc.xml book.dtd
> ${call xmllint,$<}

penult.xml: .penult.valid penult.xsl
> ${call saxon,$@,toc.xml,penult.xsl}

distclean::

%: ;
