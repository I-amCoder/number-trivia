import 'package:flutter_clean_new/core/constants/constants.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/entities/number_trivia_entity.dart';

class NumberTriviaModel extends NumberTriviaEntity {
  NumberTriviaModel({required  number, required  text})
      : super(number: number, text: text);

  factory NumberTriviaModel.fromJson({required Map<String, dynamic> json}) {

    return NumberTriviaModel(
        number: json[kNumber].toString(), text: json[kText]);
  }

  Map<String, dynamic> toJson() {
    return {kNumber: number.toString(), kText: text};
  }
}
