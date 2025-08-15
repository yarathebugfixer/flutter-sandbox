import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tut_app/features/number_fact/domain/usecases/GetNumberFactUseCase.dart';

import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactEvent.dart';
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactState.dart';

@injectable
class NumberFactBloc extends Bloc<NumberFactEvent, NumberFactState> {
        final GetNumberFactUseCase getNumberFactUseCase;

  NumberFactBloc(this.getNumberFactUseCase) : super(NumberFactState.initial()) {

    on<NumberFactRefreshedEvent>((event, emit) async {
      final response = await getNumberFactUseCase.execute(
        Random().nextInt(100) + 1,
      );
      emit(NumberFactState(number: response.number, fact: response.fact));
    });
  }
}
