import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_manager/constants/routes.dart';
import 'package:notes_manager/widgets/input_field.dart';

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
        title: const Text('Notes Manager'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 40, top: 20, right: 40, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Register'),
                  InputFieldWidget(
                    controller: _email,
                    hideInputText: false,
                    type: TextInputType.emailAddress,
                    hintText: 'Enter your email here',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  InputFieldWidget(
                    controller: _password,
                    hideInputText: true,
                    type: TextInputType.emailAddress,
                    hintText: 'Enter your password here',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid password';
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                                'By signing up you agree with the Terms and Conditions',
                                maxLines: 2)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () async {},
                child: const Text('Register'),
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(233, 234, 243, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // <-- Radius
                  ),
                ),
                onPressed: () async {},
                child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Image.asset(
                    'assets/images/google_icon.png',
                    height: 18.0,
                    width: 20.0,
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Continue with Google ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ))
                ]),
              ),
            ),
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
