.PHONY: build
build: 
	flutter pub run build_runner build --delete-conflicting-outputs

splash:
    flutter pub get
    flutter pub run flutter_native_splash:create
