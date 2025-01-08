import 'package:code_ju_project/widgets/screen_widgets/notifictions_screens/noti_page_view/all_screen.dart';
import 'package:code_ju_project/widgets/screen_widgets/notifictions_screens/noti_page_view/importent_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationScreenWidget extends StatefulWidget {
  const NotificationScreenWidget({super.key});

  @override
  State<NotificationScreenWidget> createState() =>
      _NotificationScreenWidgetState();
}

class _NotificationScreenWidgetState extends State<NotificationScreenWidget> {
  int seletindex = 0;

  final _contt = PageController();

  void onChanged(var index) {
    setState(() {
      seletindex = index;
    });
  }

  void onitemchange(var i) {
    _contt.jumpToPage(i);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  CupertinoIcons.xmark,
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "Notifications",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        onChanged(0);
                        onitemchange(0);
                        setState(() {
                          seletindex = 0;
                        });
                      },
                      child: const Text(
                        " All ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 3,
                      width: 19,
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:
                            seletindex == 0 ? Colors.pink : Colors.transparent,
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        onChanged(1);
                        onitemchange(1);
                        setState(() {
                          seletindex = 1;
                        });
                      },
                      child: const Text(
                        "Importent",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 3,
                      width: 67,
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:
                            seletindex == 1 ? Colors.pink : Colors.transparent,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: PageView(
                controller: _contt,
                onPageChanged: onChanged,
                children: const [
                  AllScreenWidget(),
                  ImportantScreenWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class NotifiactionScreenWidget extends StatefulWidget {
//   const NotifiactionScreenWidget({super.key});

//   @override
//   NotificationsScreenWidgetState createState() =>
//       NotificationsScreenWidgetState();
// }

// class NotificationsScreenWidgetState extends State<NotifiactionScreenWidget>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notifications'),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: const [
//             Tab(text: 'All'),
//             Tab(text: 'Important'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: const [
//           // All Notifications List
//           NotificationsList(type: 'All'),
//           // Important Notifications List
//           NotificationsList(type: 'Important'),
//         ],
//       ),
//     );
//   }
// }

// class NotificationsList extends StatelessWidget {
//   final String type;

//   const NotificationsList({super.key, required this.type});

//   @override
//   Widget build(BuildContext context) {
//     List<String> notifications = type == 'All'
//         ? ['Notification 1', 'Notification 2', 'Notification 3']
//         : ['Important Notification 1', 'Important Notification 2'];

//     return ListView.builder(
//       itemCount: notifications.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(notifications[index]),
//         );
//       },
//     );
//   }
// }
