#-*-makefile-*-

.RECIPEPREFIX = > # Use '>' instead of TAB for recipes

BASE     := csv1 csv2 csv3
XSL      := ${BASE:%=%.xsl}
XML_BASE := csv csv_att
XML      := ${XML_BASE:%=%.xml}
DTD      := ${XML_BASE:%=%.dtd}

include xmllint.mk
include saxon.mk

.csv%.valid: csv%.xml csv%.dtd
> ${call xmllint,$<}

csv%.txt: .csv%.valid csv%.xsl
> ${call saxon,$@,csv$*.xml,csv$*.xsl}

distclean::

%: ;
