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
	$(eval CAMEL_CASE=$(shell echo $(SNAKE_CASE) | awk -F_ 'BEGIN{OFS="";} {for(i=1;i<=NF;i++) $$i=(i==1?tolower(substr($$i,1,1)):toupper(substr($$i,1,1))) tolower(substr($$i,2));}1'))

	@# ローキャメルケースからアッパーキャメルケースに変換
	$(eval UPPER_CAMEL_CASE=$(shell echo $(CAMEL_CASE) | awk '{print toupper(substr($$0,1,1)) substr($$0,2)}'))

	@# ファイルパスを作成
	$(eval FILE_PATH=lib/data/model/$(SNAKE_CASE).dart)

	@# テンプレートから新しいファイルを作成
	cp template/template_model.txt $(FILE_PATH)

	@# model.dartに挿入
	echo "export '$(SNAKE_CASE).dart';" >> lib/data/model/model.dart

	@# プレースホルダーを置換
	sed -i '' 's/TemplateTpl/$(UPPER_CAMEL_CASE)/g' $(FILE_PATH)
	sed -i '' 's/templateTpl/$(CAMEL_CASE)/g' $(FILE_PATH)
	sed -i '' 's/template_tpl/$(SNAKE_CASE)/g' $(FILE_PATH)

c-view:
	@# スネークケースを定義
	$(eval SNAKE_CASE=$(nm))

	@# スネークケースからローキャメルケースに変換
	$(eval CAMEL_CASE=$(shell echo $(SNAKE_CASE) | awk -F_ 'BEGIN{OFS="";} {for(i=1;i<=NF;i++) $$i=(i==1?tolower(substr($$i,1,1)):toupper(substr($$i,1,1))) tolower(substr($$i,2));}1'))

	@# ローキャメルケースからアッパーキャメルケースに変換
	$(eval UPPER_CAMEL_CASE=$(shell echo $(CAMEL_CASE) | awk '{print toupper(substr($$0,1,1)) substr($$0,2)}'))

	@# 指定されたスネークケースの名前でフォルダを作成（既に存在していてもエラーにならない）
	mkdir -p lib/ui/$(SNAKE_CASE)

	@# ファイルパスを作成
	$(eval DIC_PATH=lib/ui/$(SNAKE_CASE))

	@# ビューファイルパスを作成
	$(eval VIEW_PATH=$(DIC_PATH)/$(SNAKE_CASE)_view.dart)

	@# ビューモデルファイルパスを作成
	$(eval VIEW_MODEL_PATH=$(DIC_PATH)/$(SNAKE_CASE)_view_model.dart)

	@# テンプレートからビューファイルを作成
	cp template/template_page.txt $(VIEW_PATH)

	@# テンプレートからビューモデルファイルを作成
	cp template/template_view_model.txt $(VIEW_MODEL_PATH)

	@# model.dartに挿入
	echo "const String $(CAMEL_CASE)Path = '/$(SNAKE_CASE)';" >> lib/router/router_path.dart

	@# プレースホルダーを置換
	sed -i '' 's/TemplateTpl/$(UPPER_CAMEL_CASE)/g' $(VIEW_PATH) $(VIEW_MODEL_PATH)
	sed -i '' 's/templateTpl/$(CAMEL_CASE)/g' $(VIEW_PATH) $(VIEW_MODEL_PATH)
	sed -i '' 's/template_tpl/$(SNAKE_CASE)/g' $(VIEW_PATH) $(VIEW_MODEL_PATH)

c-repo:
	@# スネークケースを定義
	$(eval SNAKE_CASE=$(nm))

	@# スネークケースからローキャメルケースに変換
	$(eval CAMEL_CASE=$(shell echo $(SNAKE_CASE) | awk -F_ 'BEGIN{OFS="";} {for(i=1;i<=NF;i++) $$i=(i==1?tolower(substr($$i,1,1)):toupper(substr($$i,1,1))) tolower(substr($$i,2));}1'))

	@# ローキャメルケースからアッパーキャメルケースに変換
	$(eval UPPER_CAMEL_CASE=$(shell echo $(CAMEL_CASE) | awk '{print toupper(substr($$0,1,1)) substr($$0,2)}'))

	@# ディレクトリパスを作成
	$(eval DIC_PATH=lib/data/repository)

	@# リポジトリファイルパスを作成
	$(eval REPOSITORY_PATH=$(DIC_PATH)/$(SNAKE_CASE)_repository.dart)

	@# リポインプルファイルパスを作成
	$(eval REPO_IMPL_PATH=$(DIC_PATH)/$(SNAKE_CASE)_rempository_impl.dart)

	@# テンプレートからリポジトリファイルを作成
	cp template/template_repository.txt $(REPOSITORY_PATH)

	@# テンプレートからリポジトリインプルファイルを作成
	cp template/template_repository_impl.txt $(REPO_IMPL_PATH)

	@# repository.dartに挿入
	echo "export $(REPOSITORY_PATH);" >> lib/data/repository/repository.dart

	@# プレースホルダーを置換
	sed -i '' 's/TemplateTpl/$(UPPER_CAMEL_CASE)/g' $(REPOSITORY_PATH) $(REPO_IMPL_PATH)
	sed -i '' 's/templateTpl/$(CAMEL_CASE)/g' $(REPOSITORY_PATH) $(REPO_IMPL_PATH)
	sed -i '' 's/template_tpl/$(SNAKE_CASE)/g' $(REPOSITORY_PATH) $(REPO_IMPL_PATH)
