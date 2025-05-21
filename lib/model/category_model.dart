class CategoryModel {
  int? id;
  int? userId;
  String nama;
  String jenis;
  String? createdAt;

  CategoryModel({
    this.id,
    this.userId,
    required this.nama,
    required this.jenis,
    this.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id'],
    userId: json['user_id'],
    nama: json['nama'],
    jenis: json['jenis'],
    createdAt: json['created_at'],
  );

  Map<String, dynamic> toJson() => {'nama': nama, 'jenis': jenis};
}

// === return data ===
// {
//     "status": "success",
//     "message": "create category successfully",
//     "data": {
//         "nama": "Bonus",
//         "jenis": "income",
//         "user_id": 2,
//         "updated_at": "2025-05-14T01:51:30.000000Z",
//         "created_at": "2025-05-14T01:51:30.000000Z",
//         "id": 10
//     }
// }
