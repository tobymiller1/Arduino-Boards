-include libraries/Kaleidoscope-Plugin/build/rules.mk

build-all: travis-test

travis-test: travis-install-arduino
	TRAVIS_ARDUINO_PATH=$(TRAVIS_ARDUINO_PATH) perl build-tools/test-recursively travis-test
	TRAVIS_ARDUINO_PATH=$(TRAVIS_ARDUINO_PATH) perl build-tools/test-recursively cpplint

checkout-submodules:
	git submodule update --init --recursive

maintainer-update-submodules:
	git submodule update --recursive --remote --init

git-pull:
	git pull

blindly-commit-updates: git-pull maintainer-update-submodules
	git commit -a -m 'Blindly pull all plugins up to current'
	git push


