import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('Get card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.credit_card, size: 40),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Debit card',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Spend globally with great exchange rates and built-in budgeting',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Image.network(
                      'https://via.placeholder.com/150', // Replace with your actual image
                      width: 100,
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.cloud, size: 40),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Virtual debit card',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'No wait, no hassle. Spend online or with ApplePay right away',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Image.network(
                      'https://via.placeholder.com/150', // Replace with your actual image
                      width: 100,
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}