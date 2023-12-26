import 'package:bloc/bloc.dart';
import 'package:example_app/data/bloc/tabs_bloc/tabs_event.dart';
import 'package:example_app/data/bloc/tabs_bloc/tabs_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationState(0)) {
    // Register the event handler
    on<UpdateBottomNavigationIndex>((event, emit) {
      emit(BottomNavigationState(event.index));
    });
  }

  Stream<BottomNavigationState> mapEventToState(BottomNavigationEvent event) async* {
    if (event is UpdateBottomNavigationIndex) {
      yield BottomNavigationState(event.index);
    }
  }
}