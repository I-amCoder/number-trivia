import 'package:dartz/dartz.dart';
import 'package:flutter_clean_new/core/errors/failure.dart';
import 'package:flutter_clean_new/core/params/params.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/entities/number_trivia_entity.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTriviaEntity>> getConcreteNumberTrivia(
      {required ConcreteNumberParams params});
  Future<Either<Failure, NumberTriviaEntity>> getRandomNumberTrivia();
}
