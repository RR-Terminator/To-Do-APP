import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  const ToDoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width  - 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)) ,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2), // horizontal, vertical offset
              blurRadius: 4.0, // spread radius
              spreadRadius: 0.0, // blur radius
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("InterView with User of the App", style: TextStyle(fontSize: 20),),
                  Icon( Icons.more_horiz,
                    color: Colors.black,)
                ],
              ),
              const Padding(
                padding:  EdgeInsets.only(left: 1, top: 5),
                child:    Text("Reesign the Finance App "),
              ),


              //  Add Time And Date Also Flag Icon

            ],
          ),
        ),
      ),
    );
  }
}
