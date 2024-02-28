import 'dart:convert';

import 'package:flutter_clean_new/core/constants/constants.dart';
import 'package:flutter_clean_new/core/errors/exceptions.dart';
import 'package:flutter_clean_new/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NumberTriviaLocalDataSource {
  Future<NumberTriviaModel> getLastNumberTrivia();
  Future<void> cacheNumberTrivia(
      {required NumberTriviaModel? numberTriviaToCache});
}

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheNumberTrivia(
      {required NumberTriviaModel? numberTriviaToCache}) async {
    if (numberTriviaToCache != null) {
      await sharedPreferences.setString(
          cachedNumberTrivia, json.encode(numberTriviaToCache.toJson()));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final jsonString = sharedPreferences.getString(cachedNumberTrivia);

    if (jsonString != null) {
      return Future.value(
          NumberTriviaModel.fromJson(json: json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
