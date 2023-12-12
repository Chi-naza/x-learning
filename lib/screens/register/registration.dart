import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xlearning/screens/register/bloc/register_bloc.dart';
import 'package:xlearning/screens/register/bloc/register_events.dart';
import 'package:xlearning/screens/register/bloc/register_states.dart';
import 'package:xlearning/screens/register/register_controller.dart';
import 'package:xlearning/screens/signIn/sign_widget.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(title: "Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: reusableText(
                        "Enter your details below and free sign up"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("User name"),
                        buildTextField("Enter your user name", "name", "user",
                            (value) {
                          context
                              .read<RegisterBloc>()
                              .add(UserNameEvent(value));
                        }),
                        reusableText("Email"),
                        buildTextField(
                            "Enter your email address", "email", "user",
                            (value) {
                          context.read<RegisterBloc>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        buildTextField(
                            "Enter your password", "password", "lock", (value) {
                          context
                              .read<RegisterBloc>()
                              .add(PasswordEvent(value));
                          print("PASSWORD" + value);
                        }),
                        reusableText("Re-enter password"),
                        buildTextField("Re-enter your password to confirm",
                            "password", "lock", (value) {
                          context
                              .read<RegisterBloc>()
                              .add(RePasswordEvent(value));
                          print("RE-PASSWORD" + value);
                        })
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.w),
                    child: reusableText(
                        "By creating an account you have to agree with our them & condition."),
                  ),
                  buildLogInAdnRegButton("Sign up", "login", () {
                    // Navigator.of(context).pushNamed("register");
                    RegisterController(context: context)
                        .handleEmailRegistration();
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
