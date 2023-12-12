import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xlearning/common/entities/entities.dart';
import 'package:xlearning/common/global.dart';
import 'package:xlearning/screens/home/bloc/home_page_blocs.dart';
import 'package:xlearning/screens/home/bloc/home_page_events.dart';
import '../../common/apis/course_api.dart';

class HomeController {
  late BuildContext context;
  UserItem get userProfile => Global.storageService.getUserProfile();

  static final HomeController _singleton = HomeController._external();

  HomeController._external();
  //this is a factory constructor
  //makes sure you have the the original only one instance
  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }

  Future<void> init() async {
    if (Global.storageService.getUserToken().isNotEmpty) {
      // var result = await CourseAPI.courseList();
      // if (result.code == 200) {
      //   if (context.mounted) {
      //     context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
      //     return;
      //   }
      // } else {
      //   print(result.code);
      //   return;
      // }
    } else {
      print("User has already logged out");
    }
    return;
  }
}
