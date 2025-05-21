part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class CreateCategories extends CategoryEvent {
  final CategoryModel requestBody;
  CreateCategories(this.requestBody);
}

class GetCategories extends CategoryEvent {}

class GetDetailCategory extends CategoryEvent {
  final int id;
  GetDetailCategory(this.id);
}

class UpdateCategories extends CategoryEvent {
  final CategoryModel requestBody;
  UpdateCategories(this.requestBody);
}

class DeleteCategories extends CategoryEvent {
  final int id;
  DeleteCategories(this.id);
}
