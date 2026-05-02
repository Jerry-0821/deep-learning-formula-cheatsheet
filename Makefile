.PHONY: pdf clean distclean

pdf:
	latexmk -pdf main.tex

clean:
	rm -f *.aux *.log *.out *.toc *.fls *.fdb_latexmk *.synctex.gz *.bbl *.blg *.run.xml *.bcf *.xdv

distclean: clean
	rm -f main.pdf
