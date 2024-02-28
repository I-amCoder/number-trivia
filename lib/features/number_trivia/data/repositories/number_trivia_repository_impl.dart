import 'package:dartz/dartz.dart';
import 'package:flutter_clean_new/core/connection/connection.dart';
import 'package:flutter_clean_new/core/errors/exceptions.dart';
import 'package:flutter_clean_new/core/errors/failure.dart';
import 'package:flutter_clean_new/core/params/params.dart';
import 'package:flutter_clean_new/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_clean_new/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_clean_new/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl extends NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, NumberTriviaEntity>> getConcreteNumberTrivia(
      {required ConcreteNumberParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        NumberTriviaModel remoteTrivia =
            await remoteDataSource.getConcreteNumberTrivia(params: params);
        localDataSource.cacheNumberTrivia(numberTriviaToCache: remoteTrivia);
        return right(remoteTrivia);
      } on ServerException {
        return left(ServerFailure(errorMessage: "Server Error"));
      }
    } else {
      try {
        NumberTriviaModel localTrivia =
            await localDataSource.getLastNumberTrivia();
        return right(localTrivia);
      } on CacheException {
        return left(CacheFailure(errorMessage: "Cache Error"));
      }
    }
  }

  @override
  Future<Either<Failure, NumberTriviaEntity>> getRandomNumberTrivia() async {
    if (await networkInfo.isConnected) {
      try {
        NumberTriviaModel remoteTrivia =
            await remoteDataSource.getRandomNumberTrivia();
        localDataSource.cacheNumberTrivia(numberTriviaToCache: remoteTrivia);
        return right(remoteTrivia);
      } on ServerException {
        return left(ServerFailure(errorMessage: "Server Error"));
      }
    } else {
      try {
        NumberTriviaModel localTrivia =
            await localDataSource.getLastNumberTrivia();
        return right(localTrivia);
      } on CacheException {
        return left(CacheFailure(errorMessage: "Cache Error"));
      }
    }
  }
}
