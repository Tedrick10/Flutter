// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:provider/provider.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

// Providers
import '../../controllers/providers/purchase_provider.dart';

// Models
import '../../models/data_model.dart';

// Widgets
import './table_details_data_row_widget.dart';
import './table_headers_row_widget.dart';
import './table_cell_widget.dart';

// PurchaseDetailsTableWidget: StatelessWidget Class
class PurchaseDetailsTableWidget extends StatelessWidget {
  // Final: Class Properties
  final List<String> tableHeadersList;
  final List<DataModel> tableBodiesList;

  // Constructor
  const PurchaseDetailsTableWidget({
    required this.tableHeadersList,
    required this.tableBodiesList,
    Key? key,
  }) : super(key: key);

  // Final: Class Properties
  final Color textColor = Colors.white;
  final Color backgroundColor = Colors.grey;

  // Validataion: Class Methods
  String? _textValidation(String? value) {
    if (value!.trim().isEmpty) {
      return "Value should not be empty!";
    }
    return null;
  }

  String? _numberValidation(String? value) {
    if (value!.trim().isEmpty) {
      return "Value should not be empty!";
    }
    if (int.tryParse(value) == null) {
      return "Value must be a number!";
    }
    return null;
  }

  String getAllTotalQuantity() {
    int totalQuantity = 0;
    for (var data in tableBodiesList) {
      totalQuantity += int.parse(data.quantity);
    }

    return totalQuantity.toString();
  }

  String getAllTotalPrice() {
    int totalPrice = 0;
    for (var data in tableBodiesList) {
      totalPrice += int.parse(data.price);
    }

    return totalPrice.toString();
  }

  String getAllTotalAmount() {
    int totalAmount = 0;
    for (var data in tableBodiesList) {
      totalAmount += int.parse(data.amount);
    }

    return totalAmount.toString();
  }

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Final: Method Properties
    final PurchaseProvider purchaseProvider =
        Provider.of<PurchaseProvider>(context);

    final GlobalKey<FormState> editFormKey = GlobalKey<FormState>();
    final GlobalKey<FormState> addFormKey = GlobalKey<FormState>();
    final GlobalKey<FormState> deleteFormKey = GlobalKey<FormState>();

    final TextEditingController stockCodeController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController quantityController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController amountController = TextEditingController();

    // Returning Widgets
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20.0),
      child: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TableHeadersRowWidget(
                tableHeadersList: tableHeadersList,
              ),
              Container(
                width: 600.0,
                height: 300.0,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < tableBodiesList.length; i++) ...[
                        InkWell(
                          onLongPress: () {
                            DataModel data = tableBodiesList[i];
                            stockCodeController.text = data.stockCode;
                            descriptionController.text = data.description;
                            quantityController.text = data.quantity;
                            priceController.text = data.price;
                            amountController.text = data.amount;

                            SmartDialog.show(
                              alignment: Alignment.center,
                              builder: (_) {
                                return Container(
                                  width: 500.0,
                                  height: 550.0,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(20.0),
                                  margin: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Form(
                                    key: deleteFormKey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Delete Data",
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 20.0),
                                        TextFormField(
                                          readOnly: true,
                                          controller: stockCodeController,
                                          decoration: const InputDecoration(
                                            hintText: 'Enter Stock Code',
                                            labelText: 'Stock Code',
                                          ),
                                          validator: _numberValidation,
                                        ),
                                        const SizedBox(height: 10.0),
                                        TextFormField(
                                          readOnly: true,
                                          controller: descriptionController,
                                          decoration: const InputDecoration(
                                            hintText: 'Enter Description',
                                            labelText: 'Description',
                                          ),
                                          validator: _textValidation,
                                        ),
                                        const SizedBox(height: 10.0),
                                        TextFormField(
                                          readOnly: true,
                                          controller: quantityController,
                                          decoration: const InputDecoration(
                                            hintText: 'Enter Quantity',
                                            labelText: 'Quantity',
                                          ),
                                          validator: _numberValidation,
                                        ),
                                        const SizedBox(height: 10.0),
                                        TextFormField(
                                          readOnly: true,
                                          controller: priceController,
                                          decoration: const InputDecoration(
                                            hintText: 'Enter Price',
                                            labelText: 'Price',
                                          ),
                                          validator: _numberValidation,
                                        ),
                                        const SizedBox(height: 10.0),
                                        TextFormField(
                                          readOnly: true,
                                          controller: amountController,
                                          decoration: const InputDecoration(
                                            hintText: 'Enter Amount',
                                            labelText: 'Amount',
                                          ),
                                          validator: _numberValidation,
                                        ),
                                        const SizedBox(height: 20.0),
                                        SizedBox(
                                          width: double.infinity,
                                          height: 50.0,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red,
                                            ),
                                            onPressed: () {
                                              if (deleteFormKey.currentState!
                                                  .validate()) {
                                                purchaseProvider
                                                    .deleteDetailsWithStockCode(
                                                  stockCodeController.text,
                                                );
                                                SmartDialog.dismiss();
                                              }
                                            },
                                            child: const Text("Delete"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          onDoubleTap: () {
                            DataModel data = tableBodiesList[i];
                            stockCodeController.text = data.stockCode;
                            descriptionController.text = data.description;
                            quantityController.text = data.quantity;
                            priceController.text = data.price;
                            amountController.text = data.amount;

                            SmartDialog.show(
                              alignment: Alignment.center,
                              builder: (_) {
                                return Container(
                                  width: 500.0,
                                  height: 500.0,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(20.0),
                                  margin: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Form(
                                    key: editFormKey,
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Edit Data",
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 20.0),
                                        TextFormField(
                                          controller: stockCodeController,
                                          decoration: const InputDecoration(
                                            hintText: 'Enter Stock Code',
                                            labelText: 'Stock Code',
                                          ),
                                          validator: _numberValidation,
                                        ),
                                        const SizedBox(height: 10.0),
                                        TextFormField(
                                          controller: descriptionController,
                                          decoration: const InputDecoration(
                                            hintText: 'Enter Description',
                                            labelText: 'Description',
                                          ),
                                          validator: _textValidation,
                                        ),
                                        const SizedBox(height: 10.0),
                                        TextFormField(
                                          controller: quantityController,
                                          decoration: const InputDecoration(
                                            hintText: 'Enter Quantity',
                                            labelText: 'Quantity',
                                          ),
                                          validator: _numberValidation,
                                        ),
                                        const SizedBox(height: 10.0),
                                        TextFormField(
                                          controller: priceController,
                                          decoration: const InputDecoration(
                                            hintText: 'Enter Price',
                                            labelText: 'Price',
                                          ),
                                          validator: _numberValidation,
                                        ),
                                        const SizedBox(height: 20.0),
                                        SizedBox(
                                          width: double.infinity,
                                          height: 50.0,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.lightBlue,
                                            ),
                                            onPressed: () {
                                              if (editFormKey.currentState!
                                                  .validate()) {
                                                DataModel dataModel = DataModel(
                                                  date: tableBodiesList[i].date,
                                                  invoiceNo: tableBodiesList[i]
                                                      .invoiceNo,
                                                  stockCode:
                                                      stockCodeController.text,
                                                  description:
                                                      descriptionController
                                                          .text,
                                                  quantity:
                                                      quantityController.text,
                                                  price: priceController.text,
                                                  amount: (int.parse(
                                                              quantityController
                                                                  .text) *
                                                          int.parse(
                                                              priceController
                                                                  .text))
                                                      .toString(),
                                                );
                                                purchaseProvider
                                                    .editDetailsWithStockCode(
                                                  tableBodiesList[i].stockCode,
                                                  dataModel,
                                                );
                                                SmartDialog.dismiss();
                                              }
                                            },
                                            child: const Text("Edit"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: TableDetailsDataRowWidget(
                            serialNo: i + 1,
                            data: tableBodiesList[i],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Container(
                width: 600.0,
                height: 60.0,
                color: Colors.grey,
                child: Row(
                  children: [
                    SizedBox(
                      width: 300.0,
                      child: Row(
                        children: [
                          const SizedBox(width: 50.0),
                          IconButton(
                            onPressed: () {
                              stockCodeController.text = "";
                              descriptionController.text = "";
                              quantityController.text = "";
                              priceController.text = "";
                              amountController.text = "";

                              SmartDialog.show(
                                alignment: Alignment.center,
                                builder: (_) {
                                  return Container(
                                    width: 500.0,
                                    height: 500.0,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(20.0),
                                    margin: const EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: Form(
                                      key: addFormKey,
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Add Data",
                                            style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 20.0),
                                          TextFormField(
                                            controller: stockCodeController,
                                            decoration: const InputDecoration(
                                              hintText: 'Enter Stock Code',
                                              labelText: 'Stock Code',
                                            ),
                                            validator: _numberValidation,
                                          ),
                                          const SizedBox(height: 10.0),
                                          TextFormField(
                                            controller: descriptionController,
                                            decoration: const InputDecoration(
                                              hintText: 'Enter Description',
                                              labelText: 'Description',
                                            ),
                                            validator: _textValidation,
                                          ),
                                          const SizedBox(height: 10.0),
                                          TextFormField(
                                            controller: quantityController,
                                            decoration: const InputDecoration(
                                              hintText: 'Enter Quantity',
                                              labelText: 'Quantity',
                                            ),
                                            validator: _numberValidation,
                                          ),
                                          const SizedBox(height: 10.0),
                                          TextFormField(
                                            controller: priceController,
                                            decoration: const InputDecoration(
                                              hintText: 'Enter Price',
                                              labelText: 'Price',
                                            ),
                                            validator: _numberValidation,
                                          ),
                                          const SizedBox(height: 20.0),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 50.0,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.green,
                                              ),
                                              onPressed: () {
                                                if (addFormKey.currentState!
                                                    .validate()) {
                                                  DataModel dataModel =
                                                      DataModel(
                                                    date:
                                                        tableBodiesList[0].date,
                                                    invoiceNo:
                                                        tableBodiesList[0]
                                                            .invoiceNo,
                                                    stockCode:
                                                        stockCodeController
                                                            .text,
                                                    description:
                                                        descriptionController
                                                            .text,
                                                    quantity:
                                                        quantityController.text,
                                                    price: priceController.text,
                                                    amount: (int.parse(
                                                                quantityController
                                                                    .text) *
                                                            int.parse(
                                                                priceController
                                                                    .text))
                                                        .toString(),
                                                  );
                                                  purchaseProvider
                                                      .addDetailsWithStockCode(
                                                    dataModel,
                                                  );
                                                  SmartDialog.dismiss();
                                                }
                                              },
                                              child: const Text("Add"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.add),
                          ),
                          const SizedBox(width: 10.0),
                          IconButton(
                            onPressed: () {
                              SmartDialog.showToast(
                                "Double tap the specific data row to edit.",
                              );
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          const SizedBox(width: 10.0),
                          IconButton(
                            onPressed: () {
                              SmartDialog.showToast(
                                "Long press the specific data row to delete.",
                              );
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 300.0,
                      child: Row(
                        children: [
                          TableCellWidget(
                            text: getAllTotalQuantity(),
                            textColor: textColor,
                            backgroundColor: backgroundColor,
                            cellWidth: 100.0,
                          ),
                          TableCellWidget(
                            text: getAllTotalPrice(),
                            textColor: textColor,
                            backgroundColor: backgroundColor,
                            cellWidth: 100.0,
                          ),
                          TableCellWidget(
                            text: getAllTotalAmount(),
                            textColor: textColor,
                            backgroundColor: backgroundColor,
                            cellWidth: 100.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
