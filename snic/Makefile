MY_DATE := $(strip $(shell date +"%F_%H_%M_%S"))
LATEXDIFF=./latexdiff-so

ifeq ($(OS),Windows_NT)
$(warning Windows NT detected "$(USER)")
DVI = yap
DVIBIN = yap
DISTILL = "$(HOME)"/bin/acrodist.exe

PREFIX=c:\\cygwin\\home\\$(USER)\\papers\\2008SASP-arsenal\\
ACROREAD = "$(HOME)"/bin/acroread.exe
ALL = show_nt
else # mac

ifeq ($(USER),mbt)
ALL = show_nt
ACROREAD = kpdf
else
ALL =  pdf
endif

endif


TEX=$(wildcard *.tex)
FIGS=$(wildcard Figures/*.pdf)
GRAPHS=$(wildcard Graphs/*.pdf)

PDF_TARGETS= paper.pdf
GENERATED = draft.tex rev.tex draft.pdf paper.pdf diff-preamble.tex diff-preamble-new.tex

.PHONY: test_build clean

all: $(ALL)

paper.pdf:  $(TEX) $(GRAPHS) $(FIGS) Makefile paper.bib

paper.ps: paper.pdf
	pdftops paper.pdf paper.ps

singlefile.tex: $(filter-out singlefile.tex,$(TEX))
	echo "" > singlefile.tex
	while read line; do if [ "`echo $$line | grep '^\\input{' | tr '{' ' ' | tr '}' ' ' | awk '{print $$2}'`" == "" ]; then echo $$line >> singlefile.tex; else cat `echo $$line | grep '^\\input{' | tr '{' ' ' | tr '}' ' ' | awk '{print $$2}'`.tex >> singlefile.tex; fi; done < paper.tex

draft.tex: paper.tex Makefile
	perl -ne 's/title\{/title\{r\\input\{rev\}: /g; s/^(\\(numberofauthors|conference|Copy))/\%$$1/; s/texheader/draftheader/g; print' < $< >  $@ || rm -f $@

.PHONY: update_rev
update_rev:
	@REV=$$(svn info * */* 2>&1 | grep "Last Changed Rev" | sort -k4 -n | tail -n 1 | awk '{print $$4}');\
	OLDREV=$$(cat rev.tex);\
	if [ "$$REV" != "$$OLDREV" ]; then svn info * */* 2>&1 | grep "Last Changed Rev" | sort -k4 -n | tail -n 1 | awk '{print $$4}' > rev.tex; fi

.PHONY: draft
draft:
	svn update
	make draft.pdf

draft.pdf: draft.tex update_rev $(TEX) $(GRAPHS) $(FIGS) Makefile paper.bib draftheader.tex


.PHONY: diff
diff: diff-preamble.tex singlefile.tex
	-@rm -rf diffsrc
	-@mkdir -p diffsrc
	@if [ "$$REV" == "" ]; then \
	   echo using head revision, override with REV=1234; \
	   REV=$$(svn info * */* 2>&1 | grep "Last Changed Rev" | sort -k4 -n | tail -n 1 | awk '{print $$4}'); \
	 fi; \
	 SVNURL=$$(svn info | grep URL | awk '{print $$2}'); cd diffsrc; svn co -N -r $$REV $$SVNURL .;
	$(LATEXDIFF) --append-context2cmd="tabcolsep" --flatten --type=UNDERLINE diffsrc/paper.tex paper.tex > diff.tex;
	@mv diff.tex diff2.tex		
	@cat singlefile.tex | grep 'begin{document}' -B99999 | grep -v 'begin{document}' > diff.tex
	@cat diff-preamble.tex >> diff.tex
	@cat diff2.tex | grep 'begin{document}' -A99999 >> diff.tex
	@make diff.pdf
	@rm -rf diffsrc
	@rm diff.tex diff2.tex diff.blg diff.log

diff-new: diff-preamble-new.tex singlefile.tex
	-@rm -rf diffsrc
	-@mkdir -p diffsrc
	@if [ "$$REV" == "" ]; then \
	   echo using head revision, override with REV=1234; \
	   REV=$$(svn info * */* 2>&1 | grep "Last Changed Rev" | sort -k4 -n | tail -n 1 | awk '{print $$4}'); \
	 fi; \
	 SVNURL=$$(svn info | grep URL | awk '{print $$2}'); cd diffsrc; svn co -N -r $$REV $$SVNURL .;
	$(LATEXDIFF) --append-context2cmd="tabcolsep" --flatten --type=UNDERLINE diffsrc/paper.tex paper.tex > diff.tex;
	@cat diff.tex | awk -v RS='(\\\\DIFdelbegin |\\\\DIFdelend )' -v ORS= 'NR%2' > diff2.tex
	@cat singlefile.tex | grep 'begin{document}' -B99999 | grep -v 'begin{document}' > diff.tex
	@cat diff-preamble-new.tex >> diff.tex
	@cat diff2.tex | grep 'begin{document}' -A99999 >> diff.tex
	@make diff.pdf
	@rm -rf diffsrc
	@rm diff.tex diff2.tex diff.blg diff.log

diff.pdf: diff.tex $(FIGURES) $(GRAPHS) Makefile paper.bib


test_build:
	rm -rf _test_build
	mkdir _test_build
	(REPO=$$(svn info | grep URL | sed 's/URL: //');\
	 DIR=$$(svn info | grep URL | sed 's/.*\///');\
	 cd _test_build; \
	 svn checkout $$REPO;\
	 cd $$DIR;\
	 make;\
	 open paper.pdf;\
	)	

%_abbrv.bib: %.bib
	./abbrv.py $< $@

pdf: $(PDF_TARGETS)

%.aux : %.tex $(TEX_STUFF)
	pdflatex $(PDFLATEX_BATCH_OPTIONS) $* 

%.bbl : %.aux 
	bibtex $* || true

%.pdf : %.bbl
	pdflatex $(PDFLATEX_BATCH_OPTIONS) $*
	pdflatex $(PDFLATEX_BATCH_OPTIONS) $*

#
# copies file to prevent write-after-read problems
# uses date as suffix.
#
show_nt: pdf
	- killall $(ACROREAD)
	cp paper.pdf paper_$(MY_DATE).pdf
	$(ACROREAD) $(PREFIX)paper_$(MY_DATE).pdf &

clean:
	rm -rf *.aux *.log *.bbl *.blg *.out $(GENERATED)
	rm -rf paper_abbrv.bib 
	rm -rf _test_build

.PHONY: mailme
mailme: draft.pdf pdf
	@REV=$$(svn info * */* 2>&1 | grep "Last Changed Rev" | sort -k4 -n | tail -n 1 | awk '{print $$4}');\
	CLEAN=$$(if [ "`svn diff | wc -l`" == "0" ]; then echo ""; else echo " modified"; fi);\
	EMAIL=$$(finger `whoami` | head -n1 | tr ' ' '\n' | grep @ | tr '<' ' ' | tr '>' ' ');\
	URL=$$(svn info | grep URL | head -n1);\
	URLSHORT=$$(echo $$URL | tr '/' '\n' | tail -n 1);\
	echo -e "Paper from\n$$URL\nRev: $$REV $$CLEAN\nBuild: $$(date)" | mutt -s "Paper $$URLSHORT @ $$REV $$CLEAN" -a paper.pdf -a draft.pdf $$EMAIL;\
	echo Paper emailed to $$EMAIL



diff-preamble.tex: Makefile
	@echo '\RequirePackage[normalem]{ulem}                                 ' > $@
	@echo '\providecommand{\DIFadd}[1]{{\protect\color{blue}\uwave{#1}}}   ' >> $@
	@echo '\providecommand{\DIFdel}[1]{{\protect\color{red}\sout{#1}}}     ' >> $@
	@echo '\providecommand{\DIFaddbegin}{}                                 ' >> $@
	@echo '\providecommand{\DIFaddend}{}                                   ' >> $@
	@echo '\providecommand{\DIFdelbegin}{}                                 ' >> $@
	@echo '\providecommand{\DIFdelend}{}                                   ' >> $@
	@echo '\providecommand{\DIFaddFL}[1]{\DIFadd{#1}}                      ' >> $@
	@echo '\providecommand{\DIFdelFL}[1]{\DIFdel{#1}}                      ' >> $@
	@echo '\providecommand{\DIFaddbeginFL}{}                               ' >> $@
	@echo '\providecommand{\DIFaddendFL}{}                                 ' >> $@
	@echo '\providecommand{\DIFdelbeginFL}{}                               ' >> $@
	@echo '\providecommand{\DIFdelendFL}{}                                 ' >> $@


diff-preamble-new.tex: Makefile
	@echo '\RequirePackage[normalem]{ulem}                                 ' > $@
	@echo '\usepackage{comment}                                            ' >> $@
	@echo '\excludecomment{DIFdelregion}                                   ' >> $@
	@echo '\providecommand{\DIFadd}[1]{{\protect\color{blue}\uwave{#1}}}   ' >> $@
	@echo '\providecommand{\DIFdel}[1]{{\protect\color{red}\sout{#1}}}     ' >> $@
	@echo '\providecommand{\DIFaddbegin}{}                                 ' >> $@
	@echo '\providecommand{\DIFaddend}{}                                   ' >> $@
	@echo '\providecommand{\DIFaddFL}[1]{\DIFadd{#1}}                      ' >> $@
	@echo '\providecommand{\DIFdelFL}[1]{\DIFdel{#1}}                      ' >> $@
	@echo '\providecommand{\DIFaddbeginFL}{}                               ' >> $@
	@echo '\providecommand{\DIFaddendFL}{}                                 ' >> $@
	@echo '\providecommand{\DIFdelbeginFL}{}                               ' >> $@
	@echo '\providecommand{\DIFdelendFL}{}                                 ' >> $@



