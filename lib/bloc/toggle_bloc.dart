import 'package:bloc/bloc.dart';
import 'package:git_learning_with_studio/bloc/toggle_event.dart';
import 'package:git_learning_with_studio/bloc/toggle_state.dart';


class ToggleBloc extends Bloc<ToggleSwitchEvent, ToggleState> {
  ToggleBloc() : super(ToggleState(isOn: false)) {
    on<ToggleSwitchEvent>((event, emit) {
      emit(ToggleState(isOn: !state.isOn));
    });
  }
}
