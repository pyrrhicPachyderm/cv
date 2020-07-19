SHELL := /bin/bash
LATEXMK_FLAGS = --pdf --cd
maindoc := cv
RM := rm -f

all: $(maindoc).pdf

$(maindoc).pdf: $(maindoc).tex address.tex telephone.tex
	latexmk $(LATEXMK_FLAGS) --jobname="$(basename $@)" $<
clean:
	@latexmk $(LATEXMK_FLAGS) -c -silent
	@(\
		shopt -s globstar;\
		$(RM) **/*.bbl **/*.run.xml **/*.auxlock;\
		$(RM) **/*.dep **/*.dpth **/*.log **/*.md5 **/*-figure*.pdf;\
		$(RM) **/*-cropped.pdf;\
	)
	@$(RM) $(maindoc).pdf

.PHONY: all clean

address.tex:
	echo "REDACTED" > $@
telephone.tex:
	echo "REDACTED" > $@
