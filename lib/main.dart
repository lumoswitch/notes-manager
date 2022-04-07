import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes_manager/constants/routes.dart';
import 'package:notes_manager/services/auth/auth_service.dart';
import 'package:notes_manager/views/login_view.dart';
import 'package:notes_manager/views/notes/create_update_note_view.dart';
import 'package:notes_manager/views/notes_view.dart';
import 'package:notes_manager/views/register_view.dart';
import 'package:notes_manager/views/verify_email_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Notes Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        loginRoute : (context) => const LoginView(),
        registerRoute : (context) => const RegisterView(),
        verifyEmailRoute : (context) => const VerifyEmailView(),
        dashboardRoute : (context) => const NotesView(),
        createOrUpdateNoteRoute: (context) => const CreateUpdateNoteView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const NotesView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}