import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Sanaa/features/language/controllers/localization_controller.dart';
import 'package:Sanaa/helper/route_helper.dart';
import 'package:Sanaa/util/app_constants.dart';
import 'package:Sanaa/util/dimensions.dart';
import 'package:Sanaa/common/widgets/custom_logo_widget.dart';
import 'package:Sanaa/common/widgets/rounded_button_widget.dart';

class AppBarHeaderWidget extends StatelessWidget {
  const AppBarHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String languageText = AppConstants.languages[Get.find<LocalizationController>().selectedIndex].languageName!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomLogoWidget(height: 50.0, width: 50.0),

          RoundedButtonWidget(
            buttonText: languageText,
            onTap: AppConstants.languages.length > 1 ? (){
              Get.toNamed(RouteHelper.getChoseLanguageRoute());
            } : null,
          ),
        ],
      ),
    );
  }
}



