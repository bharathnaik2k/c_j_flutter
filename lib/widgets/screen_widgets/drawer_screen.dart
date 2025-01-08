import 'package:code_ju_project/api/api_adress/api_url.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 25),
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.16),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 28,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(avatarImageUrl),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Saanvi Patel",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("B.Tech Student"),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(endIndent: 10, indent: 10),
            buttonItems(context, Icons.computer_rounded, "Courses"),
            buttonItems(context, Icons.edit_document, "Assignments"),
            buttonItems(context, Icons.replay, "Progress"),
            buttonItems(context, Icons.report, "Reports"),
            buttonItems(context, Icons.note, "Blogs"),
            const Divider(endIndent: 10, indent: 10),
            buttonItems(context, Icons.question_mark_rounded, "Help",
                color: Colors.grey.shade700),
            buttonItems(context, Icons.logout_rounded, "Logout Account",
                color: Colors.red)
          ],
        ),
      ),
    );
  }

  ElevatedButton buttonItems(BuildContext context, IconData icon, String name,
      {color = const Color.fromARGB(255, 8, 0, 251)}) {
    return ElevatedButton(
      style: const ButtonStyle(
          minimumSize: MaterialStatePropertyAll(Size(double.infinity, 60)),
          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
          elevation: MaterialStatePropertyAll(0)),
      onPressed: () {},
      child: Row(
        children: [
          SizedBox(width: MediaQuery.sizeOf(context).width * 0.1),
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(width: 12),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
