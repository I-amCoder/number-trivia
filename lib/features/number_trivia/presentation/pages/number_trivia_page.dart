import 'package:flutter/material.dart';
import 'package:flutter_clean_new/core/shared/widgets/custom_text.dart';
import 'package:flutter_clean_new/features/number_trivia/presentation/widgets/number_trivia_info.dart';
import 'package:flutter_clean_new/features/number_trivia/presentation/widgets/number_trivia_search.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(text: "Number Trivia", color: Colors.orange),
        elevation: 0.2,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: Center(
                child: SingleChildScrollView(
                  child: NumberTriviaInfo(),
                ),
              ),
            ),
          ),
          NumberTriviaSearch(),
        ],
      ),
    );
  }
}
