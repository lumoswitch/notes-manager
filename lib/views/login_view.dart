import 'package:flutter/material.dart';
import 'package:notes_manager/constants/routes.dart';
import 'package:notes_manager/services/auth/auth_exceptions.dart';
import 'package:notes_manager/services/auth/bloc/auth_bloc.dart';
import 'package:notes_manager/services/auth/bloc/auth_event.dart';
import 'package:notes_manager/utilities/show_error_dialog.dart';
import 'package:notes_manager/widgets/action_button.dart';
import 'package:notes_manager/widgets/connect_with_google.dart';
import 'package:notes_manager/widgets/user_credential_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                      context.read<AuthBloc>().add(
                        AuthEventLogin(email, password),
                      );
                    } on UserNotFoundAuthException {
                      await showErrorDialog(
                        context,
                        'User not found',
                      );
                    } on WrongPasswordAuthException {
                      await showErrorDialog(
                        context,
                        'Wrong credentials',
                      );
                    } on GenericAuthException {
                      await showErrorDialog(
                        context,
                        'Authentication error',
                      );
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
