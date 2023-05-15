import 'package:auto_route/auto_route.dart';
import 'package:delta/application/bloc/auth-bloc/auth_bloc.dart';
import 'package:delta/router/router.gr.dart';
import 'package:delta/utils/messengers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController organizationController = TextEditingController();

  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  Future<void> signUp() async {
    setState(() {
      isLoading = true;
    });
    if (passwordController.text == confirmPasswordController.text) {
      await AuthBloc()
          .signUp(
        email: usernameController.text,
        password: passwordController.text,
        organization: organizationController.text,
      )
          .then((res) {
        if (kDebugMode) {
          print(res);
        }
        if (res == 'success') {
          AutoRouter.of(context).replace(const HomePageRoute());
        } else {
          showSnackBar(
            res,
            context,
            Colors.black,
          );
        }
      });
    }
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
                  child: const Text('Login'),
                  onPressed: () => AutoRouter.of(context).replace(const AuthPageRoute()),
                ),
              ),
              children: [
                CupertinoTextFormFieldRow(
                  controller: usernameController,
                  prefix: const Text('Username'),
                ),
                CupertinoTextFormFieldRow(
                  controller: organizationController,
                  prefix: const Text('Organization'),
                ),
                CupertinoTextFormFieldRow(
                  obscureText: true,
                  controller: passwordController,
                  prefix: const Text('Password'),
                ),
                CupertinoTextFormFieldRow(
                  obscureText: true,
                  controller: confirmPasswordController,
                  prefix: const Text('Confirm Password'),
                ),
              ],
            ),
            Center(
              child: CupertinoButton.filled(
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text('Signup'),
                onPressed: () => signUp(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
