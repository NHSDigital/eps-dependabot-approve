
.PHONY: install install-node compile lint test

# these targets should remain as they install pre-commit hooks
install-python:
	poetry install

install-hooks: install-python
	poetry run pre-commit install --install-hooks --overwrite


# these targets should be overwritten once you start coding
# They are needed for quality checks workflow
# install-hooks should remain as a target of install to ensure that pre-commit hooks are installed when the repo is set up

install: install-python install-hooks
	echo "Not implemented yet"

install-node:
	echo "Not implemented yet"
	exit 1

compile:
	echo "Not implemented yet"
	exit 1

lint:
	echo "Not implemented yet"

test:
	echo "Not implemented yet"

# include common targets
%:
	@$(MAKE) -f /usr/local/share/eps/Mk/common.mk $@
