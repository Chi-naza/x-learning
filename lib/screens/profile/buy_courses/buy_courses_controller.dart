import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/apis/course_api.dart';
import 'bloc/buy_courses_blocs.dart';
import 'bloc/buy_courses_events.dart';

class BuyCoursesController {
  late BuildContext context;
  BuyCoursesController({required this.context});

  //after the context is ready this init() method gets called
  void init() {
    //we can network event or anything like that

    asyncLoadBuyCourseData();
  }

  asyncLoadBuyCourseData() async {
    context.read<BuyCoursesBlocs>().add(const TriggerLoadingBuyCoursesEvents());
    // var result = await CourseAPI.coursesBought();
    // if(result.code==200){
    //   if(context.mounted){
    //     //save data to shared storage
    //     context.read<BuyCoursesBlocs>().add(const TriggerDoneLoadingBuyCoursesEvents());

    //     Future.delayed(const Duration(milliseconds: 10), (){
    //       context.read<BuyCoursesBlocs>().add(TriggerLoadedBuyCoursesEvents(result.data!));

    //     });
    //   }
    // }
  }
}
