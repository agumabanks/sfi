import 'package:Sanaa/features/banking/savings/widget/savingsCard.dart';
import 'package:Sanaa/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 226, 226),
        body: Stack(children: [
          
          savingsCard(),
          header(),
        ]));
  }
}

Widget header() {
    return Container(
        height: 83,
        width: Get.width,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 226, 226, 226),
          
        ),
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              
              // 
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(result: false),
                        child: Icon(Icons.arrow_back_ios, size:25)),
                      // Text('Cards', style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),

                Text("Sanaa Save"),
    
                 Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Icon(Icons.notifications, size:27),
                ),
              ],),
            ],
          ),
        )
        );
  }
  