import 'package:xlearning/common/entities/course.dart';

abstract class PaymentDetailStates {
  const PaymentDetailStates();
}

class InitialPaymentDetailStates extends PaymentDetailStates {
  const InitialPaymentDetailStates();
}

class LoadingPaymentDetailStates extends PaymentDetailStates {
  const LoadingPaymentDetailStates();
}

class DoneLoadingPaymentDetailStates extends PaymentDetailStates {
  const DoneLoadingPaymentDetailStates();
}

class HistoryPaymentDetailStates extends PaymentDetailStates {
  final List<CourseItem> courseItem;
  const HistoryPaymentDetailStates(this.courseItem);
}
