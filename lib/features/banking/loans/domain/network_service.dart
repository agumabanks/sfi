// lib/network_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'userLoan.dart';
// import 'user_loan.dart';

class NetworkService {
  static const String baseUrl = 'https://finmicro.sanaa.co/api/v1';

  Future<List<UserLoan>> fetchUserLoans(int userId) async {
    final response = await http.post(Uri.parse('https://finmicro.sanaa.co/api/v1/loan-lists/?id=1'));

    if (response.statusCode == 200) {
      return userLoanFromJson(response.body);
    } else {
      throw Exception('Failed to load user loans 22');
    }
  }
}
