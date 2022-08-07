import 'package:flutter/material.dart';
import 'package:portfolio/utils/utills.dart';

class ProjectDescriptionCommonTile extends StatelessWidget {
  final String? heading;
  final String? content;
  final String? clickableContent;
  final List<String?>? libraries;
  final double sizeBoxHeight;

  const ProjectDescriptionCommonTile({
    Key? key,
    required this.heading,
    this.content,
    this.clickableContent,
    this.libraries,
    required this.sizeBoxHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if ((content != null && content != "") || libraries != null || (clickableContent != null && clickableContent != ""))
              Text(
                heading ?? "",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            if (content != null)
              Expanded(
                child: Text(
                  content ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            if (clickableContent != null && clickableContent != "")
              Flexible(
                child: InkWell(
                  child: Text(
                    clickableContent ?? "",
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () => Utils.shared.lunchUrl(clickableContent),
                  mouseCursor: SystemMouseCursors.click,
                ),
              ),
            if (libraries != null && libraries!.isNotEmpty)
              Expanded(
                child: Text(
                  libraries?.join(", ") ?? "",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
          ],
        ),
        if ((content != null && content != "") || libraries != null || (clickableContent != null && clickableContent != ""))
        SizedBox(
          height: sizeBoxHeight,
        )
      ],
    );
  }
}
