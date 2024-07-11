
import 'package:Sanaa/util/images.dart';
import 'package:flutter/material.dart';



class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6, // Adjust this value based on the aspect ratio of your card
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFF2ecc71), // Green background color
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'GERTRUDE AMELL BENT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Image.asset(
                        Images.sanaaChip, // Replace with chip image asset path
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(width: 16),
                      Text(
                        '7648  8574  0349  0958',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CVV 198',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'EXP 09/25',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '@gertbent45',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
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
    );
  }
}