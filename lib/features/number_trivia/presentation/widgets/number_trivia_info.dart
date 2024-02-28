import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_new/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:flutter_clean_new/core/shared/widgets/custom_text.dart';
import 'package:flutter_clean_new/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';

class NumberTriviaInfo extends StatefulWidget {
  const NumberTriviaInfo({super.key});

  @override
  State<NumberTriviaInfo> createState() => _NumberTriviaInfoState();
}

class _NumberTriviaInfoState extends State<NumberTriviaInfo> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(GetRandomNumberTriviaEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
      builder: (context, state) {
        if (state is NumberTriviaLoading) {
          return _buildLoader();
        } else if (state is NumberTriviaLoadedWithSuccess) {
          return _buildInfo(state.numberTrivia);
        } else if (state is NumberTriviaLoadedWithError) {
          return _buildError(state.message);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildInfo(NumberTriviaEntity numberTrivia) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customText(text: numberTrivia.number, size: 50, heading: true),
            Center(child: customText(text: numberTrivia.text, truncate: false)),
          ],
        ),
      ),
    );
  }

  Widget _buildError(error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [customText(text: error)],
      ),
    );
  }

  Widget _buildLoader() {
    return const Center(child: CircularProgressIndicator());
  }
}
