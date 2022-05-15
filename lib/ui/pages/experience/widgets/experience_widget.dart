import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/experience/widgets/experience_widget_layout.dart';
import 'package:portfolio/ui/pages/experience/widgets/shimmer_experience_widget_layout.dart';
import 'package:provider/provider.dart';

import '../../../../providers/data_provider.dart';
import '../../../../utils/enums.dart';
import '../../../common_widgets/data_error_widget.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, provider, child) {
        switch (provider.data?.status) {
          case LOADING_STATUS.success:
            return const ExperienceWidgetLayout();
          case LOADING_STATUS.error:
            return const DataErrorWidget();
          case LOADING_STATUS.loading:
            return const ShimmerExperienceWidgetLayout();
          default:
            return const SizedBox();
        }
      },
    );
  }
}
