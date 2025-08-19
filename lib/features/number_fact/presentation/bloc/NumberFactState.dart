import 'package:equatable/equatable.dart';

class NumberFactState extends Equatable {
  final int number;
  final String fact;
  final bool isChecked;
  final String? checkedText;
  final bool isFactLoading;
  final bool isCheckLoading;

  const NumberFactState({
    required this.number,
    required this.fact,
    required this.isChecked,
    this.checkedText,
    this.isFactLoading = false,
    this.isCheckLoading = false,
  });

  const NumberFactState.initial()
      : number = 0,
        fact = '',
        isChecked = false,
        checkedText = null,
        isFactLoading = false,
        isCheckLoading = false;

  NumberFactState copyWith({
    int? number,
    String? fact,
    bool? isChecked,
    String? checkedText,
    bool? isFactLoading,
    bool? isCheckLoading,
  }) {
    return NumberFactState(
      number: number ?? this.number,
      fact: fact ?? this.fact,
      isChecked: isChecked ?? this.isChecked,
      checkedText: checkedText ?? this.checkedText,
      isFactLoading: isFactLoading ?? this.isFactLoading,
      isCheckLoading: isCheckLoading ?? this.isCheckLoading,
    );
  }

  @override
  List<Object?> get props =>
      [number, fact, isChecked, checkedText, isFactLoading, isCheckLoading];
}
