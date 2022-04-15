class WithdrawReportItem {
  String date;
  double openingBalance;
  double withdrawAmount;
  double tds;
  double adminCharges;
  double netAmountPaid;
  double finalBalance;
  WithdrawReportItem({
    required this.date,
    required this.openingBalance,
    required this.withdrawAmount,
    required this.tds,
    required this.adminCharges,
    required this.netAmountPaid,
    required this.finalBalance,
  });
}
