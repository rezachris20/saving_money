part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String status;
  final String picturePath;
  final String familyName;
  final String codeFamily;
  static String token;
  static int familyId;
  static String viewCodeFamily;

  User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.status,
      this.familyName,
      this.codeFamily,
      this.picturePath});

  factory User.fromJson(Map<String, dynamic> data) => User(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      address: data['address'],
      houseNumber: data['houseNumber'],
      phoneNumber: data['phoneNumber'],
      picturePath: data['profile_photo_url']);

  User copyWith(
          {int id,
          String name,
          String email,
          String address,
          String houseNumber,
          String phoneNumber,
          String status,
          String familyName,
          String codeFamily,
          String picturePath}) =>
      User(
          id: id ?? this.id,
          name: name ?? this.name,
          email: email ?? this.email,
          address: address ?? this.address,
          houseNumber: houseNumber ?? this.houseNumber,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          status: status ?? this.status,
          familyName: familyName ?? this.familyName,
          codeFamily: codeFamily ?? this.codeFamily,
          picturePath: picturePath ?? this.picturePath);

  @override
  List<Object> get props =>
      [id, name, email, address, houseNumber, phoneNumber, status, picturePath, familyName,codeFamily];
}
