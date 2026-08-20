#-*-makefile-*-

.RECIPEPREFIX = > # Use '>' instead of TAB for recipes

XSL := merge1.xsl merge2.xsl
XML := ordered_lists.xml
DTD := list.dtd

include xmllint.mk
include saxon.mk

.merge%.valid: merge%.xml merge%.dtd
> ${call xmllint,$<}

merge%.txt merge%_out.xml: .merge%.valid merge%.xsl
> ${call saxon,$@,merge$*.xml,merge$*.xsl}

distclean::

%: ;
