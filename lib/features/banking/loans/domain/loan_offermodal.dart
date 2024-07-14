class LoanOffer {
  final String id;
  final String planName;
  final int minAmount;
  final int maxAmount;
  final double installmentValue;
  final String installmentInterval; // Could be monthly, weekly, etc.
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
}
