check-version:
	@node themes/mercury/webpack/checkversion
install: check-version
	yarn
dev: check-version
	yarn run dev
build: check-version
	yarn run build