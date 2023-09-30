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
    return BasePage(body: _buildBody());
  }

  Widget _buildBody() {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
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
            ElevatedButton(
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
              child: const Text('Sign In'),
            ),
            TextButton(
              onPressed: () => context.go(signUpPath),
              child: const Text('Sign Up'),
            ),
          ],
        );
      },
    );
  }
}
