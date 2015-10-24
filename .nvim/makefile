ycm = bundle/YouCompleteMe

all: update helptags build-ycm

update:
	# YCM often breaks if its submodules are at HEAD
	git submodule foreach \
		'[ $$path != $(ycm) ] && git pull origin master || exit 0'
	# Ensure YCM checks out the correct commit of its submodules
	cd $(ycm) && git pull origin master
	git commit --quiet --message "Updated bundles" bundle

build-ycm:
	cd $(ycm) && ./install.sh

helptags:
	vim -c 'call pathogen#helptags()|q'

bundle: _bundle helptags

_bundle:
	@basename="$(notdir $(basename $(url)))"; \
	if test $$basename; then \
		git submodule add $(url) bundle/$$basename; \
		git commit bundle/$$basename .gitmodules --message \
			"Added $$basename as a submodule"; \
	else \
		echo "usage: make bundle url=..."; \
	fi

.PHONY: all update helptags bundle build-ycm
