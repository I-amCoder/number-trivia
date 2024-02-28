import 'package:dartz/dartz.dart';
import 'package:flutter_clean_new/core/errors/failure.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia {
  final NumberTriviaRepository numberTriviaRepository;

  GetRandomNumberTrivia({required this.numberTriviaRepository});

  Future<Either<Failure, NumberTriviaEntity>> call() async {
    return await numberTriviaRepository.getRandomNumberTrivia();
  }
}
