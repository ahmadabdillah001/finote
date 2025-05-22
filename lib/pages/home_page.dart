import 'package:finote/bloc/category_bloc.dart';
import 'package:finote/bloc/transaction_bloc.dart';
import 'package:finote/model/transaction_model.dart';
import 'package:finote/pages/pages.dart';
import 'package:finote/services/api_service.dart';
import 'package:finote/shared/shared.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TransactionBloc>().add(GetTransactions());
    context.read<CategoryBloc>().add(GetCategories());
    if (selectedDate == '') {
      selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    }
  }

  final apiService = ApiService();
  List<TransactionModel> transactionList = [];

  String selectedDate = '';

  void refreshDate(DateTime date) {
    setState(() {
      selectedDate = DateFormat('yyyy-MM-dd').format(date);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return Container(
            decoration: BoxDecoration(color: primaryColor),
            child: Center(
              child: CircularProgressIndicator(color: secondaryColor),
            ),
          );
        }
        if (state is TransactionGetSuccess) {
          final getThisMonth = DateFormat('yyyy-MM').format(DateTime.now());
          final transactionData = state.responseData;

          transactionList =
              transactionData
                  .where((e) => e.tanggal.substring(0, 10) == selectedDate)
                  .toList();

          final transactionThisMonthList =
              transactionData
                  .where((e) => e.tanggal.substring(0, 7) == getThisMonth)
                  .toList();

          // total income
          int totalIncome = transactionThisMonthList
              .where((t) => t.jenis == 'income') // filter income
              .fold(0, (sum, t) => sum + t.jumlah);

          // total expanse
          int totalExpanse = transactionThisMonthList
              .where((t) => t.jenis == 'expanse') // filter expanse
              .fold(0, (sum, t) => sum + t.jumlah);

          return BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return Container(
                  decoration: BoxDecoration(color: primaryColor),
                  child: Center(
                    child: CircularProgressIndicator(color: secondaryColor),
                  ),
                );
              }
              if (state is CategoryGetSuccess) {
                return Scaffold(
                  backgroundColor: primaryColor,
                  appBar: CalendarAppBar(
                    selectedDate: DateTime.parse(selectedDate),
                    backButton: false,
                    accent: secondaryColor,
                    white: primaryColor,
                    black: secondaryColor,
                    onDateChanged: (value) {
                      refreshDate(value);
                    },
                    firstDate: DateTime.now().subtract(Duration(days: 60)),
                    lastDate: DateTime.now(),
                  ),
                  body: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: lightenPrimaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                color: greenColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      10,
                                                    ),
                                              ),
                                              child: Icon(
                                                Icons
                                                    .keyboard_double_arrow_down_rounded,
                                                size: 30,
                                                color: whiteColor,
                                              ),
                                            ),
                                            SpaceWidth(10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Income',
                                                  style:
                                                      subTitleListTextStyle,
                                                ),
                                                SpaceHeight(2),
                                                Text(
                                                  totalIncome
                                                      .currencyFormatRp,
                                                  style: titleListTextStyle
                                                      .copyWith(
                                                        fontSize: 16,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                color: redColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      10,
                                                    ),
                                              ),
                                              child: Icon(
                                                Icons
                                                    .keyboard_double_arrow_up_rounded,
                                                size: 30,
                                                color: whiteColor,
                                              ),
                                            ),
                                            SpaceWidth(10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Expanse',
                                                  style:
                                                      subTitleListTextStyle,
                                                ),
                                                SpaceHeight(2),
                                                Text(
                                                  totalExpanse
                                                      .currencyFormatRp,
                                                  style: titleListTextStyle
                                                      .copyWith(
                                                        fontSize: 16,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SpaceHeight(20),
                          Text('Transactions', style: lableListTextStyle),
                          SpaceHeight(20),
                          transactionList.isEmpty
                              ? SizedBox(
                                width: double.infinity,
                                height: 100,
                                child: Center(
                                  child: Text(
                                    'Transaction is empty',
                                    style: subTitleListTextStyle,
                                  ),
                                ),
                              )
                              : Expanded(
                                child: ListView.separated(
                                  padding: EdgeInsets.only(top: 0),
                                  itemCount: transactionList.length,
                                  separatorBuilder:
                                      (context, index) => SpaceHeight(10),
                                  itemBuilder: (context, index) {
                                    final data = transactionList[index];
                                    return TransactionCardWidget(
                                      isIncome:
                                          data.jenis == 'income'
                                              ? true
                                              : false,
                                      amount: data.jumlah,
                                      description: data.judul,
                                      onDelete: () {
                                        showDialog(
                                          context: context,
                                          builder:
                                              (context) => DeleteDialog(
                                                id: data.id!,
                                                isTransaction: true,
                                              ),
                                        );
                                      },
                                      onEdit: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (
                                                  context,
                                                ) => AddEditTransactionPage(
                                                  categoryList:
                                                      state.responseBody,
                                                  navBarTitle:
                                                      'Edit Transaction',
                                                  isEdit: true,
                                                  transactionData: data,
                                                ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                        ],
                      ),
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    backgroundColor: secondaryColor,
                    child: Icon(Icons.add, color: primaryColor),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => AddEditTransactionPage(
                                categoryList: state.responseBody,
                                navBarTitle: 'Add Transaction',
                              ),
                        ),
                      );
                    },
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.endFloat,
                );
              }
              if (state is CategoryFailed) {
                return Container(
                  decoration: BoxDecoration(color: primaryColor),
                  child: Center(
                    child: Text(
                      'Failed to load data',
                      style: labelFormTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
              return Container();
            },
          );
        }
        if (state is TransactionFailed) {
          return Container(
            decoration: BoxDecoration(color: primaryColor),
            child: Center(
              child: Text(
                'Failed to load data',
                style: labelFormTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
