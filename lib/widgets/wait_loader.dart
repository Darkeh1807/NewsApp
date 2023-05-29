import 'package:flutter/material.dart';

class WaitLoader extends StatelessWidget {
  const WaitLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Please wait ..."),
        SizedBox(
          height: 10,
        ),
        CircularProgressIndicator(),
      ],
    );
  }
}
