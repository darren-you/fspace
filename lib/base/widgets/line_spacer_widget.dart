import 'package:flutter/material.dart';

class LineSpacerWidget extends StatelessWidget {
  const LineSpacerWidget(
      {super.key, this.leftMargin = 16, this.rightMargin = 0});

  final double? leftMargin;
  final double? rightMargin;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.white,
          width: leftMargin,
          height: 0.6,
        ),
        Container(
          color: Colors.black,
          height: 0.6,
        ),
        Container(
          color: Colors.white,
          width: rightMargin,
          height: 0.6,
        ),
      ],
    );
  }
}
