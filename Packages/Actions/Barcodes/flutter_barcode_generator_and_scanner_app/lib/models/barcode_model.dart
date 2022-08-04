// BarcodeModel: Model Class
class BarcodeModel {
  // Final: Class Properties
  final String data;
  final int amount;
  final int usage;
  final DateTime dateTime;

  // Constructor
  BarcodeModel({
    required this.data,
    required this.amount,
    required this.usage,
    required this.dateTime,
  });

  // Convert JSON To Model

  // Convert Model To JSON
  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      "data": data,
      "amount": amount,
      "usage": usage,
      "dateTime": dateTime,
    };

    return jsonData;
  }
}
