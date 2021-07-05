part of 'models.dart';

class ListFamily extends Equatable {
  final int coreStatusId;
  final String name;
  final String address;
  final String houseNumber;
  final String phoneNumber;

  ListFamily(
      {this.coreStatusId,
      this.name,
      this.address,
      this.houseNumber,
      this.phoneNumber});

  factory ListFamily.fromJson(Map<String, dynamic> data) => ListFamily(
        coreStatusId: data['core_status_id'],
        name: data['name'],
        address: data['address'],
        houseNumber: data['houseNumber'],
        phoneNumber: data['phoneNumber'],
      );

  ListFamily copyWith({
    int coreStatusId,
    String name,
    String address,
    String houseNumber,
    String phoneNumber,
  }) =>
      ListFamily(
          coreStatusId: coreStatusId ?? this.coreStatusId,
          name: name ?? this.name,
          address: address ?? this.address,
          houseNumber: houseNumber ?? this.houseNumber,
          phoneNumber: phoneNumber ?? this.phoneNumber);

  @override
  List<Object> get props => [
        coreStatusId,
        name,
        address,
        houseNumber,
        phoneNumber,
      ];
}
