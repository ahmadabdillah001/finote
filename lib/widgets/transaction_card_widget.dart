import 'package:finote/shared/shared.dart';
import 'package:flutter/material.dart';

class TransactionCardWidget extends StatelessWidget {
  final bool isTransaction;
  final int? amount;
  final String description;
  final bool isIncome;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const TransactionCardWidget({
    super.key,
    this.isTransaction = true,
    this.amount,
    required this.description,
    this.isIncome = true,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: lightenPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          isIncome
              ? Container(
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
              )
              : Container(
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
          isTransaction
          ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(amount!.currencyFormatRp, style: titleListTextStyle),
              SpaceHeight(3),
              Text(description, style: subTitleListTextStyle),
            ],
          )
          : Text(description, style: titleListTextStyle,),
          Spacer(),
          Row(
            children: [
              GestureDetector(
                onTap: onDelete,
                child: Icon(Icons.delete, size: 30, color: whiteColor),
              ),
              SpaceWidth(10),
              GestureDetector(
                onTap: onEdit,
                child: Icon(Icons.edit, size: 30, color: whiteColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
