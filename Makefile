INSTALL ?= install
CP ?= cp
MKDIR ?= mkdir

RESOURCES := Default.png Dot.html Icon.png Info.plist
WIDGET := Dot.wdgt

.PHONY: all clean

all: $(WIDGET)

clean:
	$(RM) -r $(WIDGET)

$(WIDGET): $(RESOURCES)

%.wdgt:
	$(MKDIR) $@
	$(CP) -r $^ $@ || $(RM) -r $@
