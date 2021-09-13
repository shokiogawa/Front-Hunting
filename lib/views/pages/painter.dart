import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
class RivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
          height: 200,
          child: RiveAnimation.asset('assets/lock.riv')),
    );
  }
}
