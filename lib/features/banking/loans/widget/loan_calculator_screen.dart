import 'package:Sanaa/features/banking/loans/controllers/loanController.dart';
import 'package:Sanaa/features/banking/loans/domain/loan_offermodal.dart';
import 'package:Sanaa/features/banking/loans/widget/LoanConfirmationScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../auth/controllers/auth_controller.dart';

class LoanCalculatorScreen extends StatelessWidget {
  final LoanController controller = Get.find();

  final amountController = TextEditingController();
  final termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoanOffer offer = controller.selectedLoanOffer!;

    return GetBuilder<LoanController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${offer.planName} Calculator'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                controller.resetPaymentValues();
                Get.back();
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: amountController,
                    decoration: InputDecoration(labelText: 'Amount'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: termController,
                    decoration: InputDecoration(labelText: 'Term (months)'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      int amount = int.parse(amountController.text);
                      int term = int.parse(termController.text);
                      controller.calculateLoan(amount, term, offer.installmentValue);
                    },
                    child: Text('Calculate'),
                  ),
                  SizedBox(height: 20),
                  if (controller.monthlyPayment > 0 && controller.totalPayment > 0) 
                    Column(
                      children: [
                        GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Monthly Payment', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 8),
                                    Text('${controller.monthlyPayment.toStringAsFixed(2)}  /=', style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Daily Payment', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 8),
                                    Text('${controller.dailyPayment.toStringAsFixed(2)} /=', style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Total Payment', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 8),
                                    Text('${controller.totalPayment.toStringAsFixed(2)} /=', style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Interest Rate', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 8),
                                    Text('${offer.installmentValue}%', style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                           
                            Get.find<AuthController>().getCustomerData();

                            Get.to(() => LoanConfirmationScreen());
                          },
                          child: Text('Apply Now'),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
