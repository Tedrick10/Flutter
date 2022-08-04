// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Models
import '../../models/barcode_model.dart';

// BarcodeProvider: Provider Class
class BarcodeProvider with ChangeNotifier {
  // Changable: Class Properties
  List<BarcodeModel> _barcodesList = [];

  // Getters
  List<BarcodeModel> get getBarcodesList => _barcodesList;

  // Actions: Class Methods
  BarcodeModel? searchBarCode(String data) {
    int index = _barcodesList.indexWhere((barcode) => barcode.data == data);

    if (index >= 0) {
      return _barcodesList[index];
    }

    return null;
  }

  bool addNewBarcode(BarcodeModel addedBarcode) {
    bool canAddNewData = false;
    int index = _barcodesList
        .indexWhere((barcode) => barcode.data == addedBarcode.data);

    if (index < 0) {
      _barcodesList.add(addedBarcode);
      canAddNewData = true;
    }

    notifyListeners();

    return canAddNewData;
  }

  bool updateBarcode(BarcodeModel updateBarcode) {
    bool canEditData = false;
    int index = _barcodesList
        .indexWhere((barcode) => barcode.data == updateBarcode.data);

    if (index >= 0) {
      _barcodesList[index] = updateBarcode;
      canEditData = true;
    }

    notifyListeners();

    return canEditData;
  }

  bool deleteBarcode(String data) {
    bool canDeleteData = false;
    int index = _barcodesList.indexWhere((barcode) => barcode.data == data);

    if (index >= 0) {
      _barcodesList.removeAt(index);
      canDeleteData = true;
    }

    notifyListeners();

    return canDeleteData;
  }
}
