import 'package:finote/bloc/category_bloc.dart';
import 'package:finote/model/category_model.dart';
import 'package:finote/shared/shared.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditCategoryDialog extends StatefulWidget {
  final bool isEdit;
  final List<CategoryModel> categoryList;
  final int? index;
  final bool isIncome;
  final CategoryModel? data;
  const AddEditCategoryDialog({
    super.key,
    this.isEdit = false,
    required this.categoryList,
    required this.isIncome,
    this.data,
    this.index,
  });

  @override
  State<AddEditCategoryDialog> createState() => _AddEditCategoryDialogState();
}

class _AddEditCategoryDialogState extends State<AddEditCategoryDialog> {
  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      inputController.text = widget.data!.nama;
    }
  }

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
            padding: const EdgeInsets.only(bottom: 20),
            child: InputFormWidget(
              controller: inputController,
              label: '',
              hint: widget.isEdit ? 'Edit Category' : 'Add Category',
              color: primaryColor,
            ),
          ),
          SpaceHeight(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: redColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Cancel',
                    style: buttonTextStyle.copyWith(color: whiteColor),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              SpaceWidth(10),
              BlocConsumer<CategoryBloc, CategoryState>(
                listener: (context, state) {
                  if (state is CategoryCreateSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Category Added')),
                    );
                    Navigator.pop(context);
                  } else if (state is CategoryUpdateSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Category Updated')),
                    );
                    Navigator.pop(context);
                  } else if (state is CategoryFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          widget.isEdit
                              ? 'Failed Edit Category'
                              : 'Failed Create Category',
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return CircularProgressIndicator(color: primaryColor);
                  }
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (widget.categoryList.any(
                        (e) => e.nama == inputController.text,
                      )) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Category already exist'),
                          ),
                        );
                        Navigator.pop(context);
                        return;
                      }
                      if (inputController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Input must not be empty'),
                          ),
                        );
                        Navigator.pop(context);
                        return;
                      }
                      if (widget.isEdit == false) {
                        final createData = CategoryModel(
                          nama: inputController.text,
                          jenis: widget.isIncome ? 'income' : 'expanse',
                        );
                        context.read<CategoryBloc>().add(
                          CreateCategories(createData),
                        );
                      } else {
                        final updateData = CategoryModel(
                          id: widget.data!.id,
                          nama: inputController.text,
                          jenis: widget.isIncome ? 'income' : 'expanse',
                        );
                        context.read<CategoryBloc>().add(
                          UpdateCategories(updateData),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        widget.isEdit ? 'Save' : 'Add',
                        style: buttonTextStyle.copyWith(color: primaryColor),
                      ),
                    ),
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
