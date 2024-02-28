part of 'number_trivia_bloc.dart';

sealed class NumberTriviaState extends Equatable {
  const NumberTriviaState();

  @override
  List<Object> get props => [];
}

final class NumberTriviaInitial extends NumberTriviaState {}

final class NumberTriviaLoading extends NumberTriviaState {}

final class NumberTriviaLoadedWithSuccess extends NumberTriviaState {
  final NumberTriviaEntity numberTrivia;

  const NumberTriviaLoadedWithSuccess({required this.numberTrivia});
  @override
  List<Object> get props => [numberTrivia];
}

final class NumberTriviaLoadedWithError extends NumberTriviaState {
  final String message;

  const NumberTriviaLoadedWithError({required this.message});

  @override
  List<Object> get props => [message];
}
