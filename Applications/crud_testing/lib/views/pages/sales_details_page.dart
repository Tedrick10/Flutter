// Flutter: Existing Libraries
import 'package:crud_testing/models/data_model.dart';
import 'package:flutter/material.dart';

// Flutter: External Libriares
import 'package:provider/provider.dart';

// Providers
import '../../controllers/providers/sales_provider.dart';

// Models
import '../../models/details_model.dart';
import '../../models/total_data_model.dart';

// Widgets
import '../widgets/sales_details_table_widget.dart';

// SalesDetailsPage: StatelessWidget Class
class SalesDetailsPage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Sales Details";
  static const String routeName = "/sales-details";

  // Constructor
  SalesDetailsPage({
    Key? key,
  }) : super(key: key);

  // Final: Class Properties
  final GlobalKey<FormState> forShowOnlyFormKey = GlobalKey<FormState>();
  final TextEditingController forShowOnlyDateController =
      TextEditingController();
  final TextEditingController forShowOnlyInvoiceNoController =
      TextEditingController();
  final TextEditingController forShowOnlyQtyController =
      TextEditingController();
  final TextEditingController forShowOnlyAmountController =
      TextEditingController();
  final List<String> tableHeadersList = [
    "Sr",
    "Stock Code",
    "Description",
    "QTY",
    "Price",
    "Amount",
  ];

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
    final DetailsModel detailsModel =
        ModalRoute.of(context)!.settings.arguments as DetailsModel;
    final String title = detailsModel.pageTitle;
    final String invoiceNo = detailsModel.invoiceNo;
    final SalesProvider salesProvider = Provider.of<SalesProvider>(context);
    final TotalDataModel totalDataModel =
        salesProvider.searchTotalWithInvoiceNo(invoiceNo);
    final List<DataModel> dataList =
        salesProvider.searchDataListWithInvoiceNo(invoiceNo);

    // Actions
    forShowOnlyDateController.text = totalDataModel.date;
    forShowOnlyInvoiceNoController.text = totalDataModel.invoiceNo;
    forShowOnlyQtyController.text = totalDataModel.quantity;
    forShowOnlyAmountController.text = totalDataModel.amount;

    // Returning Widgets
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 500.0,
                  height: 200.0,
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: forShowOnlyFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          readOnly: true,
                          controller: forShowOnlyDateController,
                          decoration: const InputDecoration(
                            hintText: 'Enter Date',
                            labelText: 'Date',
                          ),
                          validator: _textValidation,
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          readOnly: true,
                          controller: forShowOnlyInvoiceNoController,
                          decoration: const InputDecoration(
                            hintText: 'Enter Invoice No',
                            labelText: 'Invoice No',
                          ),
                          validator: _textValidation,
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: SalesDetailsTableWidget(
                    tableHeadersList: tableHeadersList,
                    tableBodiesList: dataList,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
