#-*-makefile-*-

.RECIPEPREFIX = > # Use '>' instead of TAB for recipes

BASE := max1 max2 max3
XSL  := ${BASE:%=%.xsl}
XML  := numbers.xml
DTD  := numbers.dtd

include xmllint.mk
include saxon.mk

.max%.valid: max%.xml max%.dtd
> ${call xmllint,$<}

max%.txt: .max%.valid max%.xsl
> ${call saxon,$@,max$*.xml,max$*.xsl}

distclean::

%: ;
