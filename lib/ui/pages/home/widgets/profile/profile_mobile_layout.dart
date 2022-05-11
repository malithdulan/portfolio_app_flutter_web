import 'package:flutter/material.dart';

class ProfileMobileLayout extends StatelessWidget {
  const ProfileMobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          "https://firebasestorage.googleapis.com/v0/b/portfolio-1925a.appspot.com/o/profile%2Fprofile_pic.jpeg?alt=media&token=d0b038b4-039f-4932-a4eb-115da904cf10",
          width: 150,
          height: 150,
        ),
        const SizedBox(
          height: 25,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Hy! I am",
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Malith Dulan Kuruwita",
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "A lover of technology. An upright individual not afraid of getting out of the comfort zone and trying out new things. Learn from yesterday, live for today, hope for tomorrow. The important thing is not to stop questioning.",
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(onPressed: () {}, child: Text("Hire Me")))
          ],
        )
      ],
    );
    ;
  }
}
