import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_manager/constants/routes.dart';
import 'package:notes_manager/extensions/buildContext/loc.dart';
import 'package:notes_manager/services/auth/auth_exceptions.dart';
import 'package:notes_manager/services/auth/auth_service.dart';
import 'package:notes_manager/services/auth/bloc/auth_bloc.dart';
import 'package:notes_manager/services/auth/bloc/auth_event.dart';
import 'package:notes_manager/services/auth/bloc/auth_state.dart';
import 'package:notes_manager/utilities/show_error_dialog.dart';
import 'package:notes_manager/widgets/action_button.dart';
import 'package:notes_manager/widgets/connect_with_google.dart';
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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateRegistering) {
          if (state.exception is WeakPasswordAuthException) {
            await showErrorDialog(context, context.loc.register_error_weak_password);
          } else if (state.exception is EmailAlreadyInUseAuthException) {
            await showErrorDialog(context, context.loc.register_error_email_already_in_use);
          } else if (state.exception is GenericAuthException) {
            await showErrorDialog(context, context.loc.register_error_generic);
          } else if (state.exception is InvalidEmailAuthException) {
            await showErrorDialog(context, context.loc.register_error_invalid_email);
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.loc.register),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserCredentialForm(email: _email, password: _password),
              ActionButtonWidget(
                  buttonText: Text(context.loc.register),
                  onPressedAction: () async {
                    final email = _email.text;
                    final password = _password.text;

                    context.read<AuthBloc>().add(
                          AuthEventRegister(email, password),
                        );
                  }),
              // const ConnectWithGoogle(),
              TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(const AuthEventLogout());
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(context.loc.register_view_already_registered),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
