import 'package:flutter/material.dart';
import 'package:portfolio/providers/data_provider.dart';
import 'package:portfolio/ui/pages/home/widgets/qualifications/qualification_layout.dart';
import 'package:portfolio/ui/pages/home/widgets/qualifications/shimmer_qualification_layout.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/enums.dart';

class QualificationsWidget extends StatelessWidget {
  const QualificationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, provider, child) {
        if (provider.data?.status == LOADING_STATUS.success) {
          return const QualificationLayout();
        } else if (provider.data?.status == LOADING_STATUS.loading) {
          return const ShimmerQualificationLayout();
        }
        return const SizedBox();
      },
    );
  }
}
