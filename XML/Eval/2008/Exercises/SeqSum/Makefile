#-*-makefile-*-

.RECIPEPREFIX = > # Use '>' instead of TAB for recipes

XSL := sum.xsl
XML := sum.xml
DTD := sum.dtd

include xmllint.mk
include saxon.mk

.sum.valid: sum.xml sum.dtd
> ${call xmllint,$<}

sum.txt: .sum.valid sum.xsl
> ${call saxon,$@,sum.xml,sum.xsl}

clean::
> \rm -f .sum.valid

distclean::

%: ;
