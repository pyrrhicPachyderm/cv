SHELL := /bin/bash
LATEXMK_FLAGS = --pdf --cd
maindoc := cv
RM := rm -f

all: $(maindoc).pdf

$(maindoc).pdf: $(maindoc).tex
	latexmk $(LATEXMK_FLAGS) --jobname="$(basename $@)" $<
pvc: $(maindoc).pdf
	latexmk $(LATEXMK_FLAGS) --jobname="$(basename $<)" $< --pvc
clean:
	@latexmk $(LATEXMK_FLAGS) -c -silent
	@(\
		shopt -s globstar;\
		$(RM) **/*.bbl **/*.run.xml **/*.auxlock;\
		$(RM) **/*.dep **/*.dpth **/*.log **/*.md5 **/*-figure*.pdf;\
		$(RM) **/*-cropped.pdf;\
	)
Clean: clean
	@$(RM) $(maindoc).pdf

.PHONY: all pvc clean Clean
