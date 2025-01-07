import 'package:code_ju_project/api/api_data/courses.dart';
import 'package:code_ju_project/widgets/get_controller.dart';
import 'package:code_ju_project/widgets/screen_widgets/drawer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenWidget extends StatefulWidget {
  final DrawerScreen drawerScreen;
  const HomeScreenWidget({super.key, required this.drawerScreen});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  String? counts;
  TextEditingController serachInput = TextEditingController();
  CountController countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: widget.drawerScreen,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 22, 115, 191),
                ],
              ),
            ),
            child: appbar()),
      ),
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
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
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
                                        color: Colors.white),
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
                                image: AssetImage(
                                  "assets/image/banner.png",
                                ),
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
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
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
                                        Icon(Icons.arrow_right,
                                            color: Colors.white),
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
                              showDialog(
                                traversalEdgeBehavior:
                                    TraversalEdgeBehavior.leaveFlutterView,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    titlePadding: EdgeInsets.zero,
                                    insetPadding: EdgeInsets.zero,
                                    contentPadding: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    backgroundColor: Colors.transparent,
                                    shape: const RoundedRectangleBorder(),
                                    title: Column(
                                      children: <Widget>[
                                        TextField(
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            fillColor: Colors.white,
                                            filled: true,
                                            prefixIcon: const Icon(
                                                Icons.search_rounded),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            hintText: "Serach Course",
                                          ),
                                        ),
                                        const SizedBox(height: 5.0),
                                        Container(
                                          height: 400,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Expanded(
                                            child: ListView.builder(
                                              // shrinkWrap: true,
                                              itemCount: allCourses[outindex]
                                                      ["courses"]
                                                  .length,
                                              itemBuilder: (context, inindex) {
                                                return Container(
                                                  margin:
                                                      const EdgeInsets.all(4.0),
                                                  color: Colors.grey,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            color: Colors.white,
                                                            child: Icon(
                                                              allCourses[
                                                                      outindex]
                                                                  ["image"],
                                                            ),
                                                          ),
                                                          Text(allCourses[outindex]
                                                                      [
                                                                      "courses"]
                                                                  [
                                                                  inindex]["type"]
                                                              .toString()),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
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
              //
              //
              // SingleChildScrollView(
              //   physics: const AlwaysScrollableScrollPhysics(),
              //   child: Column(
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(12.0),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             const Text(
              //               "Continue Learning",
              //               style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //             InkWell(
              //               onTap: () {},
              //               child: const Text(
              //                 "View All >",
              //                 style: TextStyle(
              //                   color: Colors.blue,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       // Wrap ListView with a SizedBox or ConstrainedBox
              //       SizedBox(
              //         height: 600, // Explicitly set height to avoid unbounded error
              //         child: ListView.builder(
              //           physics:
              //               const NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
              //           itemCount: allCourses.length,
              //           itemBuilder: (context, index) {
              //             double consumedData =
              //                 double.parse(allCourses[index]["viewed_chap"]) /
              //                     double.parse(allCourses[index]["chapter"]);

              //             String dString = consumedData.toString();
              //             List<String> parts = dString.split('.');
              //             String afterDecimal = parts[1];
              //             String result = afterDecimal.substring(0, 2);
              //             int value = int.parse(result);

              //             return Container(
              //               margin: const EdgeInsets.all(6),
              //               decoration: BoxDecoration(
              //                 color: allCourses[index]["bColor"],
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               child: Column(
              //                 children: [
              //                   Row(
              //                     children: [
              //                       Container(
              //                         decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(5),
              //                           color: Colors.white,
              //                         ),
              //                         padding: const EdgeInsets.all(14),
              //                         margin: const EdgeInsets.all(8),
              //                         child: Icon(
              //                           allCourses[index]["image"],
              //                         ),
              //                       ),
              //                       Column(
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         children: [
              //                           Text(
              //                             allCourses[index]["name"],
              //                             style: const TextStyle(
              //                               fontWeight: FontWeight.bold,
              //                               color: Colors.white,
              //                               fontSize: 18,
              //                             ),
              //                           ),
              //                           Text(
              //                             "Chapter ${allCourses[index]["viewed_chap"]}/${allCourses[index]["chapter"]} | ${allCourses[index]["pages"]} Pages",
              //                             style: const TextStyle(
              //                               fontWeight: FontWeight.bold,
              //                               color: Colors.white,
              //                             ),
              //                           )
              //                         ],
              //                       )
              //                     ],
              //                   ),
              //                   Padding(
              //                     padding: const EdgeInsets.only(
              //                         bottom: 8, right: 8, left: 8),
              //                     child: Row(
              //                       children: [
              //                         Expanded(
              //                           child: SliderTheme(
              //                             data: SliderThemeData(
              //                                 overlayShape:
              //                                     SliderComponentShape.noOverlay),
              //                             child: Slider(
              //                               value: consumedData,
              //                               onChanged: (v) {},
              //                               activeColor: Colors.white,
              //                               inactiveColor: Colors.grey,
              //                             ),
              //                           ),
              //                         ),
              //                         Text(
              //                           '$value %',
              //                           style: const TextStyle(
              //                             fontWeight: FontWeight.bold,
              //                             color: Colors.white,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             );
              //           },
              //         ),
              //       ),
              //       Container(
              //         color: Colors.pink,
              //         height: 60,
              //         width: double.infinity,
              //       ),
              //     ],
              //   ),
              // )
              //
              //
              //  Expanded (
              //     child: ListView.builder(
              //       scrollDirection: Axis.vertical,
              //       itemCount:
              //           allCourses.length, // Specify the number of items in your list
              //       itemBuilder: (context, index) {
              //         return SizedBox(
              //           child: Container(
              //             padding: const EdgeInsets.all(
              //                 8), // Adding padding inside the container
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius:
              //                   BorderRadius.circular(10), // Rounded corners
              //               boxShadow: [
              //                 BoxShadow(
              //                   // Adding shadow for better UI
              //                   color: Colors.grey.withOpacity(0.1),
              //                   spreadRadius: 1,
              //                   blurRadius: 4,
              //                 ),
              //               ],
              //             ),
              //             child: Row(
              //               children: [
              //                 Icon(
              //                   // Assuming `allCourses[index]["image"]` is an IconData
              //                   allCourses[index]["image"],
              //                 ),
              //                 const SizedBox(
              //                     width:
              //                         8), // Adding spacing between the icon and text
              //                 Expanded(
              //                   child: Text(
              //                     // Displaying course information if needed
              //                     allCourses[index]
              //                         ["name"], // Assuming you have course names
              //                     style: const TextStyle(fontSize: 16), // Text style
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   color: Colors.transparent,
      //   height: 70,
      //   child: StylishBottomBar(
      //     backgroundColor: Colors.blueAccent,
      //     option: AnimatedBarOptions(),

      //     items: [
      //       BottomBarItem(
      //         icon: const Icon(Icons.house_outlined),
      //         selectedIcon: const Icon(Icons.house_rounded),
      //         selectedColor: Colors.white,
      //         unSelectedColor: const Color.fromARGB(255, 185, 185, 185),
      //         title: const Text('Home'),
      //       ),
      //       BottomBarItem(
      //         icon: const Icon(CupertinoIcons.bag_fill),
      //         selectedColor: Colors.white,
      //         unSelectedColor: const Color.fromARGB(255, 185, 185, 185),
      //         title: const Text(
      //           'Professeional',
      //           style: TextStyle(fontSize: 13),
      //         ),
      //       ),
      //       BottomBarItem(
      //         icon: const Icon(Icons.star_border_rounded),
      //         selectedIcon: const Icon(Icons.star_rounded),
      //         selectedColor: Colors.white,
      //         unSelectedColor: const Color.fromARGB(255, 185, 185, 185),
      //         title: const Text('Leraning'),
      //       ),
      //     ],
      //     hasNotch: true,
      //     elevation: 20,

      //     // currentIndex: selected,
      //     notchStyle: NotchStyle.circle,
      //     onTap: (index) {
      //       // if (index == selected) return;
      //       // controller.jumpToPage(index);
      //       // setState(() {
      //       //   selected = index;
      //       // });
      //     },
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       // heart = !heart;
      //     });
      //   },
      //   shape: const StadiumBorder(),
      //   backgroundColor: Colors.blueAccent,
      //   child: const Icon(
      //     // heart ? CupertinoIcons.heart_fill :
      //     CupertinoIcons.bag_fill,
      //     color: Colors.white,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar appbar() {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),

      titleSpacing: 0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white, size: 32),
      title: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Center(
              child: Icon(
                size: 24,
                Icons.local_fire_department,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Obx(() => DropdownButton(
                value: countController.counts.value,
                dropdownColor: Colors.white,
                hint: const Text(
                  "08",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 22,
                  ),
                ),
                underline: Container(color: Colors.white),
                items: const [
                  DropdownMenuItem(
                    value: "08",
                    child: Text(
                      "08",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "09",
                    child: Text(
                      "09",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "10",
                    child: Text(
                      "10",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  countController.counts.value = value!;
                },
              )),
        ],
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [
              Text(
                "Statistics",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 6),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue,
                size: 13,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () =>
              Navigator.of(context).pushNamed("/NotifiactionScreenWidget"),
          style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.zero),
            backgroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          icon: const Icon(
            CupertinoIcons.bell,
            size: 22,
          ),
          color: Colors.black,
        ),
        const SizedBox(width: 6),
      ],
      // bottom: PreferredSize(
      //     preferredSize: const Size(double.infinity, 200),
      //     child: Container(
      //       decoration:
      //           BoxDecoration(borderRadius: BorderRadius.circular(10)),
      //       child: const Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text("data"),
      //           Text("data"),
      //           Text("data"),
      //         ],
      //       ),
      //     )),
      // bottom: TabBar(

      //   tabs: [
      //     SizedBox(
      //       // height: 60,
      //       width: double.infinity,
      //       child: Column(
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.only(right: 16, left: 16),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 const Padding(
      //                   padding: EdgeInsets.only(bottom: 10),
      //                   child: Text(
      //                     "Hi, User Welcome Back",
      //                     style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.white),
      //                   ),
      //                 ),
      //                 Container(
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(8),
      //                   ),
      //                   child: TextField(
      //                     controller: serachInput,
      //                     decoration: InputDecoration(
      //                       hintText: "Search Courses",
      //                       prefixIcon: const Icon(CupertinoIcons.search),
      //                       disabledBorder: InputBorder.none,
      //                       contentPadding:
      //                           const EdgeInsets.only(right: 12, left: 12),
      //                       border: OutlineInputBorder(
      //                         borderSide: BorderSide.none,
      //                         borderRadius: BorderRadius.circular(8),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Container(
      //             height: 170,
      //             width: double.infinity,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               image: const DecorationImage(
      //                 fit: BoxFit.cover,
      //                 image: AssetImage("assets/image/banner.png"),
      //               ),
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      // flexibleSpace: Container(
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //         colors: <Color>[Colors.black87, Colors.blue]),
      //   ),
      // ),
    );
  }
}



// import 'package:code_ju_project/api/api_data/courses.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

// class HomeScreenWidget extends StatefulWidget {
//   const HomeScreenWidget({super.key});

//   @override
//   State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
// }

// class _HomeScreenWidgetState extends State<HomeScreenWidget> {
//   TextEditingController searchInput = TextEditingController();
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       drawer: const Drawer(),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         titleSpacing: 0,
//         iconTheme: const IconThemeData(color: Colors.white, size: 32),
//         title: Row(
//           children: [
//             Container(
//               height: 30,
//               width: 30,
//               decoration: BoxDecoration(
//                 color: Colors.amber,
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               child: const Center(
//                 child: Icon(
//                   size: 24,
//                   Icons.local_fire_department,
//                   color: Colors.red,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 6),
//             DropdownButton<String>(
//               underline: Container(),
//               items: const [
//                 DropdownMenuItem(
//                   value: "Option 1",
//                   child: Text("Option 1"),
//                 ),
//                 DropdownMenuItem(
//                   value: "Option 2",
//                   child: Text("Option 2"),
//                 ),
//               ],
//               onChanged: (value) {},
//             )
//           ],
//         ),
//         actions: [
//           Container(
//             margin: const EdgeInsets.only(right: 8),
//             padding: const EdgeInsets.all(7),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: const Row(
//               children: [
//                 Text(
//                   "Statistics",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(width: 6),
//                 Icon(
//                   Icons.arrow_forward_ios,
//                   color: Colors.blue,
//                   size: 13,
//                 ),
//               ],
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               CupertinoIcons.bell,
//               size: 22,
//             ),
//             color: Colors.black,
//           ),
//           const SizedBox(width: 6),
//         ],
//       ),
//       body: Column(
//         children: [
//           _buildHeader(),
//           _buildSectionTitle(
//             title: "Continue Learning",
//             onViewAll: () {
//               // Action for 'View All'
//             },
//           ),
//           _buildCoursesList(),
//         ],
//       ),
//       bottomNavigationBar: _buildBottomNavigationBar(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(100),
//         ),
//         backgroundColor: Colors.blueAccent,
//         child: const Icon(
//           CupertinoIcons.bag_fill,
//           color: Colors.white,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }

//   Widget _buildHeader() {
//     return Container(
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(
//           bottomRight: Radius.circular(20),
//           bottomLeft: Radius.circular(20),
//         ),
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: <Color>[
//             Colors.black87,
//             Colors.blue,
//           ],
//         ),
//       ),
//       child: Column(
//         children: [
//           const SizedBox(height: 95),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.only(bottom: 10),
//                   child: Text(
//                     "Hi, User Welcome Back",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: TextField(
//                     controller: searchInput,
//                     decoration: InputDecoration(
//                       hintText: "Search Courses",
//                       prefixIcon: const Icon(CupertinoIcons.search),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 _buildBanner(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBanner() {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         image: const DecorationImage(
//           fit: BoxFit.cover,
//           image: AssetImage("assets/image/banner.png"),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Ready For a\nNew Challenge?",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 26,
//               ),
//             ),
//             const SizedBox(height: 6),
//             const Text(
//               "Participate in this hackathon to solve\nAmazon's warehouse management.",
//               style: TextStyle(color: Colors.white),
//             ),
//             const SizedBox(height: 8),
//             TextButton(
//               style: ButtonStyle(
//                 backgroundColor: const MaterialStatePropertyAll(Colors.pink),
//                 shape: MaterialStatePropertyAll(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//               onPressed: () {},
//               child: const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Learn More",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   Icon(Icons.arrow_right, color: Colors.white),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(
//       {required String title, required VoidCallback onViewAll}) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           InkWell(
//             onTap: onViewAll,
//             child: const Text(
//               "View All >",
//               style: TextStyle(color: Colors.blue),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCoursesList() {
//     return Flexible(
//       child: ListView.builder(
//         padding: EdgeInsets.zero,
//         itemCount: allCourses.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.1),
//                     spreadRadius: 1,
//                     blurRadius: 4,
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   Icon(allCourses[index]["image"]),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       allCourses[index]["name"],
//                       style: const TextStyle(fontSize: 16),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildBottomNavigationBar() {
//     return SizedBox(
//       height: 70,
//       child: StylishBottomBar(
//         option: AnimatedBarOptions(),
//         backgroundColor: Colors.blueAccent,
//         items: [
//           BottomBarItem(
//             icon: const Icon(Icons.house_outlined),
//             selectedIcon: const Icon(Icons.house_rounded),
//             title: const Text('Home'),
//           ),
//           BottomBarItem(
//             icon: const Icon(Icons.star_border_rounded),
//             title: const Text('Professional'),
//           ),
//           BottomBarItem(
//             icon: const Icon(Icons.star_border_rounded),
//             selectedIcon: const Icon(Icons.star_rounded),
//             title: const Text('Learning'),
//           ),
//         ],
//         hasNotch: true,
//         elevation: 20,
//         onTap: (index) {
//           setState(() {
//             selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
