#-*-makefile-*-

.RECIPEPREFIX = > # Use '>' instead of TAB for recipes

BASE := shuffle1 shuffle2 shuffle3
XSL  := ${BASE:%=%.xsl}
XML  := persons1.xml persons2.xml persons3.xml persons4.xml
DTD  := persons.dtd

include xmllint.mk
include saxon.mk

.shuffle%.valid: shuffle%.xml shuffle%.dtd
> ${call xmllint,$<}

shuffle%_1.xml: .shuffle%.valid
> ${call saxon,$@,shuffle$*.xml,shuffle$*.xsl}

shuffle%_2.xml: .shuffle%.valid
> ${call saxon,$@,shuffle$*.xml,shuffle$*.xsl}

shuffle%_3.xml: .shuffle%.valid
> ${call saxon,$@,shuffle$*.xml,shuffle$*.xsl}

shuffle4_out.xml: shuffle4.xml shuffle4.xsl
> ${call saxon,$@,shuffle4.xml,shuffle4.xsl}

distclean::

%: ;
