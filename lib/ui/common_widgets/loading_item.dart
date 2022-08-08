import 'package:flutter/material.dart';

class LoadingItem extends StatelessWidget {
  const LoadingItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: Colors.green,
    );
  }
}