import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xlearning/common/widgets/base_text_widget.dart';
import 'package:xlearning/screens/profile/buy_courses/widgets/buy_courses_widgets.dart';

import 'bloc/my_courses_blocs.dart';
import 'bloc/my_courses_states.dart';
import 'my_courses_controller.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({Key? key}) : super(key: key);

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  late MyCoursesController _myCoursesController;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _myCoursesController = MyCoursesController(context: context);
    _myCoursesController.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCoursesBlocs, MyCoursesStates>(
        builder: (context, state) {
      if (state is DoneLoadingMyCoursesStates) {
        print('done loading the data....');
        return Scaffold(
          appBar: buildAppBar("My courses"),
          body: SingleChildScrollView(
            child: Column(
              children: [menuView()],
            ),
          ),
        );
      } else if (state is LoadedMyCoursesStates) {
        print('just loaded the data.....');
        return Container();
      } else if (state is LoadingMyCoursesStates) {
        print('loading the data......');
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return Container();
    });
  }
}
