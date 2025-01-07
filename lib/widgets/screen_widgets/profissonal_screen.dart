import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfissnoalScreenWidget extends StatefulWidget {
  const ProfissnoalScreenWidget({super.key});

  @override
  State<ProfissnoalScreenWidget> createState() =>
      _ProfissnoalScreenWidgetState();
}

class _ProfissnoalScreenWidgetState extends State<ProfissnoalScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          CupertinoIcons.bag_fill,
          size: 60,
        ),
      ),
    );
  }
}
