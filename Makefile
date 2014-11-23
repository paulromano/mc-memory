slides = mc-memory

all: build/${slides}.pdf

build/${slides}.pdf: ${slides}.tex references.bib
	mkdir -p build
	pdflatex --output-directory=build -halt-on-error $<
	bibtex build/${slides}
	pdflatex --output-directory=build -halt-on-error $<
	pdflatex --output-directory=build -halt-on-error $<

clean:
	@rm -rf build

.PHONY: all images clean
