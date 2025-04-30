import 'package:intl/intl.dart';

extension AmountExt on num {
  String get currencyFormatRp => NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  ).format(this);
}
