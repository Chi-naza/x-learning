import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xlearning/screens/profile/payment_details/cubit/payment_detail_states.dart';

import '../../../../common/entities/course.dart';

class PaymentDetailCubits extends Cubit<PaymentDetailStates> {
  PaymentDetailCubits() : super(InitialPaymentDetailStates());

  void historyPaymentDetails(List<CourseItem> courseItem) {
    print('--here we are emitting states of history');
    emit(HistoryPaymentDetailStates(courseItem));
  }

  void loadingPaymentDetailStates() {
    print('--here we are emitting loading states of history');
    emit(LoadingPaymentDetailStates());
  }

  void doneLoadingPaymentDetailStates() {
    print('--here we are emitting done loading states of history');
    emit(DoneLoadingPaymentDetailStates());
  }
}
