all: update

update:
	git submodule foreach git pull origin master
	git commit --quiet --message "fix: updated plugins" pack/plugins
	cd pack/plugins/start/coc.nvim && yarn && cd -

plugin: _plugin

_plugin:
	@basename="$(notdir $(basename $(url)))"; \
	if test $$basename; then \
		git submodule add $(url) pack/plugins/start/$$basename; \
		git commit pack/plugins/start/$$basename .gitmodules --message \
			"feat: $$basename as a submodule"; \
	else \
		echo "usage: make plugin url=..."; \
	fi

.PHONY: all update plugin
