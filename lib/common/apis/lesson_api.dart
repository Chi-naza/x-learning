// import 'package:xlearning/common/entities/course.dart';
// import 'package:xlearning/common/utils/http_util.dart';

// import '../entities/lesson.dart';

// class LessonAPI {
//   static Future<LessonListResponseEntity> lessonList(
//       {LessonRequestEntity? params}) async {
//     var response = await HttpUtil().post(
//       'api/lessonList',
//       queryParameters: params?.toJson(),
//     );

//     return LessonListResponseEntity.fromJson(response);
//   }

//   static Future<LessonDetailResponseEntity> lessonDetail(
//       {LessonRequestEntity? params}) async {
//     var response = await HttpUtil()
//         .post('api/lessonDetail', queryParameters: params?.toJson());
//     // print(response.toString());
//     return LessonDetailResponseEntity.fromJson(response);
//   }
// }
