import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/custom_network_svg_image.dart';
import 'package:portfolio/utils/utils.dart';

class SkillCard extends StatelessWidget {
  final String? image;
  final String? title;
  final List<String>? types;

  const SkillCard({
    Key? key,
    required this.image,
    required this.title,
    required this.types,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomNetworkSvgImage(
            imageUrl: image,
            width: 75,
            height: 75,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title ?? "",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Text(
                    Utils.shared.convertTypes(types),
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
