import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IvestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          Container(
              padding: const EdgeInsets.all(16.0),
              width: Get.width, // Adjust the width as needed
              height: 400, // Adjust the height as needed
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 255, 229),
                borderRadius: BorderRadius.circular(20),
              ),
              // child: 
            ),

              Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/image/invest.png', // Replace with your asset path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
const Column(
  // crossAxisAlignment: CrossAxisAlignment.center,

// Container(
//       height: 200, width: Get.width, 
//        decoration: BoxDecoration(
//                 color:  Colors.grey[200],
//                 borderRadius: BorderRadius.circular(20),
//               ),
//       // color: Colors.grey[200],
//       child: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: 
//       ),
//     );




  mainAxisAlignment: MainAxisAlignment.center,
  children: [  Padding(
           padding: EdgeInsets.all(15.0),
           child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Investment Summary",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(height: 8.0),
            Text("Total Invested: \n100,000,000/="),
            SizedBox(height: 8.0),
            Text("Current Portfolio Value: \n105,000/="),
            // Text("Returns: 5%"),
          ],
        ),
                    SizedBox(height: 16),
                    
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
            height: 80, decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                
              ),),
             child: Padding(
               padding: const EdgeInsets.fromLTRB(0, 0, 15, 8),
               child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'Returns: 5%',
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
                                    foregroundColor: const Color.fromARGB(255, 0, 0, 0), backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text('Invest Now'),
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