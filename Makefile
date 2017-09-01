SHELL:= /bin/zsh
CSS:= css/style1.css
INDEX:=index.org
NOTES:=notes
ORGS:=*.org

all:
	emacs $(INDEX) --batch -f org-html-expot-to-html --kill; \
	cd $(NOTES); \
	for i in $(ORGS); do \
		emacs $$i --batch -f org-html-expot-to-html --kill; \
	done; \
	cd ..


clean:
	rm *~; \
	cd $(NOTES); \
	rm *~; \
	cd ..
