#-*-makefile-*-

.RECIPEPREFIX = > # Use '>' instead of TAB for recipes

BASE    := height1 height2 height3 height4
XSL     := ${BASE:%=%.xsl}
XML     := toc.xml
DTD     := book.dtd

include xmllint.mk
include saxon.mk

.height%.valid: height%.xml height%.dtd
> ${call xmllint,$<}

height%.txt: .height%.valid height%.xsl
> ${call saxon,$@,height$*.xml,height$*.xsl}

distclean::

%: ;
