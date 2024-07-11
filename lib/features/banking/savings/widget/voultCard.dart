import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaultCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          Container(
              padding: EdgeInsets.all(16.0),
              width: Get.width, // Adjust the width as needed
              height: 400, // Adjust the height as needed
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              // child: 
            ),

              Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/image/savings-voult.png', // Replace with your asset path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
Column(
  // crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [  Padding(
           padding: const EdgeInsets.all(15.0),
           child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    SizedBox(height: 16),
                    Text(
                      'Up to 1.35% AER',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Save money\nwith Vaults',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    
                    SizedBox(height: 16),
                    
                  ],
                ),
                
         ),

       ],),

         Positioned(
           right: 0, 
           left:0,
           bottom: 0,
           child: Container(
            height: 80, decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                
              ),),
             child: Padding(
               padding: const EdgeInsets.fromLTRB(0, 0, 15, 8),
               child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    'Discover the smart way to maximise your money.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Add your onPressed code here!
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.blue, backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text('Start'),
                                ),
                              ],
                            ),
             ),
           ),
           
         ),
   
        ]
        
        
           ),
    );
  }
}