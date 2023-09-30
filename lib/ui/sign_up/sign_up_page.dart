import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../router/router_path.dart';
import '../base/base.dart';
import 'sign_up_view_model.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage(body: _buildBody());
  }

  Widget _buildBody() {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final userNameController = useTextEditingController();
    return HookConsumer(
      builder: (context, ref, __) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 100, 8, 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('ユーザー名'),
                ),
                controller: userNameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('メールアドレス'),
                ),
                controller: emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('パスワード'),
                ),
                controller: passwordController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  await ref.read(signUpViewModelProvider.notifier).signUp(
                        email: emailController.text,
                        password: passwordController.text,
                        userName: userNameController.text,
                      );
                  if (!context.mounted) {
                    return;
                  }
                  context.go(homePath);
                },
                child: const Text('アカウント作成'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () => context.go(signInPath),
                child: const Text('サインイン'),
              ),
            ),
          ],
        );
      },
    );
  }
}
