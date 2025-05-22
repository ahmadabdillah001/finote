import 'package:finote/bloc/category_bloc.dart';
import 'package:finote/bloc/transaction_bloc.dart';
import 'package:finote/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteDialog extends StatelessWidget {
  final int id;
  final bool isTransaction;
  const DeleteDialog({
    super.key,
    required this.id,
    this.isTransaction = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: secondaryColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              isTransaction
                  ? 'Are you sure you want to delete this Transaction?'
                  : 'If you delete this category, all transactions in this category will be deleted.',
              style: titleListTextStyle.copyWith(color: primaryColor),
              textAlign: TextAlign.center,
            ),
          ),
          SpaceHeight(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Cancel',
                    style: buttonTextStyle.copyWith(color: primaryColor),
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              isTransaction
                  ? BlocConsumer<TransactionBloc, TransactionState>(
                    listener: (context, state) {
                      if (state is TransactionDeleteSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Transaction deleted successfully'),
                          ),
                        );
                        Navigator.pop(context);
                      } else if (state is TransactionFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Failed to delete transaction'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      if (state is TransactionLoading) {
                        return Center(
                          child: CircularProgressIndicator(color: primaryColor),
                        );
                      }
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: redColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Delete',
                            style: buttonTextStyle.copyWith(color: whiteColor),
                          ),
                        ),
                        onPressed: () {
                          context.read<TransactionBloc>().add(
                            DeleteTransaction(id),
                          );
                        },
                      );
                    },
                  )
                  : BlocConsumer<CategoryBloc, CategoryState>(
                    listener: (context, state) {
                      if (state is CategoryDeleteSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Category deleted')),
                        );
                        Navigator.pop(context);
                      } else if (state is CategoryFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Failed to delete Category'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      if (state is CategoryLoading) {
                        return Center(
                          child: CircularProgressIndicator(color: primaryColor),
                        );
                      }
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: redColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Delete',
                            style: buttonTextStyle.copyWith(color: whiteColor),
                          ),
                        ),
                        onPressed: () {
                          context.read<CategoryBloc>().add(
                            DeleteCategories(id),
                          );
                        },
                      );
                    },
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
