import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xlearning/common/global.dart';
import 'package:xlearning/common/routes/pages.dart';
import 'package:xlearning/common/values/colors.dart';
import 'package:xlearning/firebase_options.dart';
import 'package:xlearning/screens/application/application_screen.dart';
import 'package:xlearning/screens/application/bloc/app_bloc.dart';
import 'package:xlearning/screens/register/bloc/register_bloc.dart';
import 'package:xlearning/screens/register/registration.dart';
import 'package:xlearning/screens/signIn/bloc/signin_bloc.dart';
import 'package:xlearning/screens/signIn/sign_in.dart';
import 'package:xlearning/screens/welcome/bloc/welcome_bloc.dart';
import 'package:xlearning/screens/welcome/welcome.dart';

void main() async {
  Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return MaterialApp(
              title: 'X-Learning App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(
                    color: AppColors.primaryText,
                  ),
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
              ),
              // home: const Welcome(),
              // routes: {
              //   'signIn': (context) => const SignInScreen(),
              //   'register': (context) => const Register(),
              //   'application': (context) => const ApplicationScreen(),
              // },
              onGenerateRoute: AppPages.GenerateRouteSettings,
            );
          }),
    );
  }
}
