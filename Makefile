# Makefile for linting R code

# Define the R command to be used
R = Rscript

# Target to install required packages
# Specify the CRAN mirror
CRAN_MIRROR = "https://cloud.r-project.org"

# Target to install required packages
install-packages:
	$(R) -e "if (!requireNamespace('lintr', quietly = TRUE)) install.packages('lintr', repos = '$(CRAN_MIRROR)')"

# Target to run lintr
lint: install-packages
	$(R) -e "if (!requireNamespace('lintr', quietly = TRUE)) install.packages('lintr', repos = '$(CRAN_MIRROR)'); lintr::lint_package()"

# Target to clean (optional, depends on what you want to clean)
clean:
	rm -rf .Rproj.user
	rm -rf .Rhistory
	rm -rf .RData
	rm -rf .lintr

# Default target
all: lint

.PHONY: install-packages lint clean all
