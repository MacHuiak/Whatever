import 'package:flutter/material.dart';

class HeaderWidgetTitle extends StatelessWidget {
  const HeaderWidgetTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Baseline(
          baseline: -5,
          baselineType: TextBaseline.alphabetic,
          child: Icon(
            Icons.star,
            color: Colors.white,
            size: 14,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          "Whatever",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        Baseline(
          baseline: 0,
          baselineType: TextBaseline.alphabetic,
          child: Text(
            "VPN",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        ),
      ],
    );
  }
}