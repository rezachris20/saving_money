part of 'models.dart';

class MySavings extends Equatable {
  final int transaksi;
  final int target;

  MySavings({
    this.transaksi,
    this.target,
  });

  factory MySavings.fromJson(Map<String, dynamic> data) => MySavings(
        transaksi: data['transaksi'],
        target: data['target'],
      );

  MySavings copyWith({
    int transaksi,
    int target,
  }) =>
      MySavings(
        transaksi: transaksi ?? this.transaksi,
        target: target ?? this.target,
      );

  @override
  List<Object> get props => [
        transaksi,
        target,
      ];
}
