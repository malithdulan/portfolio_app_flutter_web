import 'package:flutter/material.dart';

class NavBarMain extends StatelessWidget {
  const NavBarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: width * 0.3,
        child: const Center(
          child: Text("Portfolio"),
        ),
      ),
    );
  }
}
