import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/custom_network_image.dart';
import '../../utils/utils.dart';

class ContactDetailsTile extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subTitle;
  final String? platformUrl;

  const ContactDetailsTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.platformUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.shared.lunchUrl(platformUrl),
      child: Container(
        color: Colors.black26,
        margin: const EdgeInsets.only(
          top: 5,
          left: 5,
          right: 5,
        ),
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            CustomNetworkImage(
              imageUrl: imageUrl,
              width: 45,
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? "",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    subTitle ?? "",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
