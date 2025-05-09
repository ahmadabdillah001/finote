import 'package:finote/model/transaction_model.dart';
import 'package:finote/pages/pages.dart';
import 'package:finote/shared/shared.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';

import '../widgets/calendar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: CalendarAppBar(
        backButton: false,
        accent: secondaryColor,
        white: primaryColor,
        black: secondaryColor,
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(Duration(days: 60)),
        lastDate: DateTime.now(),
      ),
      body: Column(
        children: [
          Expanded(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: greenColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.keyboard_double_arrow_down_rounded,
                                  size: 30,
                                  color: whiteColor,
                                ),
                              ),
                              SpaceWidth(10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Income', style: subTitleListTextStyle),
                                  SpaceHeight(2),
                                  Text(
                                    50000000.currencyFormatRp,
                                    style: titleListTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: redColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.keyboard_double_arrow_up_rounded,
                                  size: 30,
                                  color: whiteColor,
                                ),
                              ),
                              SpaceWidth(10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Expanse', style: subTitleListTextStyle),
                                  SpaceHeight(2),
                                  Text(
                                    30000000.currencyFormatRp,
                                    style: titleListTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
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
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.only(top: 0),
                      itemCount: transactionList.length,
                      separatorBuilder: (context, index) => SpaceHeight(10),
                      itemBuilder: (context, index) {
                        final data = transactionList[index];
                        return TransactionCardWidget(
                          isIncome: data.isIncome,
                          amount: data.amount,
                          description: data.title,
                          onDelete: () {
                            showDialog(
                              context: context,
                              builder:
                                  (context) =>
                                      DeleteDialog(title: 'Transaction'),
                            );
                          },
                          onEdit: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => AddEditTransactionPage(
                                      navBarTitle: 'Edit Transaction',
                                      isEdit: true,
                                      data: transactionList,
                                      index: index,
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
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: FloatingActionButton(
          backgroundColor: secondaryColor,
          child: Icon(Icons.add, color: primaryColor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        AddEditTransactionPage(navBarTitle: 'Add Transaction'),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
