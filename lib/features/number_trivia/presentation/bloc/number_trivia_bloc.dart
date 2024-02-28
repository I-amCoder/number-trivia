import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_new/core/params/params.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia concreteNumberTriviaUsecase;
  final GetRandomNumberTrivia randomNumberTriviaUsecase;

  NumberTriviaBloc(
      {required this.concreteNumberTriviaUsecase,
      required this.randomNumberTriviaUsecase})
      : super(NumberTriviaInitial()) {
    on<GetConcreteNumberTriviaEvent>(_onConcreteNumberTriviaRequested);
    on<GetRandomNumberTriviaEvent>(_onRandomNumberTriviaRequested);
  }

  _onConcreteNumberTriviaRequested(GetConcreteNumberTriviaEvent event,
      Emitter<NumberTriviaState> emit) async {
    emit(NumberTriviaLoading());
    final result = await concreteNumberTriviaUsecase.call(
        params: ConcreteNumberParams(number: event.number));
    print(result);

    emit(result.fold(
        (l) => NumberTriviaLoadedWithError(message: l.errorMessage),
        (r) => NumberTriviaLoadedWithSuccess(numberTrivia: r)));
  }

  _onRandomNumberTriviaRequested(
      GetRandomNumberTriviaEvent event, Emitter<NumberTriviaState> emit) async {
    emit(NumberTriviaLoading());
    final result = await randomNumberTriviaUsecase.call();
    emit(result.fold(
        (l) => NumberTriviaLoadedWithError(message: l.errorMessage),
        (r) => NumberTriviaLoadedWithSuccess(numberTrivia: r)));
  }
}
