import 'package:flutter/material.dart';
import 'package:portfolio/models/ratio.dart';
import 'package:portfolio/utils/utills.dart';

class QualificationCard extends StatelessWidget {
  final double screenWidth;
  const QualificationCard({Key? key, required this.screenWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Ratio>(
      future: Utils.shared.getDimension("assets/images/place_pot.png"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Container(
                color: Colors.yellow,
                width: (screenWidth > 1024)
                    ? screenWidth * 0.5
                    : (screenWidth > 600)
                        ? screenWidth * 0.7
                        : screenWidth * 0.8,
                alignment: Alignment.topCenter,
                child: AspectRatio(
                  aspectRatio: (snapshot.data?.width ?? 1) /
                      (snapshot.data?.height ?? 1),
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/place_pot.png"),
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return const SizedBox();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
