SHELL:= /bin/zsh
CSS:= css/style1.css
INDEX=index.org
INDEXHTML=$(INDEX:.org=.html)
NOTES:=notes
ORG=*.org
ORGHTML=$(ORG:.org=.html)

all:
	echo ------------- $(INDEX) ---------------; \
	emacs $(INDEX) --batch -f org-html-export-to-html --kill; \
	vim -c '$d' -c "wq" $(INDEXHTML); \
	cat ./postamble.txt >> $(INDEXHTML)\
	echo "</html>" >> $(INDEXHTML); \
	cd $(NOTES); \
	for i in $(ORG); do \
		echo ------------- $$i ---------------; \
		emacs ./$$i --batch -f org-html-export-to-html --kill; \
	done; \
	for i in $(ORGHTML); do \
		echo ------------- $$i ---------------; \
		vim -c '$d' -c "wq" $$i; \
		cat ../postamble.txt >> $$i; \
		echo "</html>" >> $$i; \
	done; \
	cd ..


clean:
	rm *~; \
	cd $(NOTES); \
	rm *~; \
	cd ..
