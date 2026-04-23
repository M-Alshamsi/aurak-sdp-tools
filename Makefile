# edit `template' to `main' or whatever your file is called
REPORT ?= template
TEX := $(REPORT).tex
PDF := $(REPORT).pdf
INCLUDED := \
						dictionary.tex \
						frontmatter.tex \
						glossary.tex \
						raci.tex \
						chapters/ch1/ch1.tex \
						chapters/ch2/ch2.tex \
						chapters/ch3/ch3.tex \
						chapters/ch4/ch4.tex \
						chapters/ch5/ch5.tex \
						chapters/ch6/ch6.tex \
						chapters/ch7/ch7.tex \
						chapters/ch8/ch8.tex \
						chapters/ch9/ch9.tex

LATEXMK_FLAGS = -lualatex \
								-interaction=nonstopmode \
								-synctex=1 \

build: $(PDF)

$(PDF): $(TEX) $(INCLUDED)
	latexmk $(LATEXMK_FLAGS) $(TEX)

cleanbuild: fullclean build

clean:
	latexmk -c
	rm -f $(REPORT).mtc* $(REPORT).bbl $(REPORT).maf padnum.lua style.ist

fullclean: clean
	latexmk -C
