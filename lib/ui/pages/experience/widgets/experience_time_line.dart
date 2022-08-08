import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/custom_network_image.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';
import '../../../../models/experience.dart';
import '../../../../providers/data_provider.dart';

class ExperienceTimeLine extends StatelessWidget {
  const ExperienceTimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<DataProvider, List<Experience>?>(
      selector: (context, provider) => provider.data?.data?.experience,
      builder: (context, data, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: FixedTimeline.tileBuilder(
            theme: TimelineThemeData(
                connectorTheme: const ConnectorThemeData(
                  color: Colors.lightGreenAccent,
                ),
                indicatorTheme: const IndicatorThemeData(
                  color: Colors.lightGreenAccent,
                )),
            builder: TimelineTileBuilder.connectedFromStyle(
              contentsAlign: ContentsAlign.alternating,
              oppositeContentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data?[index].companyName ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              contentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    CustomNetworkImage(
                      imageUrl: data?[index].picUrl,
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      data?[index].timePeriod ?? "",
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              connectorStyleBuilder: (context, index) =>
                  ConnectorStyle.solidLine,
              indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
              itemCount: data?.length ?? 0,
            ),
          ),
        );
      },
    );
  }
}
