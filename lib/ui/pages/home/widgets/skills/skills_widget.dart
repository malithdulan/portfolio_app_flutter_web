import 'package:flutter/material.dart';
import 'package:portfolio/providers/data_provider.dart';
import 'package:portfolio/ui/pages/home/widgets/skills/shimmer_skills_layout.dart';
import 'package:portfolio/ui/pages/home/widgets/skills/skills_layout.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/enums.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, provider, child) {
      if (provider.data?.status == LOADING_STATUS.success) {
        return const SkillsLayout();
      } else if (provider.data?.status == LOADING_STATUS.loading) {
        return const ShimmerSkillsLayout();
      }
      return const SizedBox();
    });
  }
}
