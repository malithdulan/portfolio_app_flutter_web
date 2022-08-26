import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/custom_network_image.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../../../utils/utils.dart';
import '../../../../common_widgets/gradient_button.dart';

class ProfileMobileLayout extends StatelessWidget {
  final String? image;
  final String? title;
  final String? name;
  final String? description;
  final String? cvUrl;

  const ProfileMobileLayout({
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
      padding: const EdgeInsets.all(25),
      child: Column(
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
                  callBack: () => Utils.shared.downloadFile(cvUrl),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
