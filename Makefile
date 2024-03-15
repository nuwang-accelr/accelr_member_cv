
PDF_DIR = ./pdf
WORK_DIR = ./work
TEX_FILES = $(shell find ./ -name "*.tex")
PDF_FILES = $(patsubst ./%.tex, $(PDF_DIR)/%.pdf, $(TEX_FILES))

all: $(PDF_FILES)
	@echo "========== PDF creation done !!! ========"

$(PDF_DIR)/%.pdf: ./%.tex
	@echo "========== Creating $@ ========"
	@mkdir -p $(PDF_DIR) $(WORK_DIR)
	@pdflatex -output-directory=$(WORK_DIR) $<
	@mv $(WORK_DIR)/*.pdf $(PDF_DIR)

clean:
	@rm -rf *.aux *.fdb_latexmk *.fls *.log *.out *.synctex.gz *.pdf $(PDF_DIR) $(WORK_DIR)

