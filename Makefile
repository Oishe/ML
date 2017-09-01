SHELL:= /bin/zsh
IORG:=index.org
IHTML:=index.html
NOTES=notes

all:$(IORG)
	echo ------------- $(IORG) ---------------; \
	emacs $(IORG) --batch -f org-html-export-to-html --kill; \
	vim -c '$d' -c "wq" $(IHTML); \
	cat ./tools/postamble.txt >> $(IHTML); \
	echo "</html>" >> $(IHTML)
	echo ------------- $(NOTES) ---------------; \
	$(MAKE) -C $(NOTES)

clean:
	echo ------------- CLEAN ---------------; \
	rm *~; \
	$(MAKE) -C $(NOTES) clean
