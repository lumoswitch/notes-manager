import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_manager/constants/routes.dart';
import 'package:notes_manager/widgets/action_button.dart';
import 'package:notes_manager/widgets/connect_with_google.dart';
import 'package:notes_manager/widgets/input_field.dart';
import 'package:notes_manager/widgets/user_credential_form.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserCredentialForm(email: _email, password: _password),
            const ActionButtonWidget(
              buttonText: Text('Register'),
              onPressedAction: null,
            ),
            const ConnectWithGoogle(),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Already registered? ',
                        style: TextStyle(
                          color: Color.fromRGBO(99, 99, 99, 1),
                        )),
                    Text('Login here!')
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
