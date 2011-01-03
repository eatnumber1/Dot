INSTALL ?= install
MKDIR ?= mkdir
LN ?= ln -f

RESOURCES := Dot.html Dot.css Dot.js Default.png Icon.png Info.plist jquery/dist/jquery.js Flip-Jquery/jquery.flip.js Modernizr/modernizr.js jquery-cookie/jquery.cookie.js

.PHONY: all clean depclean

all: Dot.wdgt

depclean: clean
	$(MAKE) -C jquery clean

clean:
	$(RM) -r Dot.wdgt

jquery/dist/jquery.js:
	$(MAKE) -C jquery V=1 init jquery

Dot.wdgt: $(RESOURCES)
	$(RM) -r $@
	$(MKDIR) $@
	$(LN) $^ $@ || $(RM) -r $@
