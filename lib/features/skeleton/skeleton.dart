import 'package:flutter/material.dart';
import 'package:flutter_clean_new/AboutPage.dart';
import 'package:flutter_clean_new/features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'package:flutter_clean_new/features/skeleton/providers/selected_page_provider.dart';
import 'package:flutter_clean_new/features/skeleton/widgets/custom_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

List<Widget> pages = [
  const NumberTriviaPage(),
  const AboutPage(),
];

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedPage = Provider.of<SelectedPageProvider>(context).selectedPage;
    return Scaffold(
      body: IndexedStack(
        index: selectedPage,
        children: pages,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
