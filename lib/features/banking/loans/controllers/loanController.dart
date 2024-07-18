import 'dart:math';
import 'package:Sanaa/data/api/api_client.dart';
import 'package:Sanaa/features/auth/controllers/auth_controller.dart';
import 'package:Sanaa/features/auth/domain/models/user_short_data_model.dart';
import 'package:Sanaa/features/banking/loans.dart';
import 'package:Sanaa/features/banking/loans/domain/userLoan.dart';
import 'package:Sanaa/features/banking/loans/loansPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Sanaa/features/banking/loans/domain/loan_offermodal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class LoanController extends GetxController implements GetxService {
  // Private variables
  List<LoanOffer> _loanOffers = [];
  LoanOffer? _selectedLoanOffer;
  double _monthlyPayment = 0.0;
  double _dailyPayment = 0.0;
  double _totalPayment = 0.0;
  int _loanAmount = 0;
  int _loanTerm = 0;
  bool _agreeToTerms = false;
  bool _isLoading = false;

  // Getters
    List<UserLoan> _userLoans = [];

  List<UserLoan> get userLoans => _userLoans;
  List<LoanOffer> get loanOffers => _loanOffers;
  LoanOffer? get selectedLoanOffer => _selectedLoanOffer;
  double get monthlyPayment => _monthlyPayment;
  double get dailyPayment => _dailyPayment;
  double get totalPayment => _totalPayment;
  int get loanAmount => _loanAmount;
  int get loanTerm => _loanTerm;
  bool get agreeToTerms => _agreeToTerms;
  bool get isLoading => _isLoading;

  late ApiClient apiClient;

  var loans = <UserLoan>[].obs;

  var isLoadingLo = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchLoanOffers();
    // fetchUserLoans();
    // fetchLoans();
  }

  var isLoading2 = true.obs;
  var loans2 = <UserLoan>[].obs;


  
  // Fetch loan offers from the API
  Future<void> fetchLoanOffers() async {
    final url = 'https://finmicro.sanaa.co/api/v1/loan-plans';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        _loanOffers = responseData.map((json) => LoanOffer.fromJson(json)).toList();
        update();
      } else {
        print('Failed to load loan offers. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to load loan offers. Error: $e');
    }
  }

  // Fetch user loans from the API
  Future<void> fetchUserLoans() async {
    final url = 'https://finmicro.sanaa.co/api/v1/loan-lists/1';
    try {
     
        final response = await http.get(Uri.parse(url));
       _userLoans = [];

     

        jsonDecode(response.body)['loans'].forEach((loan) {
          UserLoan loans = UserLoan.fromJson(loan);});

          _userLoans.add(loans as UserLoan);
          update();

print('________________________________________________________________________________________________________');
print('__________________________________________________${_userLoans}______________________________________________________');
print('________________________________________________________________________________________________________');

    
    } catch (e) {

      print('________________________________________________________________________________________________________');
print('________________________________________________failed________________________________________________________');
print('________________________________________________________________________________________________________');


      print('Failed to load user loans. Error: $e');
    }
  }

  // Calculate loan payments
  void calculateLoan(int amount, int term, double interestRate) {
    _loanAmount = amount;
    _loanTerm = term;
    double monthlyRate = interestRate / 12 / 100;
    _monthlyPayment = (amount * monthlyRate) / (1 - (1 / pow((1 + monthlyRate), term)));
    _totalPayment = _monthlyPayment * term;
    _dailyPayment = _totalPayment / (term * 30); // Roughly approximate daily payment
    update();
  }

  // Reset payment values
  void resetPaymentValues() {
    _monthlyPayment = 0.0;
    _dailyPayment = 0.0;
    _totalPayment = 0.0;
    _loanAmount = 0;
    _loanTerm = 0;
    _agreeToTerms = false;
    update();
  }

  // Select a loan offer
  void selectLoanOffer(LoanOffer offer) {
    _selectedLoanOffer = offer;
    update();
  }

  // Toggle agree to terms
  void toggleAgreeToTerms() {
    _agreeToTerms = !_agreeToTerms;
    update();
  }

  // Validate loan application
  bool validateLoanApplication() {
    if (!_agreeToTerms) {
      Get.snackbar('Error', 'You must agree to the terms and conditions');
      return false;
    }
    if (_loanAmount <= 0 || _loanTerm <= 0) {
      Get.snackbar('Error', 'Loan amount and term must be greater than zero');
      return false;
    }
    return true;
  }

  // Generate a unique transaction ID
  String generateTransactionId() {
    var uuid = Uuid();
    var uniqueId = uuid.v4().substring(0, 8); // Taking a substring to make it shorter
    return 'TRX$uniqueId';
  }

  // Submit loan application
  Future<void> submitLoanApplication() async {
    if (!validateLoanApplication()) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedCustomerDataJson = prefs.getString('customerData');
    Map<String, dynamic> savedCustomerData = jsonDecode(savedCustomerDataJson!);
    var userId = savedCustomerData['id'];

    const url = 'https://finmicro.sanaa.co/api/v1/create-loans';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'user_id': userId, // Replace with actual user ID
      'plan_id': selectedLoanOffer!.id,
      'trx': generateTransactionId(), // Replace with actual transaction ID
      'amount': _loanAmount.toStringAsFixed(2),
      'per_installment': _monthlyPayment.toStringAsFixed(2),
      'installment_interval': 30,
      'total_installment': _loanTerm,
      'given_installment': 0,
      'paid_amount': 0.00,
      'final_amount': _totalPayment.toStringAsFixed(2),
      'user_details': '', // Replace with actual user details
      'next_installment_date': '', // Replace with actual date
    });

    try {
      final response = await http.post(Uri.parse(url), headers: headers, body: body);
      final data = jsonDecode(response.body);

      if (data['message'] == "Loan created successfully") {
        Get.snackbar('Success', data['message'],
            snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 5));
        Get.offAll(() => LoansPage());
      } else {
        Get.snackbar('Error', 'Failed to submit loan application');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while submitting loan application');
    }
  }

  // Apply for a loan
  Future<void> applyForLoan() async {
    await submitLoanApplication();
  }
}
