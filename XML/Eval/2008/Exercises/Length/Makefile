#-*-makefile-*-

.RECIPEPREFIX = > # Use '>' instead of TAB for recipes

BASE := toc0 toc1 toc2 toc3
XSL  := length0.xsl length1.xsl length2.xsl length3.xsl
XML  := toc.xml toc_att.xml
DTD  := book.dtd book_att.dtd

include xmllint.mk
include saxon.mk

.toc%.valid: toc%.xml book%.dtd
> ${call xmllint,$<}

toc%.txt: .toc%.valid length%.xsl
> ${call saxon,$@,toc$*.xml,length$*.xsl}

distclean::

%: ;
