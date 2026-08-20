#-*-makefile-*-

.RECIPEPREFIX = > # Use '>' instead of TAB for recipes

BASE := sum1 sum2
XSL  := ${BASE:%=%.xsl}
XML  := numbers.xml
DTD  := numbers.dtd

include xmllint.mk
include saxon.mk

.sum%.valid: sum%.xml sum%.dtd
> ${call xmllint,$<}

sum%.txt: .sum%.valid sum%.xsl
> ${call saxon,$@,sum$*.xml,sum$*.xsl}

distclean::

%: ;
