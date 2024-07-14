
import 'package:Sanaa/features/banking/savings/widget/voultCard.dart';
import 'package:Sanaa/features/setting/controllers/profile_screen_controller.dart';
import 'package:Sanaa/features/setting/widgets/profile_shimmer_widget.dart';
import 'package:Sanaa/util/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';



class sanaaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (profileController)  =>  profileController.isLoading ? const ProfileShimmerWidget() : 
       
      Padding(
              padding: const EdgeInsets.all(20.0),
              child: AspectRatio(
                aspectRatio: 1.6, // Adjust this value based on the aspect ratio of your card
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF2ecc71), // Green background color
                  ),
                  child: Stack(
                    children: [
                      // Background image or decoration
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            Images.sanaaCard, // Replace with your asset path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Card details
                      Positioned(
                              left: 10,bottom: 10,
                              child: Text(
                                '${profileController.userInfo!.fName}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           
                            const SizedBox(height: 16),
                            const Row(
                              children: [
                                // Image.asset(
                                //   Images.sanaaChip, // Replace with chip image asset path
                                //   width: 40,
                                //   height: 40,
                                // ),
                                // SizedBox(width: 16),
                                // Text(
                                //   '7648  8574  0349  0958',
                                //   style: TextStyle(
                                //     color: Colors.white,
                                //     fontSize: 22,
                                //     fontWeight: FontWeight.bold,
                                //     letterSpacing: 2,
                                //   ),
                                // ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   'CVV 198',
                                    //   style: TextStyle(
                                    //     color: Colors.white,
                                    //     fontSize: 14,
                                    //   ),
                                    // ),
                                    // Text(
                                    //   'EXP 09/25',
                                    //   style: TextStyle(
                                    //     color: Colors.white,
                                    //     fontSize: 14,
                                    //   ),
                                    // ),
                                  ],
                                ),
                                Spacer(),
                                // Text(
                                //   '@gertbent45',
                                //   style: TextStyle(
                                //     color: Colors.white,
                                //     fontSize: 14,
                                //   ),
                                // ),
                              ],
                            ),
                             
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                               Images.sanaaf, // Replace with Visa logo image asset path
                                width: 60,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      
      
      // {
      //   return Column(
      //     children: [
            
            
      //     ],
      //   );
      // }
    );
  }
}