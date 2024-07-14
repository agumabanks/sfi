import 'package:get/get.dart';

import '../../banking/loans/domain/loan_offermodal.dart';
import 'dart:math' as math;


class HomeController extends GetxController implements GetxService{

///banking section for loans
/// check loan offers
bool _isCheckLoanOffers = false;
bool get isCheckLoanOffers => _isCheckLoanOffers;

 var loanOffers = <LoanOffer>[].obs;
  var selectedLoanOffer = Rxn<LoanOffer>();

  @override
  void onInit() {
    super.onInit();
    fetchLoanOffers();
  }

  void fetchLoanOffers() {
    // Replace this with actual API call to fetch loan offers
    loanOffers.assignAll([
      
    ]);
  }

  
  
  double calculateMonthlyPayment(int amount, int term, double interestRate) {
    double monthlyRate = interestRate / 12 / 100;
    return (amount * monthlyRate) / (1 - (1 / math.pow(1 + monthlyRate, term)));
  }

  void selectLoanOffer(LoanOffer offer) {
    selectedLoanOffer.value = offer;
  }

/// apply for loan
/// loan calculator
/// loan repayment
/// loan history
/// loan details
/// loan approval
/// loan rejection
/// loan processing
/// loan disbursement
/// loan completion. 



///Banking section for savings
/// check savings account
/// apply for savings account
/// savings calculator
/// savings history
/// savings details
/// savings approval
/// savings rejection
/// savings processing
/// savings disbursement
/// savings completion.
/// savings withdrawal
/// savings deposit
/// savings transfer
/// savings balance
/// savings interest
/// savings maturity
/// savings closure
/// savings termination
/// savings account closure
/// 




/// Banking Section for the fixed Deposit
/// check fixed deposit account
///  apply for fixed deposit account
/// fixed deposit calculator
/// fixed deposit history
/// fixed deposit details
/// fixed deposit approval
/// fixed deposit rejection
/// fixed deposit processing
/// fixed deposit disbursement
/// fixed deposit completion.
/// fixed deposit withdrawal
/// 


  ///Hero tag
   final String _heroShowQr = 'show-qr-hero';
   String get heroShowQr => _heroShowQr;

   ///Greetings

   String greetingMessage(){

     var timeNow = DateTime.now().hour;

     if (timeNow <= 12) {
       return 'good_morning'.tr;
     } else if ((timeNow > 12) && (timeNow <= 16)) {
       return 'good_afternoon'.tr;
     } else if ((timeNow > 16) && (timeNow < 20)) {
       return 'good_evening'.tr;
     } else {
       return 'good_night'.tr;
     }
   }


}