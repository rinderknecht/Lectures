#-*-makefile-*-

.RECIPEPREFIX = > # Use '>' instead of TAB for recipes

BASE := rev1 rev2
XSL  := ${BASE:%=%.xsl}
XML  := toc.xml
DTD  := book.dtd

include xmllint.mk
include saxon.mk

.rev%.valid: rev%.xml rev%.dtd
> ${call xmllint,$<}

rev%_out.xml: .rev%.valid
> ${call saxon,$@,rev$*.xml,rev$*.xsl}

rev%_out.html: .rev%.valid
> ${call saxon,$@,rev$*.xml,rev$*.xsl}

distclean::

%: ;
