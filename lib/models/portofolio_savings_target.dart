part of 'models.dart';

class PortofolioSavingsTarget {
  final int mySavings;
  final int target;

  PortofolioSavingsTarget({this.mySavings, this.target});

  factory PortofolioSavingsTarget.fromJson(Map<String, dynamic> data) =>
      PortofolioSavingsTarget(
          mySavings: data['my_savings'], target: data['target']);

  PortofolioSavingsTarget copyWith({int mySavings, int target}) =>
      PortofolioSavingsTarget(
          mySavings: mySavings ?? this.mySavings,
          target: target ?? this.target);

  @override
  List<Object> get props => [
        mySavings,
        target,
      ];
}
