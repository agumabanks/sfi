import 'package:phone_number/phone_number.dart';
import 'package:Sanaa/features/auth/controllers/auth_controller.dart';
import 'package:Sanaa/features/auth/controllers/create_account_controller.dart';
import 'package:Sanaa/util/app_constants.dart';
import 'package:Sanaa/util/color_resources.dart';
import 'package:Sanaa/util/dimensions.dart';
import 'package:Sanaa/util/styles.dart';
import 'package:Sanaa/common/widgets/custom_app_bar_widget.dart';
import 'package:Sanaa/common/widgets/custom_country_code_widget.dart';
import 'package:Sanaa/common/widgets/custom_logo_widget.dart';
import 'package:Sanaa/common/widgets/custom_large_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Sanaa/helper/custom_snackbar_helper.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);


  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController numberFieldController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppbarWidget(title: 'login_registration'.tr),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: Dimensions.paddingSizeExtraExtraLarge),
                  const CustomLogoWidget(height: 70.0, width: 70.0),
                  const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraLarge),
                    child: Text('${'create'.tr} ${AppConstants.appName} ${'account_with_your'.tr}', style: rubikRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge!.color, fontSize: Dimensions.fontSizeLarge,), textAlign: TextAlign.center,),
                  ),
                  const SizedBox(height: Dimensions.paddingSizeExtraLarge,),
                  GetBuilder<CreateAccountController>(builder: (controller)=>Container(height: 52,
                    margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                    child: Center(
                      child: TextField(
                        controller: numberFieldController,
                        keyboardType: TextInputType.phone,
                        cursorColor: Theme.of(context).textTheme.titleLarge!.color,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 5),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimensions.radiusSizeSmall),
                            borderSide: BorderSide(color: Theme.of(context).textTheme.titleLarge!.color!, width: 2,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimensions.radiusSizeSmall),
                            borderSide: BorderSide(color: ColorResources.textFieldBorderColor, width: 1,
                            ),
                          ),
                         prefixIcon: CustomCountryCodeWidget(
                           onChanged: (countryCode) => controller.setCountryCode(countryCode.dialCode!),
                         ),

                        ),
                      ),
                    ),
                  ),),
                ],
              ),
            ),
          ),
          GetBuilder<AuthController>(builder: (controller)=> SizedBox(
            height: 110,
            child: !controller.isLoading ? CustomLargeButtonWidget(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              text: 'verify_umber'.tr,
              onTap: () async {
                String phoneNumber = '${Get.find<CreateAccountController>().countryCode}${numberFieldController.text}';
                try{
                  await PhoneNumberUtil().parse(phoneNumber).then((value) => Get.find<CreateAccountController>().sendOtpResponse(number: phoneNumber));

                }catch(e){
                  showCustomSnackBarHelper('please_input_your_valid_number'.tr, isError: true);
                  numberFieldController.clear();
                }
              },
            ) : Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor)),
          ),),
        ],
      ),
    );
  }
}
