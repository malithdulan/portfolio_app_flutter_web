import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/home/widgets/profile/profile_desktop_layout.dart';
import 'package:portfolio/ui/pages/home/widgets/profile/profile_mobile_layout.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: EdgeInsets.all(constraints.maxWidth > 1024 ? 40 : 25),
          child: (constraints.maxWidth > 1024)
              ? const ProfileDesktopLayout()
              : const ProfileMobileLayout(),
        );
      },
    );
  }
}
