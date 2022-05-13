import 'package:flutter/material.dart';
import 'package:portfolio/providers/data_provider.dart';
import 'package:portfolio/ui/pages/home/widgets/profile/profile_desktop_layout.dart';
import 'package:portfolio/ui/pages/home/widgets/profile/profile_mobile_layout.dart';
import 'package:portfolio/ui/pages/home/widgets/profile/shimmer_profile_desktop_layout.dart';
import 'package:portfolio/ui/pages/home/widgets/profile/shimmer_profile_mobile_layout.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/enums.dart';
import '../../../../common_widgets/data_error_widget.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, provider, child) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            switch (provider.data?.status) {
              case LOADING_STATUS.success:
                return (constraints.maxWidth > 1024)
                    ? ProfileDesktopLayout(
                        title: provider.data?.data?.profile?.title,
                        image: provider.data?.data?.profile?.picUrl,
                        description: provider.data?.data?.profile?.description,
                        name: provider.data?.data?.profile?.name,
                      )
                    : ProfileMobileLayout(
                        title: provider.data?.data?.profile?.title,
                        image: provider.data?.data?.profile?.picUrl,
                        description: provider.data?.data?.profile?.description,
                        name: provider.data?.data?.profile?.name,
                      );
              case LOADING_STATUS.error:
                return const DataErrorWidget();
              case LOADING_STATUS.loading:
                return (constraints.maxWidth > 1024)
                    ? const ShimmerProfileDesktopLayout()
                    : const ShimmerProfileMobileLayout();
              default:
                return const SizedBox();
            }
          },
        );
      },
    );
  }
}
