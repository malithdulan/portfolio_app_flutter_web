import 'package:flutter/material.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final Function callBack;
  const GradientButton({Key? key, required this.callBack, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: (provider.mode == ThemeMode.light) ? Colors.lightGreen : Colors.transparent,
                  offset: const Offset(0, 4),
                  blurRadius: 5.0)
            ],
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.lightGreenAccent,
                Colors.green
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              backgroundColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            onPressed: () => callBack(),
            child: Text(title),
          ),
        );
      },
    );
  }
}
