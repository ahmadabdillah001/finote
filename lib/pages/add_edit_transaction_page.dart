import 'package:finote/bloc/transaction_bloc.dart';
import 'package:finote/model/category_model.dart';
import 'package:finote/model/transaction_model.dart';
import 'package:finote/shared/shared.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddEditTransactionPage extends StatefulWidget {
  final String navBarTitle;
  final bool isEdit;
  final List<CategoryModel> categoryList;
  final TransactionModel? transactionData;

  const AddEditTransactionPage({
    super.key,
    required this.navBarTitle,
    required this.categoryList,
    this.isEdit = false,
    this.transactionData,
  });

  @override
  State<AddEditTransactionPage> createState() => _AddEditTransactionPageState();
}

class _AddEditTransactionPageState extends State<AddEditTransactionPage> {
  bool isIncome = false;
  String? categoryController = '- select category -';
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // final data = categoryList;
  List categories = ['- select category -'];
  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      getLatesData();
    }
    updateCategories();
  }

  void getLatesData() async {
    final data = widget.transactionData!;
    final latesCategory =
        widget.categoryList.firstWhere((e) => e.id == data.categoryId).nama;

    nameController = TextEditingController(text: data.judul);
    isIncome = widget.transactionData!.jenis == 'income' ? true : false;
    categoryController = latesCategory;
    dateController = TextEditingController(text: data.tanggal);
    amountController = TextEditingController(text: data.jumlah.toString());
    descriptionController = TextEditingController(text: data.keterangan);
  }

  void updateCategories() {
    if (!widget.isEdit) {
      categoryController = '- select category -';
    }
    categories = ['- select category -'];
    categories.addAll(
      widget.categoryList
          .where((e) => e.jenis == (isIncome ? 'income' : 'expanse'))
          .map((e) => e.nama)
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
      body:
          widget.categoryList.isEmpty
              ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Category is empty,\nplease add category first',
                    style: subTitleListTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
              : Padding(
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
                        controller: nameController,
                        label: 'Title',
                        hint: 'add title',
                      ),
                      SpaceHeight(15),
                      InputFormWidget(
                        isAmount: true,
                        controller: amountController,
                        label: 'Amount',
                        hint: 'total amount',
                      ),
                      SpaceHeight(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Category',
                            style: labelFormTextStyle.copyWith(
                              color: whiteColor,
                            ),
                          ),
                          SpaceHeight(8),
                          DropdownButtonFormField<String>(
                            dropdownColor: primaryColor,
                            value: categoryController,
                            decoration: InputDecoration(
                              hintStyle: hintFormTextStyle,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: whiteColor,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: whiteColor,
                                  width: 2,
                                ),
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
                        ],
                      ),
                      SpaceHeight(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date',
                            style: labelFormTextStyle.copyWith(
                              color: whiteColor,
                            ),
                          ),
                          SpaceHeight(8),
                          TextField(
                            readOnly: true,
                            style: labelFormTextStyle.copyWith(
                              color: whiteColor,
                            ),
                            cursorColor: whiteColor,
                            controller: dateController,
                            decoration: InputDecoration(
                              hintStyle: hintFormTextStyle,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: whiteColor,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: whiteColor,
                                  width: 2,
                                ),
                              ),
                              hintText: 'yyyy-mm-dd',
                            ),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime.now(),
                                barrierColor: primaryColor,
                              );

                              if (pickedDate != null) {
                                final dateFormated = DateFormat(
                                  'yyyy-MM-dd',
                                ).format(pickedDate);
                                dateController.text = dateFormated;
                              }
                            },
                          ),
                        ],
                      ),
                      SpaceHeight(15),
                      InputFormWidget(
                        controller: descriptionController,
                        label: 'Description',
                        hint: 'add description',
                      ),
                      SpaceHeight(30),
                      BlocConsumer<TransactionBloc, TransactionState>(
                        listener: (context, state) {
                          if (state is TransactionCreateSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Transaction Added'),
                              ),
                            );
                            Navigator.pop(context);
                          } else if (state is TransactionUpdateSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Transaction Updated'),
                              ),
                            );
                            Navigator.pop(context);
                          } else if (state is TransactionFailed) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  widget.isEdit
                                      ? 'Failed Update Transaction'
                                      : ' Add Transaction',
                                ),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is TransactionLoading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: secondaryColor,
                              ),
                            );
                          }
                          return CustomButtonWidget(
                            title:
                                widget.isEdit
                                    ? 'Save Change'
                                    : isIncome
                                    ? 'Add Income'
                                    : 'Add Expanse',
                            width: double.infinity,
                            onPressed: () {
                              if (nameController.text.isEmpty ||
                                  amountController.text.isEmpty ||
                                  categoryController == '- select category -' ||
                                  dateController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please fill all field'),
                                  ),
                                );
                                return;
                              }

                              if (widget.isEdit) {
                                final data = TransactionModel(
                                  id: widget.transactionData!.id,
                                  categoryId:
                                      widget.categoryList
                                          .firstWhere(
                                            (e) => e.nama == categoryController,
                                          )
                                          .id!,
                                  judul: nameController.text,
                                  jumlah: int.parse(amountController.text),
                                  tanggal: dateController.text,
                                  jenis: isIncome ? 'income' : 'expanse',
                                  keterangan: descriptionController.text,
                                );
                                context.read<TransactionBloc>().add(
                                  UpdateTransaction(data),
                                );
                              } else if (!widget.isEdit) {
                                final data = TransactionModel(
                                  categoryId:
                                      widget.categoryList
                                          .firstWhere(
                                            (e) => e.nama == categoryController,
                                          )
                                          .id!,
                                  judul: nameController.text,
                                  jumlah: int.parse(amountController.text),
                                  tanggal: dateController.text,
                                  jenis: isIncome ? 'income' : 'expanse',
                                  keterangan: descriptionController.text,
                                );
                                context.read<TransactionBloc>().add(
                                  CreateTransaction(data),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
