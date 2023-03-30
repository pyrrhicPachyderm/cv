SHELL := /bin/bash
LATEXMK_FLAGS = --pdf --cd
maindoc := cv
RM := rm -f

all: $(maindoc).pdf

supporting_tex_files := address.tex telephone.tex bibliography/references.bib reference-styles/ecology.tex reference-styles/authoryear.tex

$(maindoc).pdf: $(maindoc).tex $(supporting_tex_files)
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

bibliography/% reference-styles/% &:
	git submodule update --init
