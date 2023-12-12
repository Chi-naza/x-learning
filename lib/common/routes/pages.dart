import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xlearning/common/global.dart';
import 'package:xlearning/common/routes/names.dart';
import 'package:xlearning/screens/application/application_screen.dart';
import 'package:xlearning/screens/application/bloc/app_bloc.dart';
import 'package:xlearning/screens/home/bloc/home_page_blocs.dart';
import 'package:xlearning/screens/profile/bloc/profile_blocs.dart';
import 'package:xlearning/screens/profile/payment_details/cubit/payment_detail_cubits.dart';
import 'package:xlearning/screens/profile/payment_details/payment_details.dart';
import 'package:xlearning/screens/profile/profile.dart';
import 'package:xlearning/screens/profile/settings/bloc/settings_blocs.dart';
import 'package:xlearning/screens/profile/settings/settings_page.dart';
import 'package:xlearning/screens/register/bloc/register_bloc.dart';
import 'package:xlearning/screens/register/registration.dart';
import 'package:xlearning/screens/signIn/bloc/signin_bloc.dart';
import 'package:xlearning/screens/signIn/sign_in.dart';
import 'package:xlearning/screens/welcome/bloc/welcome_bloc.dart';
import 'package:xlearning/screens/welcome/welcome.dart';
import '../../screens/home/home_page.dart';
import '../../screens/profile/buy_courses/bloc/buy_courses_blocs.dart';
import '../../screens/profile/buy_courses/buy_courses.dart';
import '../../screens/profile/my_courses/bloc/my_courses_blocs.dart';
import '../../screens/profile/my_courses/my_courses.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
          route: AppRoutes.SING_IN,
          page: const SignInScreen(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(
            create: (_) => RegisterBloc(),
          )),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationScreen(),
          bloc: BlocProvider(
            create: (_) => AppBloc(),
          )),
      PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(
            create: (_) => HomePageBlocs(),
          )),
      PageEntity(
          route: AppRoutes.SETTINGS,
          page: const SettingsPage(),
          bloc: BlocProvider(
            create: (_) => SettingsBlocs(),
          )),
      // PageEntity(
      //     route: AppRoutes.COURSE_DETAIL,
      //     page: const CourseDetail(),
      //     bloc: BlocProvider(create: (_)=>CourseDetailBloc(),)
      // ),
      // PageEntity(
      //     route: AppRoutes.LESSON_DETAIL,
      //     page: const LessonDetail(),
      //     bloc: BlocProvider(create: (_)=>LessonBlocs(),)
      // ),

      // PageEntity(
      //     route: AppRoutes.PAY_WEB_VIEW,
      //     page: const PayWebView(),
      //     bloc: BlocProvider(create: (_)=>PayWebViewBlocs(),)
      // ),
      PageEntity(
          route: AppRoutes.PROFILE,
          page: const ProfilePage(),
          bloc: BlocProvider(
            create: (_) => ProfileBlocs(),
          )),
      PageEntity(
          route: AppRoutes.MY_COURSES,
          page: const MyCourses(),
          bloc: BlocProvider(
            create: (_) => MyCoursesBlocs(),
          )),

      PageEntity(
          route: AppRoutes.BUY_COURSES,
          page: const BuyCourses(),
          bloc: BlocProvider(
            create: (_) => BuyCoursesBlocs(),
          )),

      PageEntity(
          route: AppRoutes.PAYMENT_DETAILS,
          page: const PaymentDetails(),
          bloc: BlocProvider(
            create: (_) => PaymentDetailCubits(),
          )),
      // PageEntity(
      //     route: AppRoutes.CONTRIBUTOR,
      //     page: const Contributor(),
      //     bloc: BlocProvider(create: (_)=>ContributorCubits(),)
      // ),

      // PageEntity(
      //     route: AppRoutes.CHAT,
      //     page: const Chat(),
      //     bloc: BlocProvider(create: (_)=>ChatBlocs(),)
      // ),
    ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name macthing when navigator gets triggered.
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedin = Global.storageService.getIsLoggedIn();
          if (isLoggedin) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationScreen(), settings: settings);
          }

          return MaterialPageRoute(
              builder: (_) => const SignInScreen(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const SignInScreen(), settings: settings);
  }
}

//unify BlocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
