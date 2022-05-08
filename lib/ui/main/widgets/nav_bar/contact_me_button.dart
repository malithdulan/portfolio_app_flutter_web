import 'package:flutter/material.dart';

class ContactMeButton extends StatelessWidget {
  const ContactMeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: constraints.maxHeight * 0.7,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text(
            "Contact Me",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
