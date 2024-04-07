import 'package:Sanaa/util/color_resources.dart';
import 'package:Sanaa/util/dimensions.dart';
import 'package:Sanaa/util/styles.dart';
import 'package:flutter/material.dart';

class SuggestionsSection extends StatelessWidget {
  final List<Map<String, dynamic>> suggestions = [
    {'title': 'Discover your weekly insights', 'image': 'assets/image/6461494.jpg'},
    {'title': 'Get Quicky Loans to keep your business moving', 'image': 'assets/image/4c58215a587c303812304485baae89a9.jpg'},
    {'title': 'Make Group savings and get Points', 'image': 'assets/image/6425325.jpg'},
    {'title': 'Set money a side for things that matter', 'image': 'assets/image/6461494.jpg'},
    {'title': 'Buy Now on soko24 and pay later', 'image': 'assets/image/6425325.jpg'},
    {'title': 'Make Weekly savings and earn more points', 'image': 'assets/image/4457841.jpg'},
    {'title': 'Transfer Funds within East Africa at no extra charges', 'image': 'assets/image/6461494.jpg'},
    {'title': 'Pay Yaka and win Prizes', 'image': 'assets/image/5539104.jpg'},
    {'title': 'Get the latest soko24 deals weekly', 'image': 'assets/image/6461494.jpg'},
    {'title': 'Get more clients by selling your products at Soko24', 'image': 'assets/image/6461494.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              width: 150, // Adjust width as needed
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Stack(
                children: [
                  Positioned.fill( child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        suggestions[index]['image'],
                        fit: BoxFit.cover,
                      ),
                    ),),
                  // Image.asset(
                  //   suggestions[index]['image'],
                  //   width: 100, // Adjust image size as needed
                  //   height: 100, // Adjust image size as needed
                  //   fit: BoxFit.cover,
                  // ),
                  Positioned.fill( child:Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(167, 23, 82, 62),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                     )),
                  Positioned(
                    bottom: 18,
                    left: 8,
                    right: 8,
                     child: Text(
                      suggestions[index]['title'], 
                      maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                      style: rubikRegular.copyWith(
                      fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.bold,
                        height: 0.9,
                                       color: ColorResources.getSuggestedTitleTextColor(),
                                     ),),
                   ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
