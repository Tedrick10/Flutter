// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Models
import '../../models/data_model.dart';
import '../../models/total_data_model.dart';

// PurchaseProvider: Provider Class
class PurchaseProvider with ChangeNotifier {
  // Changable: Class Properties
  final List<DataModel> _dataList = [
    DataModel(
      date: "30/01/2019",
      invoiceNo: "Inv-001",
      stockCode: "1001",
      description: "Book",
      quantity: "10",
      price: "1000",
      amount: "10000",
    ),
    DataModel(
      date: "30/01/2019",
      invoiceNo: "Inv-001",
      stockCode: "1002",
      description: "Pen",
      quantity: "5",
      price: "500",
      amount: "2500",
    ),
    DataModel(
      date: "30/01/2019",
      invoiceNo: "Inv-002",
      stockCode: "2001",
      description: "Book",
      quantity: "30",
      price: "2000",
      amount: "10000",
    ),
    DataModel(
      date: "30/01/2019",
      invoiceNo: "Inv-002",
      stockCode: "2002",
      description: "Pen",
      quantity: "5",
      price: "500",
      amount: "2500",
    ),
  ];
  List<TotalDataModel> _totalDataList = [];

  // Getters
  List<DataModel> get getPurchaseList => _dataList;
  List<TotalDataModel> get getTotalPurchaseList {
    addTotalDatatList();
    return _totalDataList;
  }

  String get getAllTotalQuantity {
    int totalQuantity = 0;
    for (DataModel data in _dataList) {
      totalQuantity += int.parse(data.quantity);
    }

    return totalQuantity.toString();
  }

  String get getAllTotalAmount {
    int totalAmount = 0;
    for (DataModel data in _dataList) {
      totalAmount += int.parse(data.amount);
    }

    return totalAmount.toString();
  }

  // Actions
  void addTotalDatatList() {
    _totalDataList = [];
    for (DataModel data in _dataList) {
      int index = _totalDataList
          .indexWhere((totalData) => totalData.invoiceNo == data.invoiceNo);

      if (index < 0) {
        int totalQuantity = 0;
        int totalAmount = 0;
        String invoiceNo = data.invoiceNo;
        List<DataModel> selectedDataModel = _dataList
            .where((innerData) => innerData.invoiceNo == invoiceNo)
            .toList();
        print("Length: $selectedDataModel");
        for (DataModel innerData in selectedDataModel) {
          totalQuantity += int.parse(innerData.quantity);
          totalAmount += int.parse(innerData.amount);
        }
        print("Total Quantity: $totalQuantity");
        print("Total Amount: $totalAmount");

        TotalDataModel totalDataModel = TotalDataModel(
          date: data.date,
          invoiceNo: data.invoiceNo,
          quantity: totalQuantity.toString(),
          amount: totalAmount.toString(),
        );
        _totalDataList.add(totalDataModel);
      }
    }
    notifyListeners();
  }

  void addInvoiceNo(String newInvoiceNo) {
    DateTime dateTime = DateTime.now();
    String date = dateTime.day.toString() +
        "/" +
        dateTime.month.toString() +
        "/" +
        dateTime.year.toString();
    String quantity = "0";
    String amount = "0";

    TotalDataModel totalDataModel = TotalDataModel(
      date: date,
      invoiceNo: newInvoiceNo,
      quantity: quantity,
      amount: amount,
    );
    _totalDataList.add(totalDataModel);
    notifyListeners();
  }

  void addDetailsWithStockCode(DataModel newDataModel) {
    _dataList.add(newDataModel);
    addTotalDatatList();
    notifyListeners();
  }

  void editInvoiceNo(String oldInvoiceNo, String newInvoiceNo) {
    for (int i = 0; i < _dataList.length; i++) {
      if (_dataList[i].invoiceNo == oldInvoiceNo) {
        _dataList[i].invoiceNo = newInvoiceNo;
      }
    }
    _totalDataList.removeWhere(
      (totalData) => totalData.invoiceNo == oldInvoiceNo,
    );

    notifyListeners();
  }

  void editDetailsWithStockCode(String stockCode, DataModel newDataModel) {
    for (int i = 0; i < _dataList.length; i++) {
      if (_dataList[i].stockCode == stockCode) {
        _dataList[i] = newDataModel;
      }
    }
    addTotalDatatList();
    notifyListeners();
  }

  void deleteInvoiceNo(String invoiceNo) {
    _totalDataList.removeWhere((totalData) => totalData.invoiceNo == invoiceNo);
    _dataList.removeWhere((data) => data.invoiceNo == invoiceNo);
    notifyListeners();
  }

  void deleteDetailsWithStockCode(String stockCode) {
    _dataList.removeWhere((data) => data.stockCode == stockCode);
    addTotalDatatList();
    notifyListeners();
  }

  void addData(DataModel dataModel) {
    _dataList.add(dataModel);
    notifyListeners();
  }

  void removeData(String stockCode) {
    int index = _dataList.indexWhere((data) => data.stockCode == stockCode);
    _dataList.removeAt(index);
    notifyListeners();
  }

  void editData(DataModel dataModel) {
    int index = _dataList.indexWhere(
      (data) => data.stockCode == dataModel.stockCode,
    );
    _dataList[index] = dataModel;
    notifyListeners();
  }

  String getTotalQuantity(String invoiceNo) {
    List<DataModel> selectedDataModel =
        _dataList.where((data) => data.invoiceNo == invoiceNo).toList();
    int totalQuantity = 0;
    for (DataModel data in selectedDataModel) {
      totalQuantity += int.parse(data.quantity);
    }

    return totalQuantity.toString();
  }

  String getTotalPrice(String invoiceNo) {
    List<DataModel> selectedDataModel =
        _dataList.where((data) => data.invoiceNo == invoiceNo).toList();
    int totalPrice = 0;
    for (DataModel data in selectedDataModel) {
      totalPrice += int.parse(data.amount);
    }

    return totalPrice.toString();
  }

  String getTotalAmount(String invoiceNo) {
    List<DataModel> selectedDataModel =
        _dataList.where((data) => data.invoiceNo == invoiceNo).toList();
    int totalAmount = 0;
    for (DataModel data in selectedDataModel) {
      totalAmount += int.parse(data.amount);
    }

    return totalAmount.toString();
  }

  TotalDataModel searchTotalWithInvoiceNo(String invoiceNo) {
    TotalDataModel totalDataModel = _totalDataList
        .firstWhere((totalData) => totalData.invoiceNo == invoiceNo);
    return totalDataModel;
  }

  List<DataModel> searchDataListWithInvoiceNo(String invoiceNo) {
    List<DataModel> dataList =
        _dataList.where((data) => data.invoiceNo == invoiceNo).toList();
    return dataList;
  }
}
