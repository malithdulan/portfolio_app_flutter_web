import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset("assets/images/android.png", width: double.infinity, height: 50,),
          Expanded(child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("iOS Dev"),
                Text("Can develope full native apps", textAlign: TextAlign.center,),
                Text("UIKit / SwiftUI"),
              ],
            ),
          ),)
        ],
      ),
    );
  }
}
