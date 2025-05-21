import 'package:finote/bloc/category_bloc.dart';
import 'package:finote/shared/shared.dart';
import 'package:finote/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isIncome = true;

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(GetCategories());
  }

  @override
  Widget build(BuildContext context) {
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
          final getData =
              state.responseBody
                  .where((e) => e.jenis == (isIncome ? 'income' : 'expanse'))
                  .toList();
          final categories = getData;

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
                                  (context) => AddEditCategoryDialog(
                                    categoryList: getData,
                                    isIncome: isIncome,
                                  ),
                            );
                          },
                          child: Icon(
                            Icons.add_rounded,
                            size: 30,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SpaceHeight(15),
                  Expanded(
                    child: ListView.separated(
                      itemCount: categories.length,
                      separatorBuilder: (context, index) => SpaceHeight(10),
                      itemBuilder: (context, index) {
                        final data = categories[index];
                        return TransactionCardWidget(
                          isTransaction: false,
                          isIncome: isIncome,
                          description: data.nama,
                          onDelete: () async {
                            final result = await showDialog(
                              context: context,
                              builder:
                                  (context) => DeleteDialog(title: 'Category'),
                            );
                            result
                                ? setState(() {
                                  categories.removeAt(index);
                                })
                                : null;
                          },
                          onEdit: () {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => AddEditCategoryDialog(
                                    isEdit: true,
                                    categoryList: getData,
                                    index: index,
                                    isIncome:
                                        data.jenis == 'income' ? true : false,
                                    data: data,
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
          );
        }
        if (state is CategoryFailed) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
