import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../../../utils/constants.dart';
import '../../../../common_widgets/gradient_button.dart';

class ProfileMobileLayout extends StatelessWidget {
  final String? image;
  final String? title;
  final String? name;
  final String? description;
  const ProfileMobileLayout({
    Key? key,
    required this.image,
    required this.title,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Image.network(
            image ?? Constants.defaultUrl,
            width: 150,
            height: 150,
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title ?? "",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              GradientText(
                name ?? "",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                colors: const [
                  Colors.green,
                  Colors.blue,
                ],
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  description ?? "",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF778899)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GradientButton(
                  title: "Hire Me",
                  callBack: () {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
