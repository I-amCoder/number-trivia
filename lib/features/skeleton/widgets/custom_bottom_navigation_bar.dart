import 'package:flutter/material.dart';
import 'package:flutter_clean_new/features/skeleton/providers/selected_page_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedPage =
        Provider.of<SelectedPageProvider>(context, listen: true).selectedPage;
    return BottomNavigationBar(
        currentIndex: selectedPage,
        selectedItemColor: Colors.orangeAccent,
        onTap: (index) =>
            Provider.of<SelectedPageProvider>(context, listen: false)
                .changePage(index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "About", icon: Icon(Icons.person)),
        ]);
  }
}
