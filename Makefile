PROJECT = SHORTNAME


.PHONY: clean
clean: clean_py

.PHONY: lint
lint: lint_py

.PHONY: typecheck
typecheck: typecheck_py

.PHONY: tidy
tidy: tidy_py

.PHONY: test
test:
	@echo "No tests configured. Replace this recipe in Makefile to enable."


include Makefile.pyproject
