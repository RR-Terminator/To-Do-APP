import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:to_do_list/main.dart';

import '../colors.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({Key? key}) : super(key: key);

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  int myIndex =0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            tabs:  const [
              GButton(

                icon: Icons.home,
                text: "Home",
              ),
             GButton(

                icon: Icons.calendar_month,
                text: "Calendar",
              ),
              GButton(
                icon: Icons.add_box_rounded,
                text: "Add a Task",
              ),
              GButton(
                icon: Icons.content_copy,
                text: "Tasks",
              ),
              GButton(
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
