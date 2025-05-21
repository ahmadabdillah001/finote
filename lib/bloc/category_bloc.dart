import 'package:finote/model/category_model.dart';
import 'package:finote/repositories/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final repository = CategoryRepository();
  CategoryBloc() : super(CategoryInitial()) {
    on<CreateCategories>((event, emit) async {
      emit(CategoryLoading());
      final result = await repository.createCategory(event.requestBody);
      result.fold(
        (l) => emit(CategoryFailed(message: l)),
        (r) => emit(CategoryCreateSuccess(responseBody: r)),
      );
      add(GetCategories());
    });

    on<GetCategories>((event, emit) async {
      emit(CategoryLoading());
      final result = await repository.getCategories();
      result.fold(
        (l) => emit(CategoryFailed(message: l)),
        (r) => emit(CategoryGetSuccess(responseBody: r)),
      );
    });

    on<GetDetailCategory>((event, emit) async {
      emit(CategoryLoading());
      final result = await repository.getDetailCategory(event.id);
      result.fold(
        (l) => emit(CategoryFailed(message: l)),
        (r) => emit(CategoryGetDetailSuccess(responseBody: r)),
      );
    });

    on<UpdateCategories>((event, emit) async {
      emit(CategoryLoading());
      final result = await repository.updateCategory(event.requestBody);
      result.fold(
        (l) => emit(CategoryFailed(message: l)),
        (r) => emit(CategoryUpdateSuccess(responseBody: r)),
      );
      add(GetCategories());
    });

    on<DeleteCategories>((event, emit) async {
      emit(CategoryLoading());
      final result = await repository.deleteCategory(event.id);
      result.fold(
        (l) => emit(CategoryFailed(message: l)),
        (r) => emit(CategoryDeleteSuccess(responseBody: r)),
      );
      add(GetCategories());
    });
  }
}
