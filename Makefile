INSTALL ?= install
MKDIR ?= mkdir
LN ?= ln -f
ANT ?= ant

GENERATED_RESOURCES := jquery.js jquery.flip.js modernizr.js jquery.cookie.js jquery-ui.js
RESOURCES := Dot.html Dot.css Dot.js Default.png Default_reverse.png Icon.png Info.plist $(GENERATED_RESOURCES)

.PHONY: all clean depclean

all: Dot.wdgt

depclean: clean
	$(MAKE) -C jquery clean
	cd jquery-ui/build
	$(ANT) clean

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

jquery-ui/build/dist/jquery-ui-1.9pre/ui/jquery-ui.js:
	cd jquery-ui/build
	$(ANT) concatenate
	
jquery-ui.js: jquery-ui/build/dist/jquery-ui-1.9pre/ui/jquery-ui.js
	$(LN) $^ $@

jquery.cookie.js:
	$(LN) jquery-cookie/$@ $@

Dot.wdgt: $(RESOURCES)
	$(RM) -r $@
	$(MKDIR) $@
	$(LN) $^ $@ || $(RM) -r $@
