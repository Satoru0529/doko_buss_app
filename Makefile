.PHONY: build_run
build_run: 
	flutter pub run build_runner build --delete-conflicting-outputs

splash_run:
	flutter pub get
    flutter pub run flutter_native_splash:create

run_dev:
	flutter run --dart-define-from-file=dart_defines/dev.json

run_prod:
	flutter run --dart-define-from-file=dart_defines/prod.json

run_stg:
	flutter run --dart-define-from-file=dart_defines/stg.json
