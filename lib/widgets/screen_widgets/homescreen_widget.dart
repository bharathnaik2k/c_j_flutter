import 'package:code_ju_project/api/api_data/courses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  TextEditingController serachInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: kFloatingActionButtonMargin + 15),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.black87,
                      Colors.blue,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "Hi, User Welcome Back",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: TextField(
                                    controller: serachInput,
                                    decoration: InputDecoration(
                                      hintText: "Search Courses",
                                      prefixIcon:
                                          const Icon(CupertinoIcons.search),
                                      disabledBorder: InputBorder.none,
                                      contentPadding: const EdgeInsets.only(
                                          right: 12, left: 12),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/image/banner.png"),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(16, 16, 16, 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Reday For a\nNew Challenge?",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "Practicle in this hackathonto solve\namazon's warehouse management",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 6, right: 6, bottom: 6),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Colors.pink),
                                    ),
                                    onPressed: () {},
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Leran More",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(
                                          Icons.arrow_right,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Continue Leraning",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "View All >",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: allCourses.length,
                      itemBuilder: (context, outindex) {
                        double consumedData =
                            double.parse(allCourses[outindex]["viewed_chap"]) /
                                double.parse(allCourses[outindex]["chapter"]);
                        String dString = consumedData.toString();
                        List<String> parts = dString.split('.');
                        String afterDecimal = parts[1];
                        String result = afterDecimal.substring(0, 2);
                        int value = int.parse(result);
                        return Container(
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: allCourses[outindex]["bColor"],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              dialogScreen(context, outindex);
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.all(14),
                                      margin: const EdgeInsets.all(8),
                                      child: Icon(
                                        allCourses[outindex]["image"],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          allCourses[outindex]["name"],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "Chapter ${allCourses[outindex]["viewed_chap"]}/${allCourses[outindex]["chapter"]}"
                                          " | ${allCourses[outindex]["pages"]} Pages",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8, right: 8, left: 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: SliderTheme(
                                          data: SliderThemeData(
                                              overlayShape: SliderComponentShape
                                                  .noOverlay),
                                          child: Slider(
                                            allowedInteraction:
                                                SliderInteraction.slideThumb,
                                            value: consumedData,
                                            onChanged: (value) {},
                                            activeColor: Colors.white,
                                            inactiveColor: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${value.toString()} %',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color.fromARGB(255, 225, 155, 255),
                    ),
                    height: 130,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          bottom: 0,
                          right: 0,
                          child: Opacity(
                            opacity: 0.6,
                            child: Image.asset(
                              "assets/image/books.png",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "It's Takes Just Two Minutes to",
                                    style: TextStyle(
                                      height: 1.1,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Text(
                                    "Level Up Your Skills!",
                                    style: TextStyle(
                                      height: 1.1,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 22.0,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text("Take Falsh Quiz ➡"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> dialogScreen(BuildContext context, int outindex) {
    return Get.dialog(
      Center(
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: const Icon(Icons.search_rounded),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: "Search Course",
                  ),
                ),
                const SizedBox(height: 5.0),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: allCourses[outindex]["courses"].length,
                    itemBuilder: (context, inindex) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 5,
                                                spreadRadius: 0.5,
                                                color: Colors.grey)
                                          ]),
                                      margin: const EdgeInsets.all(5.0),
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Icon(allCourses[outindex]["image"]),
                                    ),
                                    Text(allCourses[outindex]["courses"]
                                            [inindex]["type"]
                                        .toString()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Text(
                                  " ${allCourses[outindex]["courses"][inindex]["mood"]} ",
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Text(
                                  "INR ${allCourses[outindex]["courses"][inindex]["price"]}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 52, 79, 255),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: const Text(
                                  "  Explore  ",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
