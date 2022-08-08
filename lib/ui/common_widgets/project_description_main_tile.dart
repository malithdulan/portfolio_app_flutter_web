import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/custom_network_image.dart';
import 'package:portfolio/ui/common_widgets/project_description_common_tile.dart';
import 'package:portfolio/ui/common_widgets/project_download_button.dart';
import 'package:portfolio/ui/common_widgets/project_video.dart';
import 'package:portfolio/utils/utils.dart';

class ProjectDescriptionMainTile extends StatelessWidget {
  final double screenWidth;
  final String? platform;
  final String? title;
  final String? description;
  final String? appIconUrl;
  final String? gitRepoUrl;
  final String? appUrl;
  final String? appVideoUrl;
  final String? appFile;
  final List<String>? packages;

  const ProjectDescriptionMainTile({
    Key? key,
    required this.screenWidth,
    required this.platform,
    required this.title,
    required this.description,
    required this.appIconUrl,
    required this.gitRepoUrl,
    required this.appUrl,
    required this.appVideoUrl,
    required this.appFile,
    required this.packages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      color: Colors.green.withOpacity(0.2),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomNetworkImage(
                      imageUrl: appIconUrl,
                      width: 80,
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title ?? "",
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            platform ?? "",
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                if (screenWidth > 550 && (appFile != null && appFile != ""))
                  ProjectDownloadButton(downloadProject: () => Utils.shared.downloadFile(appFile)),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            ProjectDescriptionCommonTile(
              heading: "App Url : ",
              clickableContent: appUrl,
              sizeBoxHeight: 8,
            ),
            ProjectDescriptionCommonTile(
              heading: "App Repository Url : ",
              clickableContent: gitRepoUrl,
              sizeBoxHeight: 8,
            ),
            ProjectDescriptionCommonTile(
              heading: "Used Libraries : ",
              libraries: packages,
              sizeBoxHeight: 8,
            ),
            if (appVideoUrl != null && appVideoUrl != "")
              ProjectVideo(videoUrl: appVideoUrl),
            Text(
              description ?? "",
              textAlign:
                  (screenWidth <= 500) ? TextAlign.center : TextAlign.start,
            ),
            if (screenWidth <= 550 && (appFile != null && appFile != ""))
              const SizedBox(
                height: 8,
              ),
            if (screenWidth <= 550 && (appFile != null && appFile != ""))
              ProjectDownloadButton(downloadProject: () => Utils.shared.downloadFile(appFile))
          ],
        ),
      ),
    );
  }
}
