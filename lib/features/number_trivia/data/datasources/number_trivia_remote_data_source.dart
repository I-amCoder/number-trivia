import 'package:dio/dio.dart';
import 'package:flutter_clean_new/core/constants/constants.dart';
import 'package:flutter_clean_new/core/errors/exceptions.dart';
import 'package:flutter_clean_new/core/params/params.dart';
import 'package:flutter_clean_new/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(
      {required ConcreteNumberParams params});
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final Dio dio;

  NumberTriviaRemoteDataSourceImpl({required this.dio});
  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(
      {required ConcreteNumberParams params}) async {
    final response = await dio
        .get("$baseApiUrl/${params.number}", queryParameters: {"json": true});
    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(json: response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    final response =
        await dio.get("$baseApiUrl/random", queryParameters: {"json": true});
    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(json: response.data);
    } else {
      throw ServerException();
    }
  }
}
