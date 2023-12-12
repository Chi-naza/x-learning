import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xlearning/common/widgets/base_text_widget.dart';
import 'package:xlearning/screens/profile/buy_courses/widgets/buy_courses_widgets.dart';

import 'bloc/buy_courses_blocs.dart';
import 'bloc/buy_courses_states.dart';
import 'buy_courses_controller.dart';

class BuyCourses extends StatefulWidget {
  const BuyCourses({Key? key}) : super(key: key);

  @override
  State<BuyCourses> createState() => _BuyCoursesState();
}

class _BuyCoursesState extends State<BuyCourses> {
  late BuyCoursesController _buyCoursesController;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _buyCoursesController = BuyCoursesController(context: context);
    _buyCoursesController.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyCoursesBlocs, BuyCoursesStates>(
        builder: (context, state) {
      if (state is DoneLoadingBuyCoursesStates) {
        print('done loading the data we bought....');
        return Container();
      } else if (state is LoadedBuyCoursesStates) {
        if (state.courseItem.isEmpty) {
          print('bang........');
        }
        print('just loaded the data we bought.....');
        return Scaffold(
          appBar: buildAppBar("Courses bought"),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  menuView(),
                  buildBoughtListItem(state),
                ],
              ),
            ),
          ),
        );
      } else if (state is LoadingBuyCoursesStates) {
        print('loading the data we bought......');
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Container();
    });
  }
}
