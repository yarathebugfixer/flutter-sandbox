import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tut_app/features/number_fact/data/models/NumberFact.dart';
import 'package:tut_app/features/number_fact/domain/usecases/FactCheckWithAIUseCase.dart';
import 'package:tut_app/features/number_fact/domain/usecases/GetNumberFactUseCase.dart';

import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactEvent.dart';
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactState.dart';

@injectable
class NumberFactBloc extends Bloc<NumberFactEvent, NumberFactState> {
  final GetNumberFactUseCase getNumberFactUseCase;
  final FactCheckWithAIUseCase factCheckWithAIUseCase;

  NumberFactBloc(this.getNumberFactUseCase, this.factCheckWithAIUseCase)
    : super(NumberFactState.initial()) {
    on<NumberFactRefreshedEvent>((event, emit) async {
      emit(state.copyWith(isFactLoading: true));

      final response = await getNumberFactUseCase.execute(
        Random().nextInt(100) + 1,
      );

      emit(
        state.copyWith(
          number: response.number,
          fact: response.text,
          isChecked: false,
          checkedText: null,
          isFactLoading: false,
        ),
      );
    });

    on<NumberFactAICheckedEvent>((event, emit) async {
      emit(state.copyWith(isCheckLoading: true));

      final response = await factCheckWithAIUseCase.execute(
        NumberFact(number: event.number, text: event.fact),
      );

      emit(
        state.copyWith(
          isChecked: true,
          checkedText: response.text,
          isCheckLoading: false,
        ),
      );
    });
  }
}
