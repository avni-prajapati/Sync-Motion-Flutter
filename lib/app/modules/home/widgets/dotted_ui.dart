import 'package:flutter/material.dart';
import 'package:kine_stop/app/modules/home/widgets/rounded_container.dart';

class DottedUI extends StatelessWidget {
  const DottedUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.scale(
          scaleX: 2,
          scaleY: 2,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20, // Horizontal space
                runSpacing: 32,
                children: List.generate(65, (index) => RoundContainer()),
              ),
            ),
          ),
        ),
        Transform.scale(
          scaleX: 2,
          scaleY: 2,
          child: Column(
            children: [
              Expanded(flex: 2, child: Container(color: Colors.transparent)),
              Expanded(flex: 2, child: Container(color: Colors.deepPurple.withAlpha(40))),
            ],
          ),
        ),
      ],
    );
  }
}
