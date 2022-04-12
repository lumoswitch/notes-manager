import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_manager/constants/routes.dart';
import 'package:notes_manager/extensions/buildContext/loc.dart';
import 'package:notes_manager/services/auth/auth_service.dart';
import 'package:notes_manager/services/auth/bloc/auth_bloc.dart';
import 'package:notes_manager/services/auth/bloc/auth_event.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  _VerifyEmailViewState createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.verify_email),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(context.loc.verify_email_view_prompt),
            Text(context.loc.verify_email_send_email_verification),
            TextButton(
              onPressed: () async {
                context
                    .read<AuthBloc>()
                    .add(const AuthEventSendEmailVerification());
              },
              child: Text(context.loc.verify_email_send_email_verification),
            ),
            TextButton(
              onPressed: () async {
                context.read<AuthBloc>().add(const AuthEventLogout());
              },
              child: Text(context.loc.restart),
            )
          ],
        ),
      ),
    );
  }
}
