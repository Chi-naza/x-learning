import '../../../../common/entities/course.dart';
//for each state we are using a different class
//so that we can check our state type
abstract class MyCoursesEvents {
  const MyCoursesEvents();
}


class TriggerInitialMyCoursesEvents extends MyCoursesEvents{
  const TriggerInitialMyCoursesEvents();
}
class TriggerLoadingMyCoursesEvents extends MyCoursesEvents{
  const TriggerLoadingMyCoursesEvents();
}

class TriggerDoneLoadingMyCoursesEvents extends MyCoursesEvents{
  const TriggerDoneLoadingMyCoursesEvents();
}


class TriggerLoadedMyCoursesEvents extends MyCoursesEvents{
  const TriggerLoadedMyCoursesEvents(this.courseItem);
  final List<CourseItem> courseItem;
}