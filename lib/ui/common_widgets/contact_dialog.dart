import 'package:flutter/material.dart';
import 'package:portfolio/models/coding_platform.dart';
import '../../utils/app_data.dart';
import 'contact_details_tile.dart';

class ContactDialog extends StatelessWidget {
  final String? phoneNo;
  final String? emailAddress;
  final String? homeAddress;
  final List<CodingPlatform>? platforms;

  const ContactDialog({
    Key? key,
    required this.phoneNo,
    required this.emailAddress,
    required this.homeAddress,
    required this.platforms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(15),
        width: 300,
        decoration: BoxDecoration(
          gradient: (AppData.shared.mode == ThemeMode.light)
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFEAE5C9), Color(0xFF6CC6CB)],
                )
              : null,
          boxShadow: const [
            BoxShadow(blurRadius: 5),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Contact Details",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 200,
                color: Colors.grey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ...platforms?.map((e) => ContactDetailsTile(
                                  imageUrl: e.platformPic,
                                  title: e.platformName,
                                  subTitle: e.priority,
                                  platformUrl: e.platformUrl,
                                ))
                            .toList() ??
                        [],
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            ),
            Text(
              phoneNo ?? "",
              style: const TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              emailAddress ?? "",
              style: const TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              homeAddress ?? "",
              style: const TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
