import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Skills"),
        Container(
          color: Colors.indigoAccent,
          height: 150,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
            scrollDirection: Axis.horizontal,
            itemExtent: 150,
            children: [
              Card(

              ),
              Card(

              ),
              Card(

              ),
            ],
          ),
        ),
      ],
    );
  }
}
