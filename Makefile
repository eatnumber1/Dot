INSTALL ?= install
CP ?= cp
MKDIR ?= mkdir

RESOURCES := Default.png Dot.html Icon.png Info.plist

.PHONY: all clean

all: Dot.wdgt

clean:
	$(RM) -r Dot.wdgt

Dot.wdgt: WDGT_RESOURCES := $(RESOURCES)

%.wdgt: $(WDGT_RESOURCES)
	$(MKDIR) $@
	$(CP) -r $(RESOURCES) $@
