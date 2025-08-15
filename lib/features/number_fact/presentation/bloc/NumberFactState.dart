import 'package:equatable/equatable.dart';

class NumberFactState extends Equatable {
  final int number;
  final String fact;

  const NumberFactState({
    required this.number,
    required this.fact,
  });

  const NumberFactState.initial()
      : number = 0,
        fact = '';

  NumberFactState copyWith({
    int? number,
    String? fact,
  }) {
    return NumberFactState(
      number: number ?? this.number,
      fact: fact ?? this.fact,
    );
  }

  @override
  List<Object> get props => [number, fact];
}