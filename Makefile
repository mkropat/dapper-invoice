# Makefile forked from Mike Wilcox's resume project Makefile [1]
#
# [1] https://github.com/mjw56/mike-wilcox-latex-resume/blob/master/Makefile

.SUFFIXES: .tex .pdf

.PHONY : default install uninstall clean pdf watch

REPORT = example
SHOW = $(REPORT)

$(REPORT).pdf: $(REPORT).tex dapper-invoice.cls

default: pdf

pdf: $(REPORT:%=%.pdf)

.tex.pdf:
	xelatex $* && xelatex $*

watch: pdf
	@echo watching \'$(SHOW).tex\' to run \'$(MAKE) pdf\'
	@ruby -e "file = '$(SHOW).tex'" \
		-e "command = '$(MAKE) pdf'" \
		-e "lm = File.mtime file" \
		-e "while true do" \
		-e " m = File.mtime file" \
		-e " system command unless m==lm" \
		-e " lm = m" \
		-e " sleep 0.25" \
		-e "end"

install: dapper-invoice.cls
	mkdir -p "$$(kpsewhich -expand-var '$$TEXMFHOME')/tex/latex/base"
	cp -a $? "$$(kpsewhich -expand-var '$$TEXMFHOME')/tex/latex/base/"

uninstall:
	rm -f "$$(kpsewhich -expand-var '$$TEXMFHOME')/tex/latex/base/dapper-invoice.cls"

clean:
	rm -rf $(REPORT:%=%.aux) $(REPORT:%=%.bbl) $(REPORT:%=%.blg)
	rm -rf $(REPORT:%=%.log) $(REPORT:%=%.toc) $(REPORT:%=%.dvi)
	rm -rf $(REPORT:%=%.ind) $(REPORT:%=%.ilg) $(REPORT:%=%.nls)
	rm -rf $(REPORT:%=%.nlo) $(REPORT:%=%.out)
	rm -rf $(REPORT:%=%.pdf)
