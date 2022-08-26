import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/custom_network_image.dart';
import 'package:portfolio/ui/common_widgets/gradient_button.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ProfileDesktopLayout extends StatelessWidget {
  final String? image;
  final String? title;
  final String? name;
  final String? description;
  final String? cvUrl;

  const ProfileDesktopLayout({
    Key? key,
    required this.image,
    required this.title,
    required this.name,
    required this.description,
    required this.cvUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Row(
        children: [
          InkWell(
            mouseCursor: SystemMouseCursors.click,
            onTap: () => Utils.shared.showFullscreenImage(context, image),
            child: CustomNetworkImage(
              imageUrl: image,
              width: 200,
              height: 200,
            ),
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
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF778899)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GradientButton(
                    title: "Hire Me",
                    callBack: () => Utils.shared.downloadFile(cvUrl),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
