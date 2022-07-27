// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:provider/provider.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

// Providers
import '../../controllers/providers/purchase_provider.dart';

// Models
import '../../models/total_data_model.dart';
import '../../models/details_model.dart';

// Pages
import '../pages/purchase_details_page.dart';

// Widgets
import 'table_data_row_widget.dart';
import './table_headers_row_widget.dart';
import './table_cell_widget.dart';

// PurchaseTableWidget: StatelessWidget Class
class PurchaseTableWidget extends StatelessWidget {
  // Final: Class Properties
  final List<String> tableHeadersList;
  final List<TotalDataModel> tableBodiesList;
  final bool isLoading;

  // Constructor
  const PurchaseTableWidget({
    required this.tableHeadersList,
    required this.tableBodiesList,
    required this.isLoading,
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

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Final: Method Properties
    final PurchaseProvider purchaseProvider =
        Provider.of<PurchaseProvider>(context);
    final String totalQuantity = purchaseProvider.getAllTotalQuantity;
    final String totalAmount = purchaseProvider.getAllTotalAmount;

    final GlobalKey<FormState> editFormKey = GlobalKey<FormState>();
    final GlobalKey<FormState> addFormKey = GlobalKey<FormState>();
    final GlobalKey<FormState> deleteFormKey = GlobalKey<FormState>();
    final TextEditingController editTextFieldController =
        TextEditingController();
    final TextEditingController addTextFieldController =
        TextEditingController();
    final TextEditingController deleteTextFieldController =
        TextEditingController();

    // Returning Widgets
    return Container(
      alignment: Alignment.center,
      color: Colors.black12,
      padding: const EdgeInsets.all(20.0),
      child: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TableHeadersRowWidget(
                tableHeadersList: tableHeadersList,
                cellWidth: 200.0,
              ),
              (isLoading)
                  ? Container(
                      width: 800.0,
                      height: 300.0,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.lightBlue,
                        ),
                      ),
                    )
                  : Container(
                      width: 800.0,
                      height: 300.0,
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (TotalDataModel dataModel
                                in tableBodiesList) ...[
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    PurchaseDetailsPage.routeName,
                                    arguments: DetailsModel(
                                      pageTitle: "Purchase",
                                      invoiceNo: dataModel.invoiceNo,
                                    ),
                                  );
                                },
                                onLongPress: () {
                                  SmartDialog.show(
                                    alignment: Alignment.center,
                                    builder: (_) {
                                      deleteTextFieldController.text =
                                          dataModel.invoiceNo;

                                      return Container(
                                        width: 300.0,
                                        height: 200.0,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(20.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        child: Form(
                                          key: deleteFormKey,
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                readOnly: true,
                                                controller:
                                                    deleteTextFieldController,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'Enter Invoice No',
                                                  labelText: 'Invoice No',
                                                ),
                                                validator: _textValidation,
                                              ),
                                              const SizedBox(height: 20.0),
                                              SizedBox(
                                                width: double.infinity,
                                                height: 50.0,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    if (deleteFormKey
                                                        .currentState!
                                                        .validate()) {
                                                      purchaseProvider
                                                          .deleteInvoiceNo(
                                                        deleteTextFieldController
                                                            .text,
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
                                  SmartDialog.show(
                                    alignment: Alignment.center,
                                    builder: (_) {
                                      editTextFieldController.text =
                                          dataModel.invoiceNo;

                                      return Container(
                                        width: 300.0,
                                        height: 200.0,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(20.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        child: Form(
                                          key: editFormKey,
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                controller:
                                                    editTextFieldController,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'Enter Invoice No',
                                                  labelText: 'Invoice No',
                                                ),
                                                validator: _textValidation,
                                              ),
                                              const SizedBox(height: 20.0),
                                              SizedBox(
                                                width: double.infinity,
                                                height: 50.0,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.lightBlue,
                                                  ),
                                                  onPressed: () {
                                                    if (editFormKey
                                                        .currentState!
                                                        .validate()) {
                                                      purchaseProvider
                                                          .editInvoiceNo(
                                                        dataModel.invoiceNo,
                                                        editTextFieldController
                                                            .text,
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
                                child: TableDataRowWidget(data: dataModel),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
              Container(
                width: 800.0,
                height: 60.0,
                color: Colors.grey,
                child: Row(
                  children: [
                    SizedBox(
                      width: 400.0,
                      child: Row(
                        children: [
                          const SizedBox(width: 50.0),
                          IconButton(
                            onPressed: () {
                              SmartDialog.show(
                                alignment: Alignment.center,
                                builder: (_) {
                                  return Container(
                                    width: 300.0,
                                    height: 200.0,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: Form(
                                      key: addFormKey,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: addTextFieldController,
                                            decoration: const InputDecoration(
                                              hintText: 'Enter Invoice No',
                                              labelText: 'Invoice No',
                                            ),
                                            validator: _textValidation,
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
                                                  purchaseProvider.addInvoiceNo(
                                                    addTextFieldController.text,
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
                      width: 400.0,
                      child: Row(
                        children: [
                          TableCellWidget(
                            text: totalQuantity,
                            textColor: textColor,
                            backgroundColor: backgroundColor,
                            cellWidth: 200.0,
                          ),
                          TableCellWidget(
                            text: totalAmount,
                            textColor: textColor,
                            backgroundColor: backgroundColor,
                            cellWidth: 200.0,
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
