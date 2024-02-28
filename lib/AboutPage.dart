import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Junaid Ali Web Developer",style: TextStyle(fontSize: 24)),
              Text("Whatsapp: +923302588890"),
              Text("Fiverr: fiverr.com/junaidseller"),
            ],
          )
        ],
    ),
    );
  }
}
