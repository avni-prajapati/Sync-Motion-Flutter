import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: Colors.deepPurple.withAlpha(70),
        borderRadius: BorderRadius.circular(70),
      ),
    );
  }
}
