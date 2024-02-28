import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_new/core/connection/connection.dart';
import 'package:flutter_clean_new/core/errors/failure.dart';
import 'package:flutter_clean_new/core/params/params.dart';
import 'package:flutter_clean_new/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_clean_new/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_clean_new/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConcreteNumberTriviaProvider extends ChangeNotifier {
  NumberTriviaEntity? numberTrivia;
  Failure? failure;

  ConcreteNumberTriviaProvider({this.failure, this.numberTrivia});

  void eitherConcreteNumberTriviaOrFailure({required int number}) async {
    numberTrivia = null;
    failure = null;
    notifyListeners();
    NumberTriviaRepositoryImpl numberTriviaRepository =
        NumberTriviaRepositoryImpl(
            remoteDataSource: NumberTriviaRemoteDataSourceImpl(dio: Dio()),
            localDataSource: NumberTriviaLocalDataSourceImpl(
                sharedPreferences: await SharedPreferences.getInstance()),
            networkInfo: NetworkInfoImpl(InternetConnectionChecker()));

    final failureOrTemplate = await GetConcreteNumberTrivia(
            numberTriviaRepository: numberTriviaRepository)
        .call(
      params: ConcreteNumberParams(number: number),
    );

    failureOrTemplate.fold(
      (Failure newFailure) {
        numberTrivia = null;
        failure = newFailure;
        notifyListeners();
      },
      (NumberTriviaEntity newTemplate) {
        numberTrivia = newTemplate;
        failure = null;
        notifyListeners();
      },
    );
  }

  void eitherRandomNumberTriviaOrFailure() async {
    numberTrivia = null;
    failure = null;
    notifyListeners();
    NumberTriviaRepositoryImpl numberTriviaRepository =
        NumberTriviaRepositoryImpl(
            remoteDataSource: NumberTriviaRemoteDataSourceImpl(dio: Dio()),
            localDataSource: NumberTriviaLocalDataSourceImpl(
                sharedPreferences: await SharedPreferences.getInstance()),
            networkInfo: NetworkInfoImpl(InternetConnectionChecker()));

    final failureOrTemplate = await GetRandomNumberTrivia(
            numberTriviaRepository: numberTriviaRepository)
        .call();

    failureOrTemplate.fold(
      (Failure newFailure) {
        numberTrivia = null;
        failure = newFailure;
        notifyListeners();
      },
      (NumberTriviaEntity newTemplate) {
        numberTrivia = newTemplate;
        failure = null;
        notifyListeners();
      },
    );
  }
}
