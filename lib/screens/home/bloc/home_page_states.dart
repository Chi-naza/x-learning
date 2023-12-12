import '../../../common/entities/course.dart';

class HomePageStates {
  const HomePageStates({
    this.courseItem = const  <CourseItem>[],
    this.index=0
  });

  final int index;
  final List<CourseItem> courseItem;

  HomePageStates copyWith({int? index, List<CourseItem>? courseItem}){
    return HomePageStates(
      courseItem:courseItem??this.courseItem,
      index:index??this.index
    );
  }
}