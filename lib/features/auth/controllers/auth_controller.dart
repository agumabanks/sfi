
import 'dart:async';
import 'dart:convert';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_number/phone_number.dart';
import 'package:Sanaa/features/transaction_money/controllers/bootom_slider_controller.dart';
import 'package:Sanaa/features/setting/controllers/profile_screen_controller.dart';
import 'package:Sanaa/features/camera_verification/controllers/camera_screen_controller.dart';
import 'package:Sanaa/features/splash/controllers/splash_controller.dart';
import 'package:Sanaa/features/verification/controllers/verification_controller.dart';
import 'package:Sanaa/data/api/api_checker.dart';
import 'package:Sanaa/data/api/api_client.dart';
import 'package:Sanaa/common/models/signup_body_model.dart';
import 'package:Sanaa/common/models/response_model.dart';
import 'package:Sanaa/features/auth/domain/models/user_short_data_model.dart';
import 'package:Sanaa/features/auth/domain/reposotories/auth_repo.dart';
import 'package:Sanaa/helper/route_helper.dart';
import 'package:Sanaa/util/app_constants.dart';
import 'package:Sanaa/helper/custom_snackbar_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../banking/loans/domain/userLoan.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo}) {
    _biometric = authRepo.isBiometricEnabled();
    checkBiometricSupport();
  }

    bool _isLoading = false;
    bool _isVerifying = false;
    bool _biometric = true;
    bool _isBiometricSupported = false;
    List<BiometricType> _bioList = [];
    List<BiometricType> get bioList => _bioList;

    bool get isLoading => _isLoading;
    bool get isVerifying => _isVerifying;
    bool get biometric => _biometric;
    bool get isBiometricSupported => _isBiometricSupported;

  UserShortDataModel? userData;
  String? phoneNumberUser;
Future<void> getCustomerData() async {
  try {
    _isLoading = true;
    update();

    userData = Get.find<AuthController>().getUserData();
    phoneNumberUser = userData!.phone!;

    Response response = await authRepo.getCustomerData(phoneNumber: "+256${phoneNumberUser}");

    if (response.statusCode == 200) {
      if (response.body['user_type'] == 'customer') {
       
       
      } else {
        // Handle the case for agents or other user types
         var customerData = response.body['customer'];

        // Save customer data in shared preferences as a JSON string
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String customerDataJson = jsonEncode(customerData);
        await prefs.setString('customerData', customerDataJson);

        // Retrieve and print the customer data to verify it is saved
        String? savedCustomerDataJson = prefs.getString('customerData');
        Map<String, dynamic> savedCustomerData = jsonDecode(savedCustomerDataJson!);
        var userId = savedCustomerData['id'];
        print('________________________________________________________________'); print('________________________________________________________________'); print('________________________________________________________________');
        print('Saved customer data: $savedCustomerData');
                print('________________________________________________________________'); 
                print('_______________________________${userId}_________________________________');
                 print('________________________________________________________________');

        print('User is not a customer 2222222222');
      }
    } else {
      // Handle non-200 status codes
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions
    print('Exception: $e');
  } finally {
    _isLoading = false;
    update();
  }
}

Future<void> printSavedUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedUserId = prefs.getString('userID');
  print('Saved user ID: $savedUserId');
}


 List<UserLoan> _userLoans = [];
 List<UserLoan> get userLoans => _userLoans;

Future<void> getUserLoans2() async {
  print('Getting user loans');

  try {
    Response response = await authRepo.userLoansList('24');
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print('Decoded response data: $responseData');

      if (responseData is Map<String, dynamic>) {
        if (responseData['loans'] != null) {
          final loansData = responseData['loans'];
          print('Loans data: $loansData');

          if (loansData is List) {
            _userLoans = loansData
                .map((loan) => UserLoan.fromJson(loan as Map<String, dynamic>))
                .toList();
          } else if (loansData is Map<String, dynamic>) {
            _userLoans = [UserLoan.fromJson(loansData)];
          } else {
            _userLoans = [];
          }
          update();
          print('User Loans: $_userLoans');
        } else {
          _userLoans = [];
          update();
          throw Exception('No loans found or invalid response structure');
        }
      } else {
        _userLoans = [];
        update();
        throw Exception('Invalid response structure');
      }
    } else {
      _userLoans = [];
      update();
      throw Exception('Failed to get user loans: ${response.statusCode}');
    }
  } catch (error) {
    _userLoans = [];
    update();
    print('Error getting user loans: $error');
    rethrow;
  }
}



Future<List<UserLoan>> getUserLoans() async {
   
    Response response = await authRepo.userLoansList('24');
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');
       
        if (response.statusCode == 200) {
          print('getting boddy ______________________________');
            return userLoanFromJson(response.body);
          } else {
            throw Exception('Failed to load user loans 22');
          }
  }





  Future<void> getUserLoansll() async {
     try {
      // final response = await http.get(Uri.parse(url));


       

      // if (response.statusCode == 200) {
      //   final List<dynamic> responseData = jsonDecode(response.body);
      //   _userLoans = responseData.map((json) => UserLoan.fromJson(json)).toList();
        
      //   if (response.statusCode == 200) {
      //   final List<dynamic> responseData = jsonDecode(response.body);
      //   _userLoans = responseData.map((json) => UserLoan.fromJson(json)).toList();
      //   update();}
        
      //   print('__________ User Loans: $userLoans');
      // } else {
      //   print('Failed to load loan offers. Status code: ${response.statusCode}');
      // }
    } catch (e) {
      print('Failed to load loan offers. Error: $e');
    }
  }

  void updateLoans() {
    update();
  }

    Future<void> _callSetting() async {
      final LocalAuthentication bioAuth = LocalAuthentication();
      _bioList = await bioAuth.getAvailableBiometrics();
      if(_bioList.isEmpty){
        try{
          AppSettings.openAppSettings(type: AppSettingsType.lockAndPassword);
        }catch(e){
          debugPrint('error ===> $e');
        }
      }
    }

    Future<void> updatePin(String pin) async {
      await authRepo.writeSecureData(AppConstants.biometricPin, pin);
    }

    bool setBiometric(bool isActive) {
      _callSetting().then((value) {
        _callSetting();
      });

      final String? pin = Get.find<BottomSliderController>().pin;
      Get.find<ProfileController>().pinVerify(getPin: pin, isUpdateTwoFactor: false).then((response) async {
        if(response.statusCode == 200 && response.body != null) {
          _biometric = isActive;
          authRepo.setBiometric(isActive && _bioList.isNotEmpty);
          try{
            await authRepo.writeSecureData(AppConstants.biometricPin, pin);
          }catch(error) {
            debugPrint('error ===> $error');
          }
          Get.back(closeOverlays: true);
          update();
        }
      });

    return _biometric;
  }


  Future<String> biometricPin() async {
      return await  authRepo.readSecureData(AppConstants.biometricPin);
  }

  Future<void> removeBiometricPin() async {
    return await  authRepo.deleteSecureData(AppConstants.biometricPin);
  }

  void checkBiometricWithPin() async {
    if(_biometric && (await biometricPin() == ''))  {
      authRepo.setBiometric(false).then((value) => _biometric = authRepo.isBiometricEnabled());
    }
  }

  Future<void> authenticateWithBiometric(bool autoLogin, String? pin) async {
    final LocalAuthentication bioAuth = LocalAuthentication();
    _bioList = await bioAuth.getAvailableBiometrics();
    if((await bioAuth.canCheckBiometrics || await bioAuth.isDeviceSupported()) && authRepo.isBiometricEnabled()) {
      final List<BiometricType> availableBiometrics = await bioAuth.getAvailableBiometrics();
      if (availableBiometrics.isNotEmpty && (!autoLogin || await biometricPin() != '')) {
        try {
          final bool didAuthenticate = await bioAuth.authenticate(
            localizedReason: autoLogin ? 'please_authenticate_to_login'.tr : 'please_authenticate_to_easy_access_for_next_time'.tr,
            options: const AuthenticationOptions(stickyAuth: true, biometricOnly: true),
          );
          if(didAuthenticate) {
            if(autoLogin) {
              login(code: getUserData()?.countryCode, phone: getUserData()?.phone, password: await biometricPin());
            }else{
              authRepo.writeSecureData(AppConstants.biometricPin, pin);
            }
          }else{
            if(pin != null) {
              authRepo.setBiometric(false);
            }
          }
        } catch(e) {
          bioAuth.stopAuthentication();
        }
      }
    }
  }

  void checkBiometricSupport() async {
    final LocalAuthentication bioAuth = LocalAuthentication();
    _isBiometricSupported = await bioAuth.canCheckBiometrics || await bioAuth.isDeviceSupported();
  }

 
  Future<Response> checkPhone(String phoneNumber) async{
      _isLoading = true;
      update();
      Response response = await authRepo.checkPhoneNumber(phoneNumber: phoneNumber);

      if(response.statusCode == 200){
        if(!Get.find<SplashController>().configModel!.phoneVerification!) {
          requestCameraPermission(fromEditProfile: false);
        }else if(response.body['otp'] == "active"){
         Get.find<VerificationController>().startTimer();
         Get.toNamed(RouteHelper.getVerifyRoute());
        }else{
          showCustomSnackBarHelper(response.body['message']);
        }

      }
      else if(response.statusCode == 403 && response.body['user_type'] == 'customer'){
        String? countryCode;
        String? nationalNumber;
        try{
          PhoneNumber number = await PhoneNumberUtil().parse(phoneNumber);


           countryCode = '+${number.countryCode}';
           nationalNumber = number.nationalNumber;
        }
        catch(e){
          debugPrint('error ===> $e');
        }
        authRepo.setBiometric(false);
        Get.offNamed(RouteHelper.getLoginRoute(countryCode: countryCode,phoneNumber: nationalNumber));

      }
      else{
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
      return response;
    }


  Future<void> requestCameraPermission({required bool fromEditProfile}) async {
    var serviceStatus = await Permission.camera.status;

    if(serviceStatus.isGranted && GetPlatform.isAndroid){
      Get.offNamed(RouteHelper.getSelfieRoute(fromEditProfile: fromEditProfile));
    }else{
      if(GetPlatform.isIOS){
        Get.offNamed(RouteHelper.getSelfieRoute(fromEditProfile: fromEditProfile));
      }else{
        final status = await Permission.camera.request();
        if (status == PermissionStatus.granted) {
          Get.offNamed(RouteHelper.getSelfieRoute(fromEditProfile: fromEditProfile));
        } else if (status == PermissionStatus.denied) {
          Get.find<CameraScreenController>().showDeniedDialog(fromEditProfile: fromEditProfile);
        } else if (status == PermissionStatus.permanentlyDenied) {
          Get.find<CameraScreenController>().showPermanentlyDeniedDialog(fromEditProfile: fromEditProfile);
        }
      }

    }
  }

    //Phone Number verification
  Future<ResponseModel> phoneVerify(String phoneNumber,String otp) async{
    _isLoading = true;
    update();
    Response response = await authRepo.verifyPhoneNumber(phoneNumber: phoneNumber, otp: otp);

    ResponseModel responseModel;
    if(response.statusCode == 200){
      responseModel = ResponseModel(true, response.body["message"]);
      Get.find<VerificationController>().cancelTimer();
      showCustomSnackBarHelper(responseModel.message, isError: false);
      requestCameraPermission(fromEditProfile: false);
    }
    else{
      responseModel = ResponseModel(false, response.body['errors'][0]['message']);
      showCustomSnackBarHelper(
          responseModel.message,
          isError: true);
    }
    _isLoading = false;
    update();
    return responseModel;
  }


  // registration ..
  Future<Response> registration(SignUpBodyModel signUpBody,List<MultipartBody> multipartBody) async{
      _isLoading = true;
      update();

      Map<String, String> allCustomerInfo = {
        'f_name': signUpBody.fName ?? '',
        'l_name': signUpBody.lName ?? '',
        'phone': signUpBody.phone!,
        'dial_country_code': signUpBody.dialCountryCode!,
        'password': signUpBody.password!,
        'gender': signUpBody.gender!,
        'occupation': signUpBody.occupation ?? '',
      };
      if(signUpBody.otp != null) {
        allCustomerInfo.addAll({'otp': signUpBody.otp!});
      }
      if(signUpBody.email != '') {
        allCustomerInfo.addAll({'email': signUpBody.email!});
      }

      Response response = await authRepo.registration(allCustomerInfo, multipartBody);

      if (response.statusCode == 200) {
        Get.find<CameraScreenController>().removeImage();

        await setUserData(UserShortDataModel(
          countryCode: signUpBody.dialCountryCode,
          phone: signUpBody.phone,
          name: '${signUpBody.fName} ${signUpBody.lName}'
        ));

        Get.offAllNamed(RouteHelper.getWelcomeRoute(
          countryCode: signUpBody.dialCountryCode,phoneNumber: signUpBody.phone,
          password: signUpBody.password,
        ));

      } else {
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
      return response;
  }


  Future<Response> login({String? code, String? phone, String? password}) async {
    _isLoading = true;
    update();

    Response response = await authRepo.login(phone: phone, password: password, dialCode: code);

    if (response.statusCode == 200 && response.body['response_code'] == 'auth_login_200' && response.body['content'] != null) {
       authRepo.saveUserToken(response.body['content']).then((value) async {
         await authRepo.updateToken();
       });
      if(Get.currentRoute != RouteHelper.navbar) {
        Get.offAllNamed(RouteHelper.getNavBarRoute(), arguments: true);
      }
    }
    else{
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
    return response;
  }


  Future removeUser() async {

    _isLoading = true;
    update();
    Get.back();
    Response response = await authRepo.deleteUser();

    if (response.statusCode == 200) {
      Get.find<SplashController>().removeSharedData();
      showCustomSnackBarHelper('your_account_remove_successfully'.tr);
      Get.offAllNamed(RouteHelper.getSplashRoute());
    }else{
      Get.back();
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }


  Future<Response> checkOtp()async{
      _isLoading = true;
      update();
      Response  response = await authRepo.checkOtpApi();
      if(response.statusCode == 200){
        _isLoading = false;
      }else{
        _isLoading = false;
        ApiChecker.checkApi(response);
      }
      update();
      return response;
  }

  Future<Response> verifyOtp(String otp)async{
    _isVerifying = true;
    update();
    Response  response = await authRepo.verifyOtpApi(otp: otp);
    if(response.statusCode == 200){
      _isVerifying = false;
      Get.back();
    }else{
      Get.back();
      ApiChecker.checkApi(response);
      _isVerifying = false;
    }
    _isVerifying = false;
    update();
    return response;
  }


  Future<Response> logout() async {
    _isLoading = true;
    update();
    Response response = await authRepo.logout();
    if (response.statusCode == 200) {

      Get.offAllNamed(RouteHelper.getSplashRoute());
      _isLoading = false;
    }
    else{
      _isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
    return response;
  }

  Future<ResponseModel?> otpForForgetPass(String phoneNumber) async{
    _isLoading = true;
    update();
    Response response = await authRepo.forgetPassOtp(phoneNumber: phoneNumber);
    ResponseModel? responseModel;

    if(response.statusCode == 200){
      _isLoading = false;
      Get.toNamed(RouteHelper.getVerifyRoute(phoneNumber: phoneNumber));
    }
    else{
      _isLoading = false;
      ApiChecker.checkApi(response);

    }
    update();
    return responseModel;
  }

  Future<Response> verificationForForgetPass(String? phoneNumber, String otp) async{
    _isLoading = true;
    update();
    Response response = await authRepo.forgetPassVerification(phoneNumber: phoneNumber,otp: otp);

    if(response.statusCode == 200){
      _isLoading = false;
      Get.offNamed(RouteHelper.getFResetPassRoute(phoneNumber: phoneNumber, otp: otp));
    }
    else{
      _isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
    return response;
  }


  String? getAuthToken() {
    return authRepo.getUserToken();
  }


  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  void removeCustomerToken() {
    authRepo.removeCustomerToken();
  }



  Future setUserData(UserShortDataModel userData) async {
    await authRepo.setUserData(userData);
  }
  UserShortDataModel? getUserData(){
    UserShortDataModel? userData;
    if(authRepo.getUserData() != '') {
      userData = UserShortDataModel.fromJson(jsonDecode(authRepo.getUserData()));
    }
    return userData;
  }

  void removeUserData()=>  authRepo.removeUserData();
}
