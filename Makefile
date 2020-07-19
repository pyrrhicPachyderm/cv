SHELL := /bin/bash
LATEXMK_FLAGS = --pdf --cd
maindoc := cv
RM := rm -f

all: $(maindoc).pdf

$(maindoc).pdf: $(maindoc).tex address.tex telephone.tex
	latexmk $(LATEXMK_FLAGS) --jobname="$(basename $@)" $<
clean:
	@(\
		shopt -s globstar;\
		$(RM) **/*.aux **/*.fls **/*.log **/*.out;\
		$(RM) **/*.fdb_latexmk;\
	)
	@$(RM) $(maindoc).pdf

.PHONY: all clean

address.tex:
	echo "REDACTED" > $@
telephone.tex:
	echo "REDACTED" > $@
