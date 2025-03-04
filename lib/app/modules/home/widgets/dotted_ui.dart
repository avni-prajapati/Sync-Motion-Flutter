import 'package:flutter/material.dart';
import 'package:kine_stop/app/modules/home/widgets/rounded_container.dart';
import 'package:kine_stop/app/utils/utils.dart';

class DottedUI extends StatelessWidget {
  const DottedUI({super.key, required this.color, required this.themeShape});

  final Color color;
  final ThemeShape themeShape;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                themeShape == ThemeShape.heart ? heartSizes.length : sizes.length,
                (index) {
                  switch (themeShape) {
                    case (ThemeShape.round):
                      {
                        return RoundContainer(
                          size: sizes[index],
                          boarderRadius: 30,
                          color: color.withAlpha(70),
                        );
                      }
                    case (ThemeShape.square):
                      {
                        return RoundContainer(
                          size: sizes[index],
                          boarderRadius: 0,
                          color: color.withAlpha(70),
                        );
                      }
                    case (ThemeShape.heart):
                      {
                        return HeartWidget(color: color.withAlpha(70), size: heartSizes[index]);
                      }
                  }
                },
              ),
            ),
          ),
        ),
        Transform.scale(
          scaleX: 3,
          scaleY: 3,
          child: Column(
            children: [
              Expanded(flex: 2, child: Container(color: Colors.transparent)),
              Expanded(flex: 2, child: Container(color: color.withAlpha(40))),
            ],
          ),
        ),
      ],
    );
  }
}
