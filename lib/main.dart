import 'package:flutter/material.dart';
import 'package:flutter_clean_new/core/constants/app_strings.dart';
import 'package:flutter_clean_new/core/theme/theme.dart';
import 'package:flutter_clean_new/providers/app_provider.dart';
import 'features/skeleton/skeleton.dart';
import 'dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: homeBarTitle,
        theme: themeData,
        home: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Skeleton();
  }
}
