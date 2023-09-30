import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/router/router_path.dart';
import 'package:okina_honban/ui/base/base.dart';
import 'package:okina_honban/ui/sign_up/sign_up_view_model.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

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
              onPressed: () async =>
                  await ref.read(signUpViewModelProvider.notifier).signUp(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
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