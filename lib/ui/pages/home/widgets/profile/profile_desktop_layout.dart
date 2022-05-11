import 'package:flutter/material.dart';

class ProfileDesktopLayout extends StatelessWidget {
  const ProfileDesktopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          "https://firebasestorage.googleapis.com/v0/b/portfolio-1925a.appspot.com/o/profile%2Fprofile_pic.jpeg?alt=media&token=d0b038b4-039f-4932-a4eb-115da904cf10",
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 50,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hy! I am",
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  Text(
                    "Malith Dulan Kuruwita",
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
              const Text(
                "A lover of technology. An upright individual not afraid of getting out of the comfort zone and trying out new things. Learn from yesterday, live for today, hope for tomorrow. The important thing is not to stop questioning.",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("Hire Me")))
            ],
          ),
        )
      ],
    );
  }
}
