THEME = SELECTED_THEME
ARGS = $(filter-out $@,$(MAKECMDGOALS))

init:
	sh setup/init.sh
block:
	sh setup/blocks.sh
check-version:
	@node themes/$(THEME)/webpack/checkversion
install: check-version
	cd themes/$(THEME) && yarn install $(ARGS)
add: check-version
	cd themes/$(THEME) && yarn add $(ARGS)
dev: check-version
	cd themes/$(THEME) && yarn run dev $(ARGS)
watch: check-version
	cd themes/$(THEME) && yarn run dev $(ARGS)
build: check-version
	cd themes/$(THEME) && yarn run build $(ARGS)
%:;
