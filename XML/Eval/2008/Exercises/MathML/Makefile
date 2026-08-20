#-*-makefile-*-

.RECIPEPREFIX = > # Use '>' instead of TAB for recipes

BASE := math1 math2 math3
XSL  := infix.xsl prefix1.xsl prefix2.xsl
XML  := ${BASE:%=%.xml}

include xmllint.mk
include saxon.mk

# Note: There is no DTD.

%_pref1.txt: %.xml prefix1.xsl
> ${call saxon,$@,$<,prefix1.xsl}

%_pref2.txt: %.xml prefix2.xsl
> ${call saxon,$@,$<,prefix2.xsl}

%_inf.txt: %.xml infix.xsl
> ${call saxon,$@,$<,infix.xsl}

distclean::

%: ;
