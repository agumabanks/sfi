import 'package:Sanaa/features/banking/loans/controllers/loanController.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import 'domain/loan_offermodal.dart';
import 'widget/loanCard.dart';
import 'widget/loan_calculator_screen.dart';


class LoanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              LoanCard(),
              ],
          ),
        );
  }
}

