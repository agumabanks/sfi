import 'package:Sanaa/util/color_resources.dart';
import 'package:Sanaa/util/dimensions.dart';
import 'package:Sanaa/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
class MenuItem2 extends StatelessWidget {
  const MenuItem2({
    Key? key,
    required this.image,
    required this.title,
    this.iconData,
  }) : super(key: key);
  final String? image;
  final String title;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall,horizontal: 7),
      child:  Column(children: [
          Container(
             width: Get.width / 4 - 60,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault),
              color: ColorResources.getSelectedTextColor().withOpacity(0.27),
              // image: DecorationImage(
              //   image: AssetImage(image!),
              //   fit: BoxFit.cover,)
              ),
            child: image != null ?
            Image.asset(image!,height:30,width: 30, fit:  BoxFit.contain) : Icon(iconData),
          ),
          const SizedBox(height: 5),
        
          Text(title,style: rubikSemiBold.copyWith(fontSize: 10)),
        
          // const Icon(Icons.arrow_forward_ios_rounded,size: Dimensions.radiusSizeDefault,),
        ],),
      
    );
  }
}