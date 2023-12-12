import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xlearning/common/widgets/flutter_toast.dart';
import 'package:xlearning/screens/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegistration() async {
    final state = context.read<RegisterBloc>().state;

    String userName = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    print(userName);
    print(email);
    print(password);
    print(rePassword);

    if (userName.isEmpty) {
      toastInfo(msg: "User name can not be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email name can not be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password name can not be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Your password confirmation is wrong");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        // String photoUrl = "uploads/default.png";
        // await credential.user?.updatePhotoURL(photoUrl);

        toastInfo(
            msg:
                "An email has been sent to your registered email. To activate it please check your email box and click on the link");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The email is already in use");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email id is invalid");
      }
    }
  }

  //
}
