#-*-makefile-*-

.RECIPEPREFIX = > # Use '>' instead of TAB for recipes

BASE    := squeeze
TARGETS := ${BASE:%=%.xml}
XSL     := squeeze.xsl
XML     := numbers.xml
DTD     := numbers.dtd

include xmllint.mk
include saxon.mk

.numbers.valid: numbers.xml numbers.dtd
> ${call xmllint,$<}

${TARGETS}: .numbers.valid squeeze.xsl
> ${call saxon,$@,numbers.xml,squeeze.xsl}

distclean::

%: ;
