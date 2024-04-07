import 'package:flutter/material.dart';
import 'package:Sanaa/common/models/contact_model.dart';
import 'package:Sanaa/util/color_resources.dart';
import 'package:Sanaa/util/dimensions.dart';
import 'package:Sanaa/util/styles.dart';

class PreviewContactItemWidget extends StatelessWidget {
  final ContactModel? contactModel;
  const PreviewContactItemWidget({Key? key, required this.contactModel,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String phoneNumber = contactModel!.phoneNumber!;
    if(phoneNumber.contains('-')) {
      phoneNumber.replaceAll('-', '');
    }


    return ListTile(
        title:  Text(contactModel!.name==null?phoneNumber: contactModel!.name!, style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),
        subtitle:phoneNumber.isEmpty? const SizedBox():
          Text(phoneNumber, style: rubikLight.copyWith(fontSize: Dimensions.fontSizeLarge, color: ColorResources.getGreyBaseGray1()),),
      );
  }
}



