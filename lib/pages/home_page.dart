import 'package:finote/model/transaction_model.dart';
import 'package:finote/shared/shared.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [darkenSecondaryColor, secondaryColor],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SpaceHeight(100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.chevron_left_rounded, size: 30),
                    ),
                    Column(
                      children: [
                        Text('November', style: navTextStyle),
                        Text(
                          '2025',
                          style: titleListTextStyle.copyWith(
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.chevron_right_rounded, size: 30),
                    ),
                  ],
                ),
                SpaceHeight(35),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SpaceWidth(5),
                      scrollDirection: Axis.horizontal,
                      itemCount: 12,
                      itemBuilder:
                          (context, index) =>
                              DateWidget(day: 'Mon', date: 01, isActive: false),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                          onDelete: () {},
                          onEdit: () {},
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
            Navigator.pushNamed(context, '/add-transaction');
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
