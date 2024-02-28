import 'package:dartz/dartz.dart';
import 'package:flutter_clean_new/core/errors/failure.dart';
import 'package:flutter_clean_new/core/params/params.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository numberTriviaRepository;

  GetConcreteNumberTrivia({required this.numberTriviaRepository});

  Future<Either<Failure, NumberTriviaEntity>> call(
      {required ConcreteNumberParams params}) async {
    return await numberTriviaRepository.getConcreteNumberTrivia(params: params);
  }
}
