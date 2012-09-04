all: update helptags

update:
	git submodule foreach git pull origin master
	git commit --quiet --message "Updated bundles" bundle

helptags:
	vim -c 'call pathogen#helptags()|q'
