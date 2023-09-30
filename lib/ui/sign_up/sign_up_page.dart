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
            TextField(
              decoration: const InputDecoration(label: Text('Email')),
              controller: emailController,
            ),
            TextField(
              decoration: const InputDecoration(label: Text('Password')),
              controller: passwordController,
            ),
            TextField(
              decoration: const InputDecoration(label: Text('User Name')),
              controller: userNameController,
            ),
            ElevatedButton(
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
              child: const Text('Sign Up'),
            ),
            TextButton(
              onPressed: () => context.go(signInPath),
              child: const Text('sign in'),
            ),
          ],
        );
      },
    );
  }
}
