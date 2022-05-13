import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/utils/utills.dart';

import '../../../../../utils/constants.dart';

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
          SvgPicture.network(
            image ?? Constants.defaultSvg,
            width: double.infinity,
            height: 75,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
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
