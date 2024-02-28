import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback callback;

  const CustomElevatedButton(
      {Key? key, required this.label, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(3),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.orangeAccent)),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
