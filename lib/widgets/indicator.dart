import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.progressValue,
  });

  final double progressValue;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: LinearProgressIndicator(
        value: progressValue,
        minHeight: 5,
        borderRadius: BorderRadiusDirectional.circular(0),
        backgroundColor: Colors.black.withOpacity(0.05),
        valueColor: const AlwaysStoppedAnimation(Colors.black),
      ),
    );
  }
}
