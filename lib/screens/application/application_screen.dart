import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xlearning/common/values/colors.dart';
import 'package:xlearning/screens/application/application_widgets.dart';
import 'package:xlearning/screens/application/bloc/app_bloc.dart';
import 'package:xlearning/screens/application/bloc/app_events.dart';
import 'package:xlearning/screens/application/bloc/app_states.dart';

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({Key? key}) : super(key: key);

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: buildPage(state.index),
            bottomNavigationBar: Container(
              width: 375.w,
              height: 58.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.h),
                      topRight: Radius.circular(20.h)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ]),
              child: BottomNavigationBar(
                currentIndex: state.index, // index
                onTap: (value) {
                  context.read<AppBloc>().add(TriggerAppEvent(value));
                },
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.primaryFourthElementText,
                items: bottomTabs, // tabs
              ),
            ),
          ),
        ),
      );
    });
  }
}
