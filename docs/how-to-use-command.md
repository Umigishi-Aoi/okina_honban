## 自動生成コマンドの使い方

#### UI関連のファイルを自動生成する

以下のコマンドを叩くことでView関連のファイルを自動生成しています。

```
// 構文: make c-view nm=View名(スネークケース:〇〇_〇〇)
// 例: nm=dragon_quest
okina_honban$ make c-view nm=dragon_quest
```

以下のようにファイルが更新されたり、自動生成されるので編集しましょう

```
// lib/router/router.dart
+ import 'package:okina_honban/ui/dragon_quest/dragon_quest_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okina_honban/router/router_path.dart';

import '../ui/home/home_page.dart';

final router = GoRouter(
  initialLocation: homePath,
  routes: [
    // INSERT ROUTE HERE

+    GoRoute(
+        path: dragonQuestPath,
+        pageBuilder: (context, state) => const MaterialPage(child: DragonQuestPage()),
+    ),
    GoRoute(
      path: homePath,
      pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
    ),
  ],
);
```

```
// lib/router/router_path.dart
const String homePath = '/';
+ const String dragonQuestPath = '/dragon_quest';
```

```
// lib/ui配下にnm=〇〇_〇〇と形式でフォルダが作成されます
// フォルダ内に`〇〇_〇〇_page.dart`,`〇〇_〇〇_view_model.dart`が作成されるので編集しましょう
lib
└── ui
+　└── dragon_quest
+        └── dragon_quest_page.dart
+        └── dragon_quest_view_model.dart
```

#### 状態管理のためにModelを自動生成する

以下のコマンドを叩くことでmodel関連のファイルを自動生成しています。

```
// 構文: make c-model nm=View名(スネークケース:〇〇_〇〇)
// 例: nm=dragon_quest
okina_honban$ make c-model nm=dragon_quest
```

以下のようにファイルが更新されたり、自動生成されるので編集しましょう。

```
// lib/data/model.dart
export 'result.dart';
+ export 'dragon_quest.dart';
```

```
// lib/data/model内に`〇〇_〇〇.dart`が作成されるので編集しましょう
lib
└── data
　└── model
+        └── dragon_quest.dart
```

モデルとして自動生成するクラスは`freezed`を使うことになります。

```
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dragon_quest.freezed.dart';

part 'dragon_quest.g.dart';

@freezed
class DragonQuest with _$DragonQuest {
  const factory DragonQuest({
    // TODO: ここにフィールドを追加する
  }) = _DragonQuest;

  const DragonQuest._();

  factory DragonQuest.fromJson(Map<String, dynamic> json) =>
      _$DragonQuestFromJson(json);
}
```

自動生成時はフィールドが用意されてないため、フィールドを追加してください。
またフィールドを追加したら下記コマンドを叩く必要があります。

```
make build
```

#### Repository関連のファイルを自動生成する

```
// 構文: make c-repo nm=View名(スネークケース:〇〇_〇〇)
// 例: nm=dragon_quest
make c-repo nm=dragon_quest
```

以下のようにファイルが更新されたり、自動生成されるので編集しましょう。

```
// lib/repositoryフォルダ内に`〇〇_〇〇_page.dart`,`〇〇_〇〇_view_model.dart`が作成されるので編集しましょう
lib
└── repository
+      └── dragon_quest_repository_impl.dart
+      └── dragon_quest_rempository.dart
```

```
// lib/repository/repository.dart
export 'user_repository.dart';
+ export 'dragon_quest_repository.dart';
```

repositoryの詳細な書き方はここでは省略しますが、デモのソースコードが用意されているので参考にしましょう。

[feature/pokemon](https://github.com/Umigishi-Aoi/okina_honban/tree/feature/pokemon)

#### View, Model, Repository関連のファイル全てを自動生成する

以下のコマンドを叩くことで上記で扱っているファイル全てを自動生成できます。

```
make all nm=dragon_quest
```

or

```
// コマンドが長いので上記コマンド推奨
make c-view c-model c-repo nm=dragon_quest
```