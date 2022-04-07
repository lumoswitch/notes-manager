import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_manager/constants/routes.dart';
import 'package:notes_manager/utilities/show_error_dialog.dart';
import 'package:notes_manager/widgets/action_button.dart';
import 'package:notes_manager/widgets/connect_with_google.dart';
import 'package:notes_manager/widgets/user_credential_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              UserCredentialForm(email: _email, password: _password),
              TextButton(
                onPressed: () {},
                child: const Text('Forgot Password?'),
              ),
              ActionButtonWidget(
                  buttonText: const Text('Login'),
                  onPressedAction: () async {
                    final email = _email.text;
                    final password = _password.text;
                    try {
                      final userCredential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      final user = FirebaseAuth.instance.currentUser;
                      if (user?.emailVerified ?? false) {
                        // user's email is verified
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          dashboardRoute,
                          (route) => false,
                        );
                      } else {
                        // user's email is NOT verified
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          verifyEmailRoute,
                          (route) => false,
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        await showErrorDialog(
                          context,
                          'User not found',
                        );
                      } else if (e.code == 'wrong-password') {
                        await showErrorDialog(
                          context,
                          'Wrong password',
                        );
                      } else {
                        await showErrorDialog(
                          context,
                          'Error: ${e.code}',
                        );
                      }
                    }
                  }),
              const ConnectWithGoogle(),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(registerRoute, (route) => false);
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Don’t have an account? ',
                          style: TextStyle(
                            color: Color.fromRGBO(99, 99, 99, 1),
                          )),
                      Text('Register here!')
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
