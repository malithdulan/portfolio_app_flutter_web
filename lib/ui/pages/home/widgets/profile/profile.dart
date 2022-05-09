import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Row(
        children: [
          Image.asset("assets/images/profile_pic.jpeg", width: 200, height: 200,),
          Column(
            children: [
              Text("Hy! I am"),
              Text("Malith Dulan Kuruwita"),
              Text("dsfsdfsd dsf dsfsd fsd f sd"),
              ElevatedButton(onPressed: () {}, child: Text("Hire Me"))
            ],
          )
        ],
      )
    );
  }
}
