import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/loanController.dart';

class LoanConfirmationScreen extends StatelessWidget {
  final LoanController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loan Confirmation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Loan Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Loan Amount: ${controller.loanAmount.value} /='),
                    Text('Term: ${controller.loanTerm.value} months '),
                    Text('Interest Rate: ${controller.selectedLoanOffer.value?.installmentValue}%'),
                    Text('Monthly Payment: ${controller.monthlyPayment.value.toStringAsFixed(2)} /='),
                    Text('Total Payment: ${controller.totalPayment.value.toStringAsFixed(2)} /='),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Terms and Conditions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Please read and agree to the terms and conditions before proceeding.',
              style: TextStyle(fontSize: 16),
            ),
            // Add more detailed terms and conditions here
            CheckboxListTile(
              title: Text('I agree to the terms and conditions.'),
              value: controller.agreeToTerms.value,
              onChanged: (bool? value) {
                controller.agreeToTerms.value = value ?? false;
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: controller.agreeToTerms.value
                    ? () {
                        controller.submitLoanApplication();
                        Get.to(() => LoanApplicationStatusScreen());
                      }
                    : null,
                child: Text('Submit Application'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoanApplicationStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Application Status')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              'Your loan application is being processed.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
