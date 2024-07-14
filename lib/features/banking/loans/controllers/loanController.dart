import 'package:Sanaa/features/banking/loans/domain/loan_offermodal.dart';
import 'package:get/get.dart';
import 'dart:math';
// import 'loan_offer.dart';

class LoanController extends GetxController {
  var loanOffers = <LoanOffer>[].obs;
  var selectedLoanOffer = Rxn<LoanOffer>();
  var monthlyPayment = 0.0.obs;
  var dailyPayment = 0.0.obs;
  var totalPayment = 0.0.obs;

// var selectedLoanOffer = Rx<LoanOffer?>(null);
//   var monthlyPayment = 0.0.obs;
//   var dailyPayment = 0.0.obs;
//   var totalPayment = 0.0.obs;
  var loanAmount = 0.obs;
  var loanTerm = 0.obs;
  var agreeToTerms = false.obs; 
  @override
  void onInit() {
    super.onInit();
    fetchLoanOffers();
  }

  void fetchLoanOffers() {
    // Replace this with actual API call to fetch loan offers
    loanOffers.assignAll([
      LoanOffer(
        id: '1',
        planName: 'Personal Loan',
        minAmount: 250000,
        maxAmount: 1000000,
        installmentValue: 50.0,  // Placeholder value
        installmentInterval: 'monthly',  // Placeholder value
        totalInstallments: 12,  // Placeholder value
        instructions: 'Personal loan instructions',  // Placeholder value
      ),
      LoanOffer(
        id: '2',
        planName: 'Business Loan',
        minAmount: 300000,
        maxAmount: 5000000,
        installmentValue: 10000.0,  // Placeholder value
        installmentInterval: 'monthly',  // Placeholder value
        totalInstallments: 24,  // Placeholder value
        instructions: 'Business loan instructions',  // Placeholder value
      ),
      LoanOffer(
        id: '3',
        planName: 'Boda Boda Loan',
        minAmount: 5000000,
        maxAmount: 8700000,
        installmentValue: 15000.0,  // Placeholder value
        installmentInterval: 'monthly',  // Placeholder value
        totalInstallments: 18,  // Placeholder value
        instructions: 'Boda Boda loan instructions',  // Placeholder value
      ),
      LoanOffer(
        id: '4',
        planName: 'School Fees Loan',
        minAmount: 300000,
        maxAmount: 5000000,
        installmentValue: 5000.0,  // Placeholder value
        installmentInterval: 'monthly',  // Placeholder value
        totalInstallments: 10,  // Placeholder value
        instructions: 'School fees loan instructions',  // Placeholder value
      ),
      LoanOffer(
        id: '5',
        planName: 'Car Loan',
        minAmount: 300000,
        maxAmount: 50000000,
        installmentValue: 20000.0,  // Placeholder value
        installmentInterval: 'monthly',  // Placeholder value
        totalInstallments: 36,  // Placeholder value
        instructions: 'Car loan instructions',  // Placeholder value
      ),
    ]);

  
  }

  void calculateLoan(int amount, int term, double interestRate) {
   var  loanAmount = amount;
  var loanTerm = term;
    double monthlyRate = interestRate / 12 / 100;
    monthlyPayment.value = (amount * monthlyRate) / (1 - (1 / pow((1 + monthlyRate), term)));
    totalPayment.value = monthlyPayment.value * term;
    dailyPayment.value = totalPayment.value / (term * 30); // Roughly approximate daily payment
  }
  void resetPaymentValues() {
    monthlyPayment.value = 0.0;
    dailyPayment.value = 0.0;
    totalPayment.value = 0.0;
    dailyPayment.value = 0.0;
    totalPayment.value = 0.0;
    loanAmount.value = 0;
    loanTerm.value = 0;
    agreeToTerms.value = false;
  }

  void selectLoanOffer(LoanOffer offer) {
    selectedLoanOffer.value = offer;
  }

  void submitLoanApplication() {
    // Handle the loan application submission logic here
    // This could involve sending data to an API and handling the response
  }
}