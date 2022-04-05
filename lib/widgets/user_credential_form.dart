import 'package:flutter/material.dart';
import 'package:notes_manager/widgets/input_field.dart';

class UserCredentialForm extends StatelessWidget {
  const UserCredentialForm({
    Key? key,
    required TextEditingController email,
    required TextEditingController password,
  })  : _email = email,
        _password = password,
        super(key: key);

  final TextEditingController _email;
  final TextEditingController _password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 20, right: 40, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
        ],
      ),
    );
  }
}
