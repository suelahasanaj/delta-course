import 'package:auto_route/auto_route.dart';
import 'package:delta/application/bloc/auth-bloc/auth_bloc.dart';
import 'package:delta/router/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  Future<void> signIn() async {
    setState(() {
      isLoading = true;
    });
    await AuthBloc()
        .signInWithCred(
          email: usernameController.text,
          password: passwordController.text,
        )
        .then((res) => res == 'success' ? AutoRouter.of(context).replace(const HomePageRoute()) : null);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            CupertinoListSection.insetGrouped(
              backgroundColor: Colors.transparent,
              additionalDividerMargin: 0,
              dividerMargin: 0,
              header: Center(
                child: Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.all(15),
                  child: Image.asset('assets/images/logo_alternate.png'),
                ),
              ),
              footer: Center(
                child: CupertinoButton(
                  child: const Text('Sign up'),
                  onPressed: () => AutoRouter.of(context).replace(const SignupPageRoute()),
                ),
              ),
              children: [
                CupertinoTextFormFieldRow(
                  controller: usernameController,
                  prefix: const Text('Username'),
                ),
                CupertinoTextFormFieldRow(
                  obscureText: true,
                  controller: passwordController,
                  prefix: const Text('Password'),
                ),
              ],
            ),
            Center(
              child: CupertinoButton.filled(
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text('Login'),
                onPressed: () => signIn(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
