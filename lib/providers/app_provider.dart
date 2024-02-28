import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_new/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter_clean_new/features/skeleton/bloc/skeleton_bloc.dart';
import 'package:flutter_clean_new/features/skeleton/providers/selected_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_clean_new/dependency_injection.dart' as di;

class AppProvider extends StatelessWidget {
  final Widget child;
  const AppProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => di.sl<SelectedPageProvider>(),
          ),
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => di.sl<SkeletonBloc>(),
          ),
          
          BlocProvider(
            create: (context) => di.sl<NumberTriviaBloc>(),
          ),
        ], child: child));
  }
}
