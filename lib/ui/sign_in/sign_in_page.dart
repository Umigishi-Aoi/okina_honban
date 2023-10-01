import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../router/router_path.dart';
import '../page_background/page_background.dart';
import 'sign_in_view_model.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: _buildBody(), resizeToAvoidBottomInset: false);
  }

  Widget _buildBody() {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isDisplay = useState(true);
    return HookConsumer(
      builder: (context, ref, __) {
        return Stack(
          children: [
            const PageBackground(),
            LayoutBuilder(
              builder: (context, constraints) {
                /// 600px以下の場合
                if (constraints.maxWidth < 600) {
                  return SizedBox(
                    width: constraints.maxWidth,
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 100, 8, 8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
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
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
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
                            onPressed: () {},
                            child: const Text('パスワードをお忘れですか？')),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              await ref
                                  .read(signInViewModelProvider.notifier)
                                  .signIn(
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
                }

                /// 600px以上の場合
                return SizedBox(
                  width: constraints.maxWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 100, 8, 8),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
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
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
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
                            await ref
                                .read(signInViewModelProvider.notifier)
                                .signIn(
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
            ),
          ],
        );
      },
    );
  }
}
