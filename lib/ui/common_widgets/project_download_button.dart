import 'package:flutter/material.dart';

class ProjectDownloadButton extends StatelessWidget {
  final Function downloadProject;
  const ProjectDownloadButton({Key? key, required this.downloadProject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => downloadProject(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            // <-- Icon
            Icons.download_rounded,
            size: 20,
          ),
          SizedBox(
            width: 4,
          ),
          Text('Download'), // <-- Text
        ],
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 6),
        ),
      ),
    );
  }
}
