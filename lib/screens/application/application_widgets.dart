import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xlearning/common/values/colors.dart';
import 'package:xlearning/screens/home/home_page.dart';
import 'package:xlearning/screens/profile/profile.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    const Center(
      child: Text('Application Index 2'),
    ),
    const Center(
      child: Text('Application Index 3'),
    ),
    const Center(
      child: Text('Application Index 4'),
    ),
    // BlocProvider<SearchBlocs>(create:(context)=>SearchBlocs(), child:Search()),
    // Center(child: Text("Course")),
    // BlocProvider<MessageCubits>(create:(context)=>MessageCubits(), child: Messages(),),
    const ProfilePage(),
  ];

  return _widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    label: "home",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "search",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/search2.png"),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/search2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
      label: "course",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/play-circle1.png"),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/play-circle1.png",
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      label: "chat",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/message-circle.png"),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/message-circle.png",
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      label: "profile",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/person2.png"),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/person2.png",
          color: AppColors.primaryElement,
        ),
      )),
];
