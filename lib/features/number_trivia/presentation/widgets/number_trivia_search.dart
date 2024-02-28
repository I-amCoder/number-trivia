import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_new/core/shared/widgets/custom_elevated_button.dart';
import 'package:flutter_clean_new/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';

class NumberTriviaSearch extends StatelessWidget {
  const NumberTriviaSearch({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Enter Number to Search",
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent)),
            ),
            controller: controller,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {
              BlocProvider.of<NumberTriviaBloc>(context)
                  .add(GetConcreteNumberTriviaEvent(number: int.parse(value)));
              controller.clear();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButton(
                  label: "Search",
                  callback: () {
                    BlocProvider.of<NumberTriviaBloc>(context).add(
                        GetConcreteNumberTriviaEvent(
                            number: int.parse(controller.text)));
                    controller.clear();
                  }),
              const SizedBox(
                width: 10,
              ),
              CustomElevatedButton(
                  label: "Random",
                  callback: () {
                    BlocProvider.of<NumberTriviaBloc>(context)
                        .add(GetRandomNumberTriviaEvent());
                    controller.clear();
                  })
            ],
          )
        ],
      ),
    );
  }
}
