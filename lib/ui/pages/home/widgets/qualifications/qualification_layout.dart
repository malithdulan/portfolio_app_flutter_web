import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/home/widgets/qualifications/qualification_card.dart';
import 'package:provider/provider.dart';

import '../../../../../models/qualifications.dart';
import '../../../../../providers/data_provider.dart';

class QualificationLayout extends StatelessWidget {
  const QualificationLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              const Text(
                "Qualifications",
                style: TextStyle(fontSize: 30, color: Color(0xFF778899)),
              ),
              Selector<DataProvider, List<Qualifications>?>(
                selector: (context, provider) =>
                provider.data?.data?.qualifications,
                builder: (context, provider, child) {
                  return Column(
                    children: provider
                        ?.map(
                          (values) =>
                          QualificationCard(
                            screenWidth: constraints.maxWidth,
                            image: values.picUrl,
                            offeredBy: values.offeredBy,
                          ),
                    )
                        .toList() ??
                        [],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
