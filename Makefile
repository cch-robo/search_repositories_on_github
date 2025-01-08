.PHONY: setup

setup:
	fvm flutter config --no-enable-web
	fvm flutter config --no-enable-windows-desktop
	fvm flutter config --no-enable-linux-desktop
	fvm flutter config --no-enable-macos-desktop
	$(MAKE) tools-install
	$(MAKE) generate

tools-install:
	fvm flutter pub global activate build_runner

generate:
	fvm flutter pub get
	fvm flutter pub run build_runner build -d

clean:
	fvm flutter clean

cache-clean:
	fvm flutter pub cache clean

get:
	fvm flutter pub get

run:
	fvm use
	fvm flutter run

unit-test:
	fvm flutter test test/