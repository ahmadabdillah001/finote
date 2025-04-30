import 'package:finote/shared/shared.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  bool isIncome = false;
  TextEditingController amountController = TextEditingController();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text('Add Transaction', style: navTextStyle),
        backgroundColor: secondaryColor,
        leading: null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Row(
              children: [
                Switch(
                  value: isIncome,
                  onChanged: (value) {
                    setState(() {
                      isIncome = value;
                    });
                  },
                  activeColor: whiteColor,
                  activeTrackColor: greenColor,
                  inactiveThumbColor: whiteColor,
                  inactiveTrackColor: redColor,
                ),
                SpaceWidth(10),
                isIncome
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
            InputFormWidget(
              controller: amountController,
              label: 'Category',
              hint: 'category',
            ),
            SpaceHeight(15),
            InputFormWidget(
              controller: amountController,
              label: 'Date',
              hint: 'dd-mm-yyyy',
            ),
            SpaceHeight(15),
            InputFormWidget(
              controller: amountController,
              label: 'Description',
              hint: 'description',
            ),
            SpaceHeight(30),
            CustomButtonWidget(
              title: isIncome ? 'Add Income' : 'Add Expanse',
              width: double.infinity,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
