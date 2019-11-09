DOC = main
default:	$(DOC).pdf

$(DOC).pdf:	*.tex
	pdflatex $(DOC)
	while ( grep "Rerun to get cross-references" $(DOC).log > /dev/null ); do	\
		echo '** Re-running LaTeX **';						\
		pdflatex --interaction errorstopmode $(DOC);				\
	done
	bibtex $(DOC)
	pdflatex $(DOC)
	while ( grep "Rerun to get cross-references" $(DOC).log > /dev/null ); do	\
		echo '** Re-running LaTeX **';						\
		pdflatex --interaction errorstopmode $(DOC);				\
	done

clean:
	rm -r $(DOC).aux $(DOC).bbl $(DOC).blg $(DOC).log $(DOC).out $(DOC).pdf $(DOC).toc
