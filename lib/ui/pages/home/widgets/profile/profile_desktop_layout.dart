import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/gradient_button.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ProfileDesktopLayout extends StatelessWidget {
  final String? image;
  final String? title;
  final String? name;
  final String? description;
  const ProfileDesktopLayout({
    Key? key,
    required this.image,
    required this.title,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Row(
        children: [
          Image.network(
            image ?? Constants.defaultUrl,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 50,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? "",
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GradientText(
                      name ?? "",
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                      ),
                      colors: const [
                        Colors.green,
                        Colors.blue,
                      ],
                    ),
                  ],
                ),
                Text(
                  description ?? "",
                  style:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF778899)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GradientButton(title: "Hire Me", callBack: () {},),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
