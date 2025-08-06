import 'package:flutter_bloc/flutter_bloc.dart';

import 'age_dropdown_state.dart';

class AgeDropdownCubit extends Cubit<AgeDropdownState> {
  AgeDropdownCubit() : super(AgeDropdownState());

  void selectAge(String? age) {
    if (age == null || age.isEmpty) {
      emit(state.copyWith(selectedAge: null, error: 'Please select your age'));
    } else {
      emit(state.copyWith(selectedAge: age, error: null));
    }
  }

}