part of 'number_trivia_bloc.dart';

sealed class NumberTriviaEvent extends Equatable {
  const NumberTriviaEvent();
  @override
  List<Object> get props => [];
}

class GetConcreteNumberTriviaEvent extends NumberTriviaEvent {
  final int number;

  const GetConcreteNumberTriviaEvent({required this.number});
}

class GetRandomNumberTriviaEvent extends NumberTriviaEvent {}
