import '../../../../common/entities/course.dart';

abstract class BuyCoursesStates {
  const BuyCoursesStates();
}
class InitialBuyCoursesStates extends BuyCoursesStates{
  const InitialBuyCoursesStates();
}
class LoadingBuyCoursesStates extends BuyCoursesStates{
  const LoadingBuyCoursesStates();
}

class DoneLoadingBuyCoursesStates extends BuyCoursesStates{
  const DoneLoadingBuyCoursesStates();
}
class LoadedBuyCoursesStates extends BuyCoursesStates{
  const LoadedBuyCoursesStates(this.courseItem);
  final List<CourseItem> courseItem;
}
