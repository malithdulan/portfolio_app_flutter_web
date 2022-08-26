import 'package:flutter/material.dart';
import 'package:portfolio/models/offered_by.dart';
import 'package:portfolio/models/ratio.dart';
import 'package:portfolio/ui/common_widgets/custom_network_image.dart';
import 'package:portfolio/ui/common_widgets/loading_item.dart';
import 'package:portfolio/utils/utils.dart';
import '../../../../../utils/constants.dart';

class QualificationCard extends StatelessWidget {
  final double screenWidth;
  final String? image;
  final List<OfferedBy>? offeredBy;

  const QualificationCard({
    Key? key,
    required this.screenWidth,
    required this.image,
    required this.offeredBy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Ratio>(
      future: Utils.shared.getDimension(image ?? Constants.placeholderImage),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            width: (screenWidth > 1024)
                ? screenWidth * 0.5
                : (screenWidth > 600)
                    ? screenWidth * 0.7
                    : screenWidth * 0.8,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: (snapshot.data?.width ?? 1) /
                      (snapshot.data?.height ?? 1),
                  child: InkWell(
                    mouseCursor: SystemMouseCursors.click,
                    onTap: () => Utils.shared.showFullscreenImage(context, image),
                    child: CustomNetworkImage(imageUrl: image),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Offered By",
                    style: TextStyle(
                      color: Color(0xFF778899),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: offeredBy
                          ?.map(
                            (e) => Column(
                              children: [
                                Image.network(
                                  e.picUrl ?? Constants.placeholderImage,
                                  width: 100,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(e.title ?? ""),
                              ],
                            ),
                          )
                          .toList() ??
                      [],
                )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return const SizedBox();
        } else {
          return Container(
            width: screenWidth * 0.5,
            height: screenWidth * 0.5,
            color: Colors.black26,
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: const SizedBox(
              width: 75,
              height: 75,
              child: Center(
                child: LoadingItem(),
              ),
            ),
          );
        }
      },
    );
  }
}
