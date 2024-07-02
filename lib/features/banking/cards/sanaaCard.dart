import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 180,
          decoration: BoxDecoration(
            color: Color(0xFF2AB272), // Background color
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GERTRUDE AMELL BENT',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Text(
                  '7648 8574 0349 0958',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'CVV 198',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'EXP 09/25',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  '@gertbent45',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}