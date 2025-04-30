class CategoryModel {
  int? id;
  String name;
  bool isIncome;

  CategoryModel({
    this.id,
    required this.name,
    required this.isIncome,
  });
}

List categoryList = [
  CategoryModel(name: 'Gaji Tetap', isIncome: true), 
  CategoryModel(name: 'Gaji Freelance', isIncome: true), 
  CategoryModel(name: 'Bonus Tambahan', isIncome: true),
  CategoryModel(name: 'Pengeluaran', isIncome: false),
  CategoryModel(name: 'Sodaqoh', isIncome: false),
  CategoryModel(name: 'Donasi', isIncome: false),
  CategoryModel(name: 'Keperluan Keluarga', isIncome: false),
];