import 'package:flutter/material.dart';
import 'package:portfolio/models/industrial_projects.dart';
import 'package:provider/provider.dart';
import '../../../../providers/data_provider.dart';
import '../../../../providers/industrial_description_change_provider.dart';
import '../../../../providers/industrial_page_switch_provider.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/enums.dart';
import '../../../common_widgets/project_description_main_tile.dart';
import '../../../common_widgets/project_description_tile.dart';

class IndustrialProjectDescription extends StatelessWidget {
  final double screenSize;

  const IndustrialProjectDescription({Key? key, required this.screenSize})
      : super(key: key);

  _exitFromDetailsPage(BuildContext context) {
    Provider.of<IndustrialPageSwitchProvider>(context, listen: false)
        .changePage(DISPLAY_PAGE.list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          title: const Text(
            "Description",
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          actions: (screenSize <= 1024)
              ? [
            IconButton(
              icon: const Icon(
                Icons.close_rounded,
                color: Colors.white,
              ),
              onPressed: () => _exitFromDetailsPage(context),
            )
          ]
              : [],
        ),
      ),
      body: Consumer<IndustrialDescriptionChangeProvider>(
        builder: (context, provider, child) =>
            Selector<DataProvider, List<IndustrialProjects>?>(
              selector: (context, provider) => provider.data?.data?.industrialProjects,
              builder: (context, data, child) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return ProjectDescriptionMainTile(
                        key: ValueKey("$index ${Constants.industrialProjectDescriptionMainTile} "),
                        screenWidth: screenSize,
                        platform: data?[provider.index].platform,
                        title: data?[provider.index].title,
                        description: data?[provider.index].description,
                        appIconUrl: data?[provider.index].appIconUrl,
                        gitRepoUrl: data?[provider.index].gitRepoUrl,
                        appUrl: data?[provider.index].appUrl,
                        appVideoUrl: data?[provider.index].appVideoUrl,
                        appFile: data?[provider.index].appFile,
                        packages: data?[provider.index].packages,
                      );
                    } else {
                      return ProjectDescriptionTile(
                        key: ValueKey("$index ${Constants.industrialProjectDescriptionTile}"),
                        imageList: data?[provider.index].appDetails?[index -1].picUrls,
                        description:
                        data?[provider.index].appDetails?[index -1].description,
                        screenWidth: screenSize,
                      );
                    }
                  },
                  itemCount: data?[provider.index].appDetails?.length != null
                      ? data![provider.index].appDetails!.length + 1
                      : null,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 8),
                );
              },
            ),
      ),
    );
  }
}
