class LoanApplication {
  final String loanOfferId;
  final int amount;
  final int term; // in months
  final double monthlyPayment;
  final double totalPayment;

  LoanApplication({
    required this.loanOfferId,
    required this.amount,
    required this.term,
    required this.monthlyPayment,
    required this.totalPayment,
  });
}
