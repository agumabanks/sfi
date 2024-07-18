import 'package:Sanaa/features/banking/loans/domain/loan_offermodal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/loanController.dart';
import 'loan_calculator_screen.dart';

class LoanOffersScreen extends StatelessWidget {
  final LoanController controller = Get.put(LoanController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text('Available Loans')),
          body: 
            // if (controller.loanOffers.isEmpty) {
            //    Center(child: CircularProgressIndicator());
            // }
        
             GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 3 / 2, // Adjust this value to change the aspect ratio of the grid items
              ),
              itemCount: controller.loanOffers.length,
              itemBuilder: (context, index) {
                LoanOffer offer = controller.loanOffers[index];
                return GestureDetector(
                  onTap: () {
                    controller.selectLoanOffer(offer);
                    Get.to(() => LoanCalculatorScreen());
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            offer.planName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Interest rate: ${offer.installmentValue}%',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          // }),
        );
      }
    );
  }
}
