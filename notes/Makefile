SHELL:= /bin/zsh
all:org

org:*.org
	for file in $^; do \
		echo ------------- $$file ---------------; \
		emacs ./$$file --batch -f org-html-export-to-html --kill; \
	done; \
	$(MAKE) html

html:*.html
	for file in $^; do \
	echo ------------- $$file ---------------; \
	vim -c '$d' -c "wq" $$file; \
	cat ../tools/postamble.txt >> $$file; \
	echo "</html>" >> $$file; \
	done

clean:
	rm *~
