import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../router/router_path.dart';
import '../page_background/page_background.dart';
import 'sign_up_view_model.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final userNameController = useTextEditingController();
    final isDisplay = useState(true);
    return HookConsumer(
      builder: (context, ref, __) {
        return Stack(
          children: [
            const PageBackground(),
            LayoutBuilder(builder: (context, constraints) {
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
                          color: Colors.white,
                          width: constraints.maxWidth * 0.8,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('ユーザー名'),
                            ),
                            controller: userNameController,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.white,
                          width: constraints.maxWidth * 0.8,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('メールアドレス'),
                            ),
                            controller: emailController,
                            obscureText: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.white,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            await ref
                                .read(signUpViewModelProvider.notifier)
                                .signUp(
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
                  ),
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
                      child: Container(
                        color: Colors.white,
                        width: 500,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('ユーザー名'),
                          ),
                          controller: userNameController,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.white,
                        width: 500,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('メールアドレス'),
                          ),
                          controller: emailController,
                          obscureText: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.white,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          await ref
                              .read(signUpViewModelProvider.notifier)
                              .signUp(
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
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
