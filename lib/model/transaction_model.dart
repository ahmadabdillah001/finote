class TransactionModel {
  int? id;
  String title;
  int amount;
  bool isIncome;

  TransactionModel({
    this.id,
    required this.title,
    required this.amount,
    required this.isIncome,
  });
}

List transactionList = [
  TransactionModel(title: 'Beli Motor', amount: 45000000, isIncome: false),
  TransactionModel(title: 'Beli Buku', amount: 300000, isIncome: false),
  TransactionModel(title: 'Gaji Freelance', amount: 65000000, isIncome: true),
  TransactionModel(
    title: 'Joki Tugas Kuliah',
    amount: 10000000,
    isIncome: true,
  ),
  TransactionModel(
    title: 'Beli Laptop',
    amount: 30000000,
    isIncome: false,
  ),
  TransactionModel(title: 'Bisnis FnB', amount: 200000000, isIncome: true),
  TransactionModel(
    title: 'Bangun Bisni Clothing',
    amount: 70000000,
    isIncome: false,
  ),
  TransactionModel(title: 'Beli Camera', amount: 15000000, isIncome: false),
];
