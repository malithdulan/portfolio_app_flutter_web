import 'package:flutter/material.dart';

class ProjectDescriptionTile extends StatelessWidget {
  const ProjectDescriptionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      color: Colors.lightGreen,
      width: double.infinity,
      height: 300,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/place_pot.png", fit: BoxFit.contain,),
            ),
          ),
          const Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Example data',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
