// Define the LoanOffer model
class LoanOffer {
  final String id;
  final String planName;
  final double minAmount;
  final double maxAmount;
  final double installmentValue;
  final String installmentInterval;
  final int totalInstallments;
  final String instructions;

  LoanOffer({
    required this.id,
    required this.planName,
    required this.minAmount,
    required this.maxAmount,
    required this.installmentValue,
    required this.installmentInterval,
    required this.totalInstallments,
    required this.instructions,
  });

  // Factory method to create a LoanOffer from JSON data
  factory LoanOffer.fromJson(Map<String, dynamic> json) {
    return LoanOffer(
      id: json['id'].toString(),
      planName: json['plan_name'],
      minAmount: double.parse(json['min_amount']),
      maxAmount: double.parse(json['max_amount']),
      installmentValue: double.parse(json['installment_value']),
      installmentInterval: json['installment_interval'].toString(), // Assuming installment_interval is a string
      totalInstallments: json['total_installments'],
      instructions: json['instructions'] ?? '',
    );
  }
}