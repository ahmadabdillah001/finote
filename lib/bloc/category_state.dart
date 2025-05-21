part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryCreateSuccess extends CategoryState {
  final CategoryModel responseBody;
  CategoryCreateSuccess({required this.responseBody});
}

final class CategoryGetSuccess extends CategoryState {
  final List<CategoryModel> responseBody;
  CategoryGetSuccess({required this.responseBody});
}

final class CategoryGetDetailSuccess extends CategoryState {
  final CategoryModel responseBody;
  CategoryGetDetailSuccess({required this.responseBody});
}

final class CategoryUpdateSuccess extends CategoryState {
  final CategoryModel responseBody;
  CategoryUpdateSuccess({required this.responseBody});
}

final class CategoryDeleteSuccess extends CategoryState {
  final String responseBody;
  CategoryDeleteSuccess({required this.responseBody});
}

final class CategoryFailed extends CategoryState {
  final String message;
  CategoryFailed({required this.message});
}
