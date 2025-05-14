import 'package:finote/model/category_model_test.dart';
import 'package:finote/model/transaction_model.dart';
import 'package:finote/shared/shared.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';

class AddEditTransactionPage extends StatefulWidget {
  final String navBarTitle;
  final bool isEdit;
  final List<TransactionModel>? data;
  final int? index;

  const AddEditTransactionPage({
    super.key,
    required this.navBarTitle,
    this.isEdit = false,
    this.data,
    this.index,
  });

  @override
  State<AddEditTransactionPage> createState() => _AddEditTransactionPageState();
}

class _AddEditTransactionPageState extends State<AddEditTransactionPage> {
  bool isIncome = false;
  TextEditingController amountController = TextEditingController();
  String? categoryController = '- select category -';
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final data = categoryList;
  List categories = ['- select category -'];
  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      final finalData = widget.data![widget.index!];

      isIncome = finalData.isIncome;
      amountController = TextEditingController(
        text: finalData.amount.toString(),
      );
      categoryController = finalData.category;
    }
    updateCategories();
  }

  void updateCategories() {
    if (!widget.isEdit) {
      categoryController = '- select category -';
    }
    categories = ['- select category -'];
    categories.addAll(
      categoryList
          .where((e) => e.isIncome == isIncome)
          .map((e) => e.name)
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text(
          widget.isEdit
              ? isIncome
                  ? 'Edit Income'
                  : 'Edit Expanse'
              : widget.navBarTitle,
          style: navTextStyle,
        ),
        backgroundColor: secondaryColor,
        leading: null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  widget.isEdit
                      ? SizedBox()
                      : Switch(
                        value: isIncome,
                        onChanged: (value) async {
                          categoryController = null;
                          setState(() {
                            isIncome = value;
                            updateCategories();
                          });
                        },
                        activeColor: whiteColor,
                        activeTrackColor: greenColor,
                        inactiveThumbColor: whiteColor,
                        inactiveTrackColor: redColor,
                      ),
                  SpaceWidth(10),
                  widget.isEdit
                      ? SizedBox()
                      : isIncome
                      ? Text('Income', style: lableListTextStyle)
                      : Text('Expanse', style: lableListTextStyle),
                ],
              ),
              SpaceHeight(15),
              InputFormWidget(
                controller: amountController,
                label: 'Amount',
                hint: 'total amount',
              ),
              SpaceHeight(15),
              DropdownButtonFormField<String>(
                dropdownColor: primaryColor,
                value: categoryController,
                decoration: InputDecoration(
                  hintStyle: hintFormTextStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: whiteColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: whiteColor, width: 2),
                  ),
                  hintText: '- select category -',
                ),
                style: hintFormTextStyle,
                items:
                    categories.map((item) {
                      return DropdownMenuItem<String>(
                        value: item.toString(),
                        child: Text(
                          item.toString(),
                          style: labelFormTextStyle.copyWith(
                            color:
                                item == '- select category -'
                                    ? greyColor
                                    : whiteColor,
                          ),
                        ),
                      );
                    }).toList(),
                onChanged: (value) async {
                  setState(() {
                    categoryController = value;
                  });
                },
              ),
              SpaceHeight(15),
              InputFormWidget(
                controller: dateController,
                label: 'Date',
                hint: 'dd-mm-yyyy',
              ),
              SpaceHeight(15),
              InputFormWidget(
                controller: descriptionController,
                label: 'Description',
                hint: 'description',
              ),
              SpaceHeight(30),
              CustomButtonWidget(
                title:
                    widget.isEdit
                        ? 'Save Change'
                        : isIncome
                        ? 'Add Income'
                        : 'Add Expanse',
                width: double.infinity,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
