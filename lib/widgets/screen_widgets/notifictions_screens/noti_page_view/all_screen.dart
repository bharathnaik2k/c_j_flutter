import 'package:code_ju_project/api/api_data/notifictions_data.dart';
import 'package:flutter/material.dart';

class AllScreenWidget extends StatefulWidget {
  const AllScreenWidget({super.key});

  @override
  State<AllScreenWidget> createState() => _AllScreenWidgetState();
}

class _AllScreenWidgetState extends State<AllScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allNoti.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 10, end: 10),
                    child: Stack(
                      children: [
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 21, 0, 255),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(allNoti[index]["image"]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: RichText(
                            text: TextSpan(
                              text: allNoti[index]["text_sub"],
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: allNoti[index]["text"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        allNoti[index]["assignmnet"] == false
                            ? const SizedBox()
                            : TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: const MaterialStatePropertyAll(
                                      Size(60, 10)),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.pink),
                                ),
                                child: const Text(
                                  "View Assignment",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                        if (allNoti[index]["assignmnet"] == true)
                          const SizedBox(height: 5),
                        Text(
                          allNoti[index]["time"],
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider()
          ],
        );
      },
    );
  }
}
