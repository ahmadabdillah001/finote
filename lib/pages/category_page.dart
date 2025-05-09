import 'package:finote/model/category_model.dart';
import 'package:finote/shared/shared.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isIncome = true;
  @override
  Widget build(BuildContext context) {
    List category = categoryList.where((e) => e.isIncome == isIncome).toList();
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        title: Text('Categories', style: navTextStyle),
        backgroundColor: secondaryColor,
        leading: null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
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
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder:
                            (context) =>
                                AddEditCategoryDialog(isIncome: isIncome),
                      );
                    },
                    child: Icon(Icons.add_rounded, size: 30, color: whiteColor),
                  ),
                ),
              ],
            ),
            SpaceHeight(15),
            Expanded(
              child: ListView.separated(
                itemCount: category.length,
                separatorBuilder: (context, index) => SpaceHeight(10),
                itemBuilder: (context, index) {
                  final data = category[index];
                  return TransactionCardWidget(
                    isTransaction: false,
                    isIncome: isIncome,
                    description: data.name,
                    onDelete: () async {
                      final result = await showDialog(
                        context: context,
                        builder: (context) => DeleteDialog(title: 'Category'),
                      );
                      result
                          ? setState(() {
                            category.removeAt(index);
                          })
                          : null;
                    },
                    onEdit: () async {
                      bool result = await showDialog(
                        context: context,
                        builder:
                            (context) => AddEditCategoryDialog(
                              isEdit: true,
                              index: index,
                              isIncome: data.isIncome,
                              data: category,
                            ),
                      );
                      result
                          ? setState(() {
                            category =
                                categoryList
                                    .where((e) => e.isIncome == isIncome)
                                    .toList();
                          })
                          : null;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
