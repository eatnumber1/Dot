INSTALL ?= install
MKDIR ?= mkdir
LN ?= ln -f

GENERATED_RESOURCES := jquery.js jquery.flip.js modernizr.js jquery.cookie.js
RESOURCES := Dot.html Dot.css Dot.js Default.png Icon.png Info.plist $(GENERATED_RESOURCES)

.PHONY: all clean depclean

all: Dot.wdgt

depclean: clean
	$(MAKE) -C jquery clean

clean:
	$(RM) -r Dot.wdgt $(GENERATED_RESOURCES)

jquery/dist/jquery.js:
	$(MAKE) -C jquery V=1 init jquery

jquery.js: jquery/dist/jquery.js
	$(LN) $^ $@

jquery.flip.js:
	$(LN) Flip-Jquery/$@ $@

modernizr.js:
	$(LN) Modernizr/$@ $@

jquery.cookie.js:
	$(LN) jquery-cookie/$@ $@

Dot.wdgt: $(RESOURCES)
	$(RM) -r $@
	$(MKDIR) $@
	$(LN) $^ $@ || $(RM) -r $@
