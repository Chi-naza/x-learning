import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xlearning/common/widgets/flutter_toast.dart';
import 'package:xlearning/screens/signIn/bloc/signin_bloc.dart';

class SignInController {
  final BuildContext context;
  SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BLocProvider.of<SignInBloc>(context).state: same as the line below
        final state = context.read<SignInBloc>().state;

        String emailAddress = state.email;
        String password = state.password;

        print("Email: $emailAddress");
        print("Password: $password");

        if (emailAddress.isEmpty) {
          // show error message
          toastInfo(msg: "You need to fill email address");
          return;
        }
        if (password.isEmpty) {
          // show error message
          toastInfo(msg: "You need to fill password");
          return;
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email account");
            return;
          }

          var user = credential.user;
          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;
            print('my photo ${photoUrl}');
            Navigator.of(context).pushNamed("/application");
            // LoginRequestEntity loginRequestEntity = LoginRequestEntity();

            // loginRequestEntity.avatar = photoUrl;
            // loginRequestEntity.name = displayName;
            // loginRequestEntity.email = email;
            // loginRequestEntity.open_id = id;
            //type 1 means email login
            // loginRequestEntity.type = 1;

            // await asyncPostAllData(loginRequestEntity);
            // print('my json data ${jsonEncode(loginRequestEntity)}');
            if (context.mounted) {
              // await HomeController(context: context).init();
            }
          } else {
            toastInfo(msg: "Currently you are not a user of this app");
            return;
            //we have error getting user from firebase
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
            toastInfo(msg: "No user found for that email");
            // toastInfo(msg: "No user found for that email.");
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
            toastInfo(msg: "Wrong password provided for that user");
            // toastInfo(msg: "Wrong password provided for that user.");
          } else if (e.code == 'invalid-email') {
            print("Your email format is wrong");
            toastInfo(msg: "Your email address format is wrong");
          }
        }
      }
    } catch (e) {
      debugPrint("SIGN ERROR: $e");
    }
  }
}
