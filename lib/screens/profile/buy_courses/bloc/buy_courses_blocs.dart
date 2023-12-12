import 'package:flutter_bloc/flutter_bloc.dart';

import 'buy_courses_events.dart';
import 'buy_courses_states.dart';

class BuyCoursesBlocs extends Bloc<BuyCoursesEvents, BuyCoursesStates>{
  BuyCoursesBlocs():super(const InitialBuyCoursesStates()){
    on<TriggerInitialBuyCoursesEvents>(_triggerInitialBuyCoursesEvents);
    on<TriggerLoadingBuyCoursesEvents>(_triggerLoadingBuyCourses);
    on<TriggerLoadedBuyCoursesEvents>(_triggerLoadedBuyCourses);
    on<TriggerDoneLoadingBuyCoursesEvents>(_triggerDoneLoadingBuyCourses);
  }
  _triggerInitialBuyCoursesEvents(TriggerInitialBuyCoursesEvents event, Emitter<BuyCoursesStates> emit){
    print('initial.....');
    emit(InitialBuyCoursesStates());
  }

  _triggerLoadedBuyCourses(TriggerLoadedBuyCoursesEvents event, Emitter<BuyCoursesStates> emit){
    print('loaded.....');

    emit(LoadedBuyCoursesStates(event.courseItem));

  }

  _triggerLoadingBuyCourses(TriggerLoadingBuyCoursesEvents event, Emitter<BuyCoursesStates> emit){
    //we are calling state classes directly. State classes are similar to state properties,
    //we have seen with state.copyWith() method previously
    print('loading....');
    emit( const LoadingBuyCoursesStates());
  }

  _triggerDoneLoadingBuyCourses(TriggerDoneLoadingBuyCoursesEvents event, Emitter<BuyCoursesStates> emit){
    //we are calling state classes directly. State classes are similar to state properties,
    //we have seen with state.copyWith() method previously
    print('done....');
    emit( const DoneLoadingBuyCoursesStates());

  }
}