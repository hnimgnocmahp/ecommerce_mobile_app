class AgeDropdownState {
  final String? selectedAge;
  final String? error;

  AgeDropdownState({this.selectedAge = '', this.error});

  AgeDropdownState copyWith({String? selectedAge, String? error}) {
    return AgeDropdownState(
      selectedAge: selectedAge ?? this.selectedAge,
      error: error,
    );
  }
}