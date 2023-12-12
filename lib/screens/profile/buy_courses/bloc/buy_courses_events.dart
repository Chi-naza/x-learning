import '../../../../common/entities/course.dart';

abstract class BuyCoursesEvents{
  const BuyCoursesEvents();
}

class TriggerInitialBuyCoursesEvents extends BuyCoursesEvents{
  const TriggerInitialBuyCoursesEvents();
}
class TriggerLoadingBuyCoursesEvents extends BuyCoursesEvents{
  const TriggerLoadingBuyCoursesEvents();
}

class TriggerDoneLoadingBuyCoursesEvents extends BuyCoursesEvents{
  const TriggerDoneLoadingBuyCoursesEvents();
}


class TriggerLoadedBuyCoursesEvents extends BuyCoursesEvents{
  const TriggerLoadedBuyCoursesEvents(this.courseItem);
  final List<CourseItem> courseItem;
}