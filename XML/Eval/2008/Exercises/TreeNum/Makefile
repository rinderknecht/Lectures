#-*- makefile -*-

.RECIPEPREFIX = > # Use '>' instead of TAB for recipes

BASE := num1 num2 num3
XSL  := ${BASE:%=%.xsl}
XML  := toc.xml
DTD  := book.dtd

include xmllint.mk
include saxon.mk

.num%.valid: num%.xml num%.dtd
> ${call xmllint,$<}

num%.html: num%.xml num%.xsl
> ${call saxon,$@,num$*.xml,num$*.xsl}

distclean::

%: ;
