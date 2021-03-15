THEME = gallium
ARGS = $(filter-out $@,$(MAKECMDGOALS))

init:
	sh scripts/install.sh
# check-version:
# 	@node themes/$(THEME)/webpack/checkversion
# install: check-version
# 	cd themes/$(THEME) && yarn install $(ARGS)
# add: check-version
# 	cd themes/$(THEME) && yarn add $(ARGS)
# dev: check-version
# 	cd themes/$(THEME) && yarn run dev $(ARGS)
# build: check-version
# 	cd themes/$(THEME) && yarn run build $(ARGS)
# %:;
