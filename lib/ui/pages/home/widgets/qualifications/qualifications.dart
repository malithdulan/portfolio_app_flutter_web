import 'package:flutter/material.dart';

class Qualifications extends StatelessWidget {
  const Qualifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Qualifications"),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(50),
          color: Colors.redAccent,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(left: 500),
                color: Colors.black,
              ),
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(left: 500),
                color: Colors.black,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.black,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.black,
              ),
            ],
          ),
        )
      ],
    );
  }
}
