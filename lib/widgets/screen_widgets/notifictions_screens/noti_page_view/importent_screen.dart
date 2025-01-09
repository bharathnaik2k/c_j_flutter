import 'package:flutter/material.dart';

class ImportantScreenWidget extends StatefulWidget {
  const ImportantScreenWidget({super.key});

  @override
  State<ImportantScreenWidget> createState() => _ImportantScreenWidgetState();
}

class _ImportantScreenWidgetState extends State<ImportantScreenWidget> {
  @override
  Center build(BuildContext context) {
    Center showText = const Center(child: Text("Empty Notifications"));
    return showText;
  }
}
