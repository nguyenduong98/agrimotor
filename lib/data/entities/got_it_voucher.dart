part of 'entities.dart';

class GotItVoucher extends Equatable {
  final String? code;
  final double? amount;

  const GotItVoucher({
    this.code,
    this.amount,
  });

  factory GotItVoucher.fromJson(Map<String, dynamic> map) {
    return GotItVoucher(
      code: map['code'],
      amount: DynamicParser.parseDouble(map['amount']),
    );
  }

  @override
  List<Object?> get props => [code, amount];
}
