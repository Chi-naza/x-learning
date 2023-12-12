import 'package:xlearning/common/entities/course.dart';

abstract class MyCoursesStates {
  const MyCoursesStates();
}

class InitialMyCoursesStates extends MyCoursesStates {
  const InitialMyCoursesStates();
}

class LoadingMyCoursesStates extends MyCoursesStates {
  const LoadingMyCoursesStates();
}

class DoneLoadingMyCoursesStates extends MyCoursesStates {
  const DoneLoadingMyCoursesStates();
}

class LoadedMyCoursesStates extends MyCoursesStates {
  const LoadedMyCoursesStates(this.courseItem);
  final List<CourseItem> courseItem;
}
