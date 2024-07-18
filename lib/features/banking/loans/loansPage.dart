import 'package:Sanaa/features/banking/loans/controllers/loanController.dart';
import 'package:Sanaa/features/banking/loans/domain/userLoan.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import 'domain/loan_offermodal.dart';
import 'widget/loanCard.dart';
import 'widget/loan_calculator_screen.dart';
import 'widget/userLoans.dart';


class LoanApp extends StatelessWidget {
  final LoanController controller = Get.put(LoanController());
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              LoanCard(),
              //  SingleChildScrollView(
              //   child: Padding(
              //     padding: EdgeInsets.all(16.0),
              //     child: Column(
              //       children: [
              //         Text(
              //           'Loan Offers',
              //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //         ),
              //         SizedBox(height: 10),
              //         LoanListScreen()     
              //   ],
              //     ),
              //   )
              // )
              ],
          ),
        );
  }
}

