import 'package:flutter/material.dart';
import 'package:kine_stop/app/modules/home/widgets/rounded_container.dart';

class DottedUI extends StatelessWidget {
  DottedUI({super.key});

  final List<double> sizes = [10, 15, 18, 22, 24, 27, 24, 22, 18, 15, 10];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(sizes.length, (index) => RoundContainer(size: sizes[index])),
            ),
          ),
        ),
        Transform.scale(
          scaleX: 3,
          scaleY: 3,
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
