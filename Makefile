.PHONY: build
## Build runner を走らせる 
## Terminal で make build と入力し叩くと、以下のコマンドが自動的に実行される
build: 
	flutter pub run build_runner build --delete-conflicting-outputs

