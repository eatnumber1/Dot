INSTALL ?= install
MKDIR ?= mkdir
LN ?= ln

JQUERY_RESOURCES := jquery.js jquery.flip.js
RESOURCES := Dot.html Dot.css Dot.js Default.png Icon.png Info.plist $(JQUERY_RESOURCES)
WIDGET := Dot.wdgt

.PHONY: all clean depclean

all: $(WIDGET)

depclean: clean
	$(MAKE) -C jquery clean

clean:
	$(RM) -r $(WIDGET) $(JQUERY_RESOURCES)

$(WIDGET): $(RESOURCES)

jquery/dist/jquery.js:
	$(MAKE) -C jquery V=1 init jquery

jquery.js: jquery/dist/jquery.js
	$(LN) $^ $@

jquery.flip.js:
	$(LN) Flip-Jquery/$@ $@

%.wdgt:
	$(MKDIR) $@
	$(LN) $^ $@ || $(RM) -r $@
