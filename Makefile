TARGET=paper
TEXFILE=paper.tex
BUILD=build
PDFLATEXFLAGS=-file-line-error -halt-on-error -jobname=$(BUILD) -synctex=-1
DEPS=$(BUILD).deps
# Optional external helper that translates synctex from WSL to Windows paths.
SYNCTEX_FILTER := $(shell which synctex_filter.py)

all: $(TARGET).pdf

.DELETE_ON_ERROR:

# To build the paper, we run latexmk, which knows how to run pdflatex and bibtex as many times as necessary.
.INTERMEDIATE: $(BUILD).pdf $(BUILD).synctex
$(BUILD).pdf $(BUILD).synctex $(DEPS):
	latexmk -pdf -recorder -M -MF $(DEPS) $(PDFLATEXFLAGS) $(TEXFILE)

# Once build.pdf is finished, rename it to $(TARGET).pdf
# This avoids PDF readers refreshing multiple times as the file is rewritten by intermediate latex runs.
$(TARGET).pdf $(TARGET).synctex: $(BUILD).pdf $(BUILD).synctex
	$(if $(SYNCTEX_FILTER),$(SYNCTEX_FILTER) $(BUILD).synctex $(TARGET).synctex,mv $(BUILD).synctex $(TARGET).synctex)
	mv $(BUILD).pdf $(TARGET).pdf

clean:
	$(RM) $(BUILD).* $(TARGET).pdf $(TARGET).synctex $(DEPS)

# Include dependencies emitted by latexmk
ifneq ($(MAKECMDGOALS),clean)
-include $(DEPS)
endif
