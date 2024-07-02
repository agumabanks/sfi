import 'package:Sanaa/features/banking/cards/get-new-card.dart';
import 'package:Sanaa/features/banking/cards/sanaaCards.dart';
import 'package:Sanaa/features/banking/loans.dart';
import 'package:Sanaa/features/setting/widgets/menuItem2.dart';
import 'package:Sanaa/helper/custom_snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:Sanaa/common/widgets/custom_app_bar_widget.dart';
import 'package:Sanaa/features/auth/controllers/auth_controller.dart';
import 'package:Sanaa/features/setting/controllers/profile_screen_controller.dart';
import 'package:Sanaa/features/splash/controllers/splash_controller.dart';
import 'package:Sanaa/features/setting/domain/models/profile_model.dart';
import 'package:Sanaa/helper/dialog_helper.dart';
import 'package:Sanaa/helper/route_helper.dart';
import 'package:Sanaa/util/app_constants.dart';
import 'package:Sanaa/util/dimensions.dart';
import 'package:Sanaa/util/images.dart';
import 'package:Sanaa/util/styles.dart';
import 'package:Sanaa/common/widgets/custom_ink_well_widget.dart';
import 'package:Sanaa/common/widgets/custom_dialog_widget.dart';
import 'package:Sanaa/features/setting/widgets/menu_item.dart' as widget;
import 'package:Sanaa/features/setting/widgets/profile_holder.dart';
import 'package:Sanaa/features/setting/widgets/status_menu.dart';
import 'package:Sanaa/features/setting/widgets/user_info_widget.dart';
import 'package:Sanaa/features/requested_money/screens/requested_money_list_screen.dart';
import 'package:Sanaa/features/setting/screens/transaction_limit_screen.dart';

import '../../banking/investmentScreen.dart';
import '../../banking/savings/savingsScreen.dart';




class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final splashController = Get.find<SplashController>();
    List<TransactionTableModel> transactionTableModelList = [];
    ProfileModel? userInfo = Get.find<ProfileController>().userInfo;

    if(userInfo != null){
      transactionTableModelList.addAll([
        if(splashController.configModel!.systemFeature!.sendMoneyStatus! && splashController.configModel!.customerSendMoneyLimit!.status )
          TransactionTableModel(
            'send_money'.tr, Images.sendMoneyImage, splashController.configModel!.customerSendMoneyLimit!,
            Transaction(
              userInfo.transactionLimits!.dailySendMoneyCount ?? 0,
              userInfo.transactionLimits!.monthlySendMoneyCount ?? 0,
              userInfo.transactionLimits!.dailySendMoneyAmount ?? 0,
              userInfo.transactionLimits!.monthlySendMoneyAmount ?? 0,
            ),
          ),

        if(splashController.configModel!.systemFeature!.cashOutStatus! && splashController.configModel!.customerCashOutLimit!.status )
          TransactionTableModel('cash_out'.tr, Images.cashOutLogo, splashController.configModel!.customerCashOutLimit!,
            Transaction(
              userInfo.transactionLimits!.dailyCashOutCount ?? 0,
              userInfo.transactionLimits!.monthlyCashOutCount ?? 0,
              userInfo.transactionLimits!.dailyCashOutAmount ?? 0,
              userInfo.transactionLimits!.monthlyCashOutAmount ?? 0,
            ),
          ),


        if(splashController.configModel!.systemFeature!.sendMoneyRequestStatus! && splashController.configModel!.customerRequestMoneyLimit!.status)
          TransactionTableModel('send_money_request'.tr, Images.requestMoneyLogo, splashController.configModel!.customerRequestMoneyLimit!,
            Transaction(
              userInfo.transactionLimits!.dailySendMoneyRequestCount ?? 0,
              userInfo.transactionLimits!.monthlySendMoneyRequestCount ?? 0,
              userInfo.transactionLimits!.dailySendMoneyRequestAmount ?? 0,
              userInfo.transactionLimits!.monthlySendMoneyRequestAmount ?? 0,
            ),),

        if(splashController.configModel!.systemFeature!.addMoneyStatus! && splashController.configModel!.customerAddMoneyLimit!.status )
          TransactionTableModel(
            'add_money'.tr, Images.addMoneyLogo3, splashController.configModel!.customerAddMoneyLimit!,
            Transaction(
              userInfo.transactionLimits?.dailyAddMoneyCount ?? 0,
              userInfo.transactionLimits?.monthlyAddMoneyCount ?? 0,
              userInfo.transactionLimits?.dailyAddMoneyAmount ?? 0,
              userInfo.transactionLimits?.monthlyAddMoneyAmount ?? 0,
            ),
          ),

        if(splashController.configModel!.systemFeature!.withdrawRequestStatus! && splashController.configModel!.customerWithdrawLimit!.status)
          TransactionTableModel(
            'withdraw'.tr, Images.withdraw, splashController.configModel!.customerWithdrawLimit!,
            Transaction(
              userInfo.transactionLimits?.dailyWithdrawRequestCount ?? 0,
              userInfo.transactionLimits?.monthlyWithdrawRequestCount ?? 0,
              userInfo.transactionLimits?.dailyWithdrawRequestAmount ?? 0,
              userInfo.transactionLimits?.monthlyWithdrawRequestAmount ?? 0,
            ),
          ),
      ]);
    }


    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppbarWidget(title: 'profile'.tr, onlyTitle: true),
      body: GetBuilder<AuthController>(builder: (authController){
        return ModalProgressHUD(
          inAsyncCall: authController.isLoading,
          progressIndicator: CircularProgressIndicator(color: Theme.of(context).primaryColor),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const UserInfoWidget(),


              // Accouts
              ProfileHeader(title: 'Accounts'.tr),
               
                Row(children: [
                   CustomInkWellWidget(
                    child: MenuItem2(image: "assets/image/8644355_clock_time_watch_icon.png",title: 'withdraw_history'.tr),
                    onTap: () => Get.to(()=> const RequestedMoneyListScreen(requestType: RequestType.withdraw)),
                  ),


                  CustomInkWellWidget(
                    child: MenuItem2(image:"assets/image/requests.png",title: 'requests'.tr),
                    onTap: () => Get.to(()=> const RequestedMoneyListScreen(requestType: RequestType.request)),
                  ),

                  CustomInkWellWidget(
                    child: MenuItem2(image: "assets/image/withdrawhistory.png", title: 'send_requests'.tr),
                    onTap: () => Get.to(()=> const RequestedMoneyListScreen(requestType: RequestType.sendRequest)),
                  ),


                ]),



                 // Rewards
              ProfileHeader(title: 'Rewards'.tr),
               
                Row(children: [
                   CustomInkWellWidget(
                    child: MenuItem2(image:"assets/image/8703955_gift_dynamic_color_icon.png",title: 'Gifts'.tr),
                    onTap: () => Get.to(()=> const RequestedMoneyListScreen(requestType: RequestType.withdraw)),
                  ),


                  CustomInkWellWidget(
                    child: MenuItem2(image: "assets/image/referrals.png",title: 'Referrals'.tr),
                    onTap: () => Get.to(()=> const RequestedMoneyListScreen(requestType: RequestType.request)),
                  ),

                 

                ]),


                  // Banking 
              ProfileHeader(title: 'Banking'.tr),
               
                Row(children: [
                   CustomInkWellWidget(
                    child: MenuItem2(image: "assets/image/8703780_card_dynamic_gradient_icon.png",title: 'Cards'.tr),
                    onTap: (){
                      Get.to(()=> CardScreenPage());
                      // showCustomSnackBarHelper(message: 'Coming Soon', isError: true);
                      // showCustomSnackBarHelper('Coming Soon',isError: false, duration: const Duration(minutes: 10));
                    }
                    // () => Get.to(()=> CardScreenPage() //const RequestedMoneyListScreen(requestType: RequestType.withdraw)
                    // ),
                  ),


                  CustomInkWellWidget(
                    child: MenuItem2(image: "assets/image/SavingV.png",title: 'Saving'.tr),
                    onTap: (){
                      Get.to(()=> SavingsScreen());
                      // showCustomSnackBarHelper(message: 'Coming Soon', isError: true);
                      // showCustomSnackBarHelper('Coming Soon',isError: false, duration: const Duration(minutes: 10));
                    }
                    // () => Get.to(()=> const RequestedMoneyListScreen(requestType: RequestType.request)),
                  ),

                  CustomInkWellWidget(
                    child: MenuItem2(image:"assets/image/savings.png",title: 'Loans'.tr),
                    onTap: ()
                    {

                      Get.to(()=> LoansPage());
                      // showCustomSnackBarHelper(message: 'Coming Soon', isError: true);
                      // showCustomSnackBarHelper('Coming Soon',isError: false, duration: const Duration(minutes: 10));
                    }
                    // () => Get.to(()=> LoansPage()
                    // // const RequestedMoneyListScreen(requestType: RequestType.sendRequest)
                    // ),
                  ),

                  CustomInkWellWidget(
                    child: MenuItem2(image:"assets/image/savings.png",title: 'Invest '.tr),
                    onTap: (){

                       Get.to(()=> InvestmentScreen());
                      // showCustomSnackBarHelper('Coming Soon',isError: false, duration: const Duration(minutes: 10));
                    }
                    
                  ),

                  // 


                ]),




   // Profile editprofile
              ProfileHeader(title: 'Profile'.tr),
               
                Row(children: [
                   CustomInkWellWidget(
                    child: MenuItem2(image:"assets/image/editprofile.png",title: 'Edit'.tr),
                    onTap:() => Get.toNamed(RouteHelper.getEditProfileRoute()),
                  ),


                  // CustomInkWellWidget(
                  //   child: MenuItem2(image: "assets/image/darkmode.png",title: 'Dark Mode'.tr),
                  //   onTap: () => Get.to(()=> const RequestedMoneyListScreen(requestType: RequestType.request)),
                  // ),

                  GetBuilder<ProfileController>(builder: (profileController){
                    return Container(
                      padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                      child: Row( children: [
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                        //   child: Image.asset(Images.changeTheme,width: Dimensions.fontSizeOverOverLarge,),
                        // ),

                        // Text('dark_mode'.tr,style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),

                        // const Spacer(),
                  // CustomInkWellWidget(
                  //   child: MenuItem2(image: "assets/image/darkmode.png",title: 'Dark Mode'.tr),
                  //   onTap: () => Get.to(()=> profileController.onChangeTheme(),),
                  // ),
                  
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap:()=> profileController.onChangeTheme(),
                          child: MenuItem2(image: "assets/image/darkmode.png",title: 'Dark Mode'.tr),
                        ),
                        const SizedBox(width: Dimensions.paddingSizeSmall),

                      ]),
                    );
                  },),

                  CustomInkWellWidget(
                    child: MenuItem2(image: "assets/image/logout.png",title: 'Logout'.tr),
                    onTap: () => Get.find<ProfileController>().logOut(context),
                  ),


                ]),



  // Support
              ProfileHeader(title: 'Support'.tr),
               
                Row(children: [
                   if(((splashController.configModel!.companyEmail != null) || (splashController.configModel!.companyPhone != null)))
                    CustomInkWellWidget(
                      child: MenuItem2(image: Images.supportLogo,title: '24_support'.tr),
                      onTap: () => Get.toNamed(RouteHelper.getSupportRoute()),
                    ),

                  CustomInkWellWidget(
                    child: MenuItem2(image: Images.questionLogo, title: 'faq'.tr),
                    onTap:()=> Get.toNamed(RouteHelper.faq),)

                ]),





                ProfileHeader(title: 'setting'.tr),

                Column(children: [

                
                  
                  if(transactionTableModelList.isNotEmpty) CustomInkWellWidget(
                    child: widget.MenuItem(
                      image: Images.transactionLimit,
                      title: 'transaction_limit'.tr,
                    ),
                    onTap: () => Get.to(()=> TransactionLimitScreen(
                      transactionTableModelList: transactionTableModelList,
                    )),
                  ),

                  CustomInkWellWidget(
                    child: widget.MenuItem(image: Images.pinChangeLogo,title: 'change_pin'.tr),
                    onTap:()=> Get.toNamed(RouteHelper.getChangePinRoute()),
                  ),

                 if(AppConstants.languages.length > 1) CustomInkWellWidget(
                    child: widget.MenuItem(image: Images.languageLogo, title: 'change_language'.tr),
                    onTap:()=> Get.toNamed(RouteHelper.getChoseLanguageRoute()),
                  ),

                  if(Get.find<SplashController>().configModel!.twoFactor!)
                    GetBuilder<ProfileController>(builder: (profileController){
                      return profileController.isLoading ? const TwoFactorShimmer() :
                      StatusMenu(
                        title: 'two_factor_authentication'.tr,
                        leading: Image.asset(Images.twoFactorAuthentication,width: 28.0),
                      );
                    }),

                  if(authController.isBiometricSupported) StatusMenu(
                    title: 'biometric_login'.tr, leading: SizedBox(width: 25,child: Image.asset(Images.fingerprint)), isAuth: true,
                  ),

                  if(splashController.configModel?.selfDelete == true) CustomInkWellWidget(
                    child: widget.MenuItem(
                      iconData: Icons.delete, image: null, title: 'delete_account'.tr,
                    ),
                    onTap: () {
                      DialogHelper.showAnimatedDialog(context,
                          CustomDialogWidget(
                            icon: Icons.question_mark_sharp,
                            title: 'are_you_sure_to_delete_account'.tr,
                            description: 'it_will_remove_your_all_information'.tr,
                            onTapFalseText: 'no'.tr,
                            onTapTrueText: 'yes'.tr,
                            isFailed: true,
                            onTapFalse: () => Get.back(),
                            onTapTrue: () => Get.find<AuthController>().removeUser(),
                            bigTitle: true,
                          ),
                          dismissible: false,
                          isFlip: true);
                    },
                  ),


                  GetBuilder<ProfileController>(builder: (profileController){
                    return Container(
                      padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                      child: Row( children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                          child: Image.asset(Images.changeTheme,width: Dimensions.fontSizeOverOverLarge,),
                        ),

                        Text('dark_mode'.tr,style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),

                        const Spacer(),

                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap:()=> profileController.onChangeTheme(),
                          child: Transform.scale(scale: 1, child: Switch(
                            onChanged: (_){
                              profileController.onChangeTheme();
                            },
                            value: profileController.isSwitched,
                            activeColor: Theme.of(context).primaryColor,
                            activeTrackColor: Colors.white,
                            inactiveThumbColor: Theme.of(context).primaryColor,
                            inactiveTrackColor: Colors.black26,
                          )),
                        ),
                        const SizedBox(width: Dimensions.paddingSizeSmall),

                      ]),
                    );
                  },)

                ],
                ),


                ProfileHeader(title: 'policies'.tr),

                Column(children: [

                  CustomInkWellWidget(
                    child: widget.MenuItem(image: Images.aboutUs,title: 'about_us'.tr),
                    onTap:()=> Get.toNamed(RouteHelper.aboutUs),
                  ),

                  CustomInkWellWidget(
                    child: widget.MenuItem(image: Images.terms,title: 'terms'.tr),
                    onTap:()=> Get.toNamed(RouteHelper.terms),
                  ),

                  CustomInkWellWidget(
                    child: widget.MenuItem(image: Images.privacy, title: 'privacy_policy'.tr),
                    onTap:()=> Get.toNamed(RouteHelper.privacy),
                  ),
                ],),

                
              ],
            ),
          ),
        );
      },)

    );
  }
}





