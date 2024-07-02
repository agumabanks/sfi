import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_transition_mixin.dart';
// import 'package:nb_utils/nb_utils.dart';

class CardScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 226, 226),
        body: Stack(children: [
          home(),
          header(),
        ]));
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

  Widget home() {
    return  SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Container(
            height: Get.height /3  - 30 ,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0.5, 0.5), // changes position of shadow
                ),
              ],
            
            ),
              child: Text('')
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     Container(
                          decoration: BoxDecoration(
                            color: Colors.white60,
                          borderRadius: BorderRadius.circular(5),
                          ),
                        width: Get.width / 2 - 50,
                        height: 50,
                        
                        child: Center(child: Text('Add Money',style: TextStyle(color: Colors.black),))
                      ),

                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white60,
                          borderRadius: BorderRadius.circular(5),
                          ),
                        width: Get.width / 2 - 150,
                        height: 50,
                        
                        child: Center(child: Text('Send',style: TextStyle(color: Colors.black),))
                      ),


                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white60,
                          borderRadius: BorderRadius.circular(5),
                          ),
                        width:  50,
                        height: 50,
                        
                        child: Center(child: 
                       Icon(Icons.settings, size:25),
                        )
                      ),

                    ],
                  ),
                ),
              )),

              cardOffers(),
              cardOffers(),
              cardOffers(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget cardOffers(){
    return Container(
      height: 200,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0.5, 0.5), // changes position of shadow
          ),
        ],
      
      ),
      child: Text('')
      
      );
  }
}
