import 'package:Sanaa/features/banking/loans/widget/userLoans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanCard extends StatelessWidget {
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
                color: const Color.fromARGB(255, 0, 21, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              // child: 
            ),

              Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/image/sanaaLoans.png', // Replace with your asset path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
const Column(
  // crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [  Padding(
           padding: EdgeInsets.all(15.0),
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
                      'Loans to\nyour business \nmoving.',
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
            height: 80, decoration: const BoxDecoration(
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
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'Small business loans from 300,000 /=.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Add your onPressed code here! 
                                    print('geting to loan offers');
                                    // Get.toNamed("/loanOffers");
                                    Get.to(UserLoansScreen() );
                                  },
                                  style: ElevatedButton.styleFrom(

                                    foregroundColor: Colors.blue, backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text('Check for offers'),
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