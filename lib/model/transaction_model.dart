class TransactionModel {
  int? id;
  int? userId;
  int categoryId;
  String judul;
  int jumlah;
  String tanggal;
  String jenis;
  String? keterangan;

  TransactionModel({
    this.id,
    this.userId,
    required this.categoryId,
    required this.judul,
    required this.jumlah,
    required this.tanggal,
    required this.jenis,
    this.keterangan,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    id: json['id'],
    userId: json['user_id'],
    categoryId: json['category_id'],
    judul: json['judul'],
    jumlah: json['jumlah'],
    tanggal: json['tanggal'],
    jenis: json['jenis'],
    keterangan: json['keterangan'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'category_id': categoryId,
    'judul': judul,
    'jumlah': jumlah,
    'tanggal': tanggal,
    'jenis': jenis,
    'keterangan': keterangan,
  };
}

// === response data ===
// {
//     "status": "success",
//     "message": "get all transaction successfully",
//     "data": [
//         {
//             "id": 1,
//             "user_id": 2,
//             "category_id": 2,
//             "judul": "Orderan Aplikasi",
//             "jumlah": 48000000,
//             "tanggal": "2025-07-02",
//             "jenis": "income",
//             "keterangan": "Gaji tetap",
//             "created_at": "2025-05-14T10:03:41.000000Z",
//             "updated_at": "2025-05-14T10:03:41.000000Z"
//         }
//     ]
// }