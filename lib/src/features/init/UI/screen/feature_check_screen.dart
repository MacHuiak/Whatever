import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeatureCheckScreen extends StatelessWidget {
  const FeatureCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: context.width,
                minWidth: context.width,
                minHeight: context.height,
                maxHeight: context.height),
            child: Column(
              children: [
                SizedBox(
                  width: context.width,
                  height: 120,
                  child: Stack(
                    children: [Container()],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
