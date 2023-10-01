import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../router/router_path.dart';
import '../base/base.dart';
import 'sign_in_view_model.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage(
        appBar: const BaseAppBar(
          showBackButton: false,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isDisplay = useState(true);
    return HookConsumer(
      builder: (context, ref, __) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 100, 8, 8),
                    child: SizedBox(
                      width: constraints.maxWidth * 0.8,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('メールアドレス'),
                        ),
                        controller: emailController,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: constraints.maxWidth * 0.8,
                      child: TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: isDisplay.value == true
                              ? IconButton(
                                  icon: const Icon(Icons.visibility),
                                  onPressed: () {
                                    isDisplay.value = !isDisplay.value;
                                  },
                                )
                              : IconButton(
                                  icon: const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    isDisplay.value = !isDisplay.value;
                                  },
                                ),
                          border: const OutlineInputBorder(),
                          label: const Text('パスワード'),
                        ),
                        controller: passwordController,
                        obscureText: isDisplay.value,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {}, child: const Text('パスワードをお忘れですか？')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        await ref.read(signInViewModelProvider.notifier).signIn(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                        if (!context.mounted) {
                          return;
                        }
                        context.go(homePath);
                      },
                      child: const Text('サインイン'),
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.go(signUpPath),
                    child: const Text('アカウント作成'),
                  ),
                ],
              );
            }
            return SizedBox(
              width: constraints.maxWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 100, 8, 8),
                    child: SizedBox(
                      width: 500,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('メールアドレス'),
                        ),
                        controller: emailController,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 500,
                      child: TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: isDisplay.value == true
                              ? IconButton(
                                  icon: const Icon(Icons.visibility),
                                  onPressed: () {
                                    isDisplay.value = !isDisplay.value;
                                  },
                                )
                              : IconButton(
                                  icon: const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    isDisplay.value = !isDisplay.value;
                                  },
                                ),
                          border: const OutlineInputBorder(),
                          label: const Text('パスワード'),
                        ),
                        controller: passwordController,
                        obscureText: isDisplay.value,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {}, child: const Text('パスワードをお忘れですか？')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        await ref.read(signInViewModelProvider.notifier).signIn(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                        if (!context.mounted) {
                          return;
                        }
                        context.go(homePath);
                      },
                      child: const Text('サインイン'),
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.go(signUpPath),
                    child: const Text('アカウント作成'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
