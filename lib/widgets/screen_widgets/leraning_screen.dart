import 'package:flutter/material.dart';

class LeraningScreenWidget extends StatefulWidget {
  const LeraningScreenWidget({super.key});

  @override
  State<LeraningScreenWidget> createState() => _LeraningScreenWidgetState();
}

class _LeraningScreenWidgetState extends State<LeraningScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.star_rounded,
          size: 60,
        ),
      ),
    );
  }
}
