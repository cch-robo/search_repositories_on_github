.PHONY: setup

setup:
	fvm flutter config --no-enable-web
	fvm flutter config --no-enable-windows-desktop
	fvm flutter config --no-enable-linux-desktop
	fvm flutter config --no-enable-macos-desktop

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