class RechargeHistoryItem {
  String header;
  int srNo;
  String date;
  double? actualRechargeAmount;
  double? platformBonusAmount;
  double? totalAmount;
  String paymentMethod;
  RechargeHistoryItem({
    required this.header,
    required this.srNo,
    required this.date,
    required this.actualRechargeAmount,
    required this.platformBonusAmount,
    required this.totalAmount,
    required this.paymentMethod,
  });
}
