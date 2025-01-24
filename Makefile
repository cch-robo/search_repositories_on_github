.PHONY: setup

setup:
	fvm use
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

lint-check:
	fvm flutter analyze

get:
	fvm flutter pub get

run:
	fvm use
	fvm flutter run

unit-test:
	fvm flutter test test/

build-debug-apk:
	fvm use
	fvm flutter build apk --debug

#build-apk:
#	fvm use
#	fvm flutter build apk --release

#build-bundle:
#	fvm use
#	fvm flutter build appbundle --release

#build-ios:
#	fvm use
#	fvm flutter build ios --release