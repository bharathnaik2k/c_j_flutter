import 'package:flutter/material.dart';

class NotificationScreenWidget extends StatelessWidget {
  const NotificationScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
    );
  }
}
