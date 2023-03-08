import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:to_do_list/task-card.dart';

import 'Screen/calender-page.dart';
import 'colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MaterialApp(
    title: "Finance App",
    theme: ThemeData.light(),
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myIndex =0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: const Text(
          "To-do",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(
              Icons.circle_notifications_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Projects",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "View all",
                  style: TextStyle(fontSize: 22, color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            height: size.height - 550,
            width: size.width - 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: c1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30,
                        width: 100,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Colors.white),
                        child: const Center(
                            child: Text(
                          "High Priority",
                          style: TextStyle(color: c2, fontSize: 15),
                        )),
                      ),
                      const Icon(
                        Icons.more_horiz,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 12, top: 10),
                  child: Text(
                    "Designing NFT Landing Page shot",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12, top: 15),
                  child: Text(
                    "Designing NFT Landing Page shot interface that could be more effectively",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15, left: 12, right: 12),
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                ),

                // Add Date Time extra
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Today Task",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                ),
                Text(
                  "1/4 done",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                )
              ],
            ),
          ),
         Expanded(
           flex: 4,
           child: SingleChildScrollView(
             padding: EdgeInsets.all(16),
             scrollDirection: Axis.vertical,
             child: Column(
               children: [
                 ToDoCard(),
                 ToDoCard(),
                 ToDoCard(),
               ],
             ),
           ),
         )
        ],
      ),
      bottomNavigationBar:Container(
        color: Colors.white,
        child:  Padding(

          padding:  const EdgeInsets.all(10),
          child: GNav(
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: c1,
            tabBackgroundColor: c2,
            padding: const EdgeInsets.all(10),
            gap: 10,
            tabs:  [
              const GButton(
                icon: Icons.home,
                text: "Home",
              ),
               GButton(
                 onPressed:() {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const CalenderPage()));
                 },
                icon: Icons.calendar_month,
                text: "Calendar",
              ),
              const GButton(
                icon: Icons.add_box_rounded,
                text: "Add a Task",
              ),
              const GButton(
                icon: Icons.content_copy,
                text: "Tasks",
              ),
              const GButton(
                icon: Icons.account_circle,
                text: "Profile",
              ),

            ],
            onTabChange: (index){
              setState(() {
                myIndex = index;
              });
              controller.jumpToPage(index);

            },

          ),
        ),
      ),
    );
  }
}
