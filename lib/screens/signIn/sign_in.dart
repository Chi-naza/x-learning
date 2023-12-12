import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xlearning/screens/signIn/bloc/signin_bloc.dart';
import 'package:xlearning/screens/signIn/bloc/signin_event.dart';
import 'package:xlearning/screens/signIn/bloc/signin_state.dart';
import 'package:xlearning/screens/signIn/sign_in_controller.dart';
import 'package:xlearning/screens/signIn/sign_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(), // buildAppBar("Log In"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                      child:
                          reusableText("Or use your email account to login")),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your email address", "email", "user",
                            (value) {
                          // email event
                          context.read<SignInBloc>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your your password", "password", "lock",
                            (value) {
                          // password event
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        })
                      ],
                    ),
                  ),
                  forgotPassword(),
                  SizedBox(
                    height: 70.h,
                  ),
                  buildLogInAdnRegButton("Log In", "login", () {
                    SignInController(context: context).handleSignIn("email");
                  }),
                  buildLogInAdnRegButton("Sign Up", "register", () {
                    Navigator.of(context).pushNamed("register");
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
