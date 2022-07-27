// DataModel: Model Class
class DataModel {
  // Final: Class Properties
  final String date;
  String invoiceNo;
  final String stockCode;
  final String description;
  final String quantity;
  final String price;
  final String amount;

  // Constructor
  DataModel({
    required this.date,
    required this.invoiceNo,
    required this.stockCode,
    required this.description,
    required this.quantity,
    required this.price,
    required this.amount,
  });
}
