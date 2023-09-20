w:
	flutter pub get
	flutter packages pub run build_runner watch --delete-conflicting-outputs

clean:
## Flutter cache
	rm ios/Podfile.lock | true
## ios Pod Lock file
	rm -rf ios/Pods | true
	rm ios/Flutter/Flutter.podspec | true
## pod cache
	rm -rf ~/Library/Developer/Xcode/DerivedData/ | true
## Xcode cache
	rm pubspec.lock | true
	flutter clean
	flutter pub get
build:
	flutter pub get
	flutter packages pub run build_runner build --delete-conflicting-outputs
rel:
	flutter run --release

## generate file
c-model:
	@# スネークケースを定義
	$(eval SNAKE_CASE=$(nm))

	@# スネークケースからローキャメルケースに変換
	$(eval CAMEL_CASE=$(shell echo $(SNAKE_CASE) | awk -F_ '{for(i=1;i<=NF;i++) $$i=toupper(substr($$i,1,1)) tolower(substr($$i,2));}1' | sed 's/ //g'))

	@# ローキャメルケースからアッパーキャメルケースに変換
	$(eval UPPER_CAMEL_CASE=$(shell echo $(CAMEL_CASE) | awk '{print toupper(substr($$0,1,1)) substr($$0,2)}'))

	@# ファイルパスを作成
	$(eval FILE_PATH=lib/data/model/$(SNAKE_CASE).dart)

	@# テンプレートから新しいファイルを作成
	cp template/template_model.txt $(FILE_PATH)

	@# model.dartに挿入
	echo "\nexport '$(SNAKE_CASE).dart';" >> lib/data/model/model.dart

	@# プレースホルダーを置換
	sed -i '' 's/TemplateTpl/$(UPPER_CAMEL_CASE)/g' $(FILE_PATH)
	sed -i '' 's/templateTpl/$(CAMEL_CASE)/g' $(FILE_PATH)
	sed -i '' 's/template_tpl/$(SNAKE_CASE)/g' $(FILE_PATH)
