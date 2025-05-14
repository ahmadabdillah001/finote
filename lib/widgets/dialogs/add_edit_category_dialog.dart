import 'package:finote/model/category_model_test.dart';
import 'package:finote/shared/shared.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';

class AddEditCategoryDialog extends StatefulWidget {
  final bool isEdit;
  final int? index;
  final bool isIncome;
  final List<dynamic>? data;
  const AddEditCategoryDialog({
    super.key,
    this.isEdit = false,
    required this.isIncome,
    this.data,
    this.index,
  });

  @override
  State<AddEditCategoryDialog> createState() => _AddEditCategoryDialogState();
}

class _AddEditCategoryDialogState extends State<AddEditCategoryDialog> {
  TextEditingController inputController = TextEditingController();
  void editData() {
    setState(() {
      widget.data![widget.index!] = CategoryModel(
        name: inputController.text,
        isIncome: widget.isIncome,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      inputController.text = widget.data![widget.index!].name;
    }
  }

  @override
  Widget build(BuildContext context) {
    final category = categoryList;
    return AlertDialog(
      backgroundColor: secondaryColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: InputFormWidget(
              controller: inputController,
              label: '',
              hint: widget.isEdit ? 'Edit Category' : 'Add Category',
              color: primaryColor,
            ),
            //   TextFormField(
            //   controller: controller,
            //   style: inputControllerStyle,
            //   decoration: InputDecoration(
            //     hintText: "Remark",
            //     filled: true,
            //     fillColor: Colors.white,
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(12),
            //       borderSide: BorderSide.none,
            //     ),
            //     contentPadding: const EdgeInsets.symmetric(
            //       horizontal: 20,
            //       vertical: 14,
            //     ),
            //   ),
            // ),
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
                onPressed: () => Navigator.pop(context, false),
              ),
              SpaceWidth(10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: redColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  inputController.text.isEmpty
                      ? ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Input must not be empty'),
                        ),
                      )
                      : widget.isEdit == false
                      ? category.add(
                        CategoryModel(
                          name: inputController.text,
                          isIncome: widget.isIncome,
                        ),
                      )
                      : editData();
                  Navigator.pop(context, true);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    widget.isEdit ? 'Save' : 'Add',
                    style: buttonTextStyle.copyWith(color: whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
