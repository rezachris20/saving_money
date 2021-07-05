part of 'models.dart';

class Transactions extends Equatable {
  final int id;
  final String name;
  final String userName;
  final int nominal;
  final DateTime tanggal;
  final int debitOrKredit;
  final String keterangan;
  final String description;
  final int portofolioId;
  final int target;
  final int debit;
  final int kredit;

  Transactions(
      {this.id,
      this.name,
      this.userName,
      this.nominal,
      this.tanggal,
      this.debitOrKredit,
      this.keterangan,
      this.description,
      this.portofolioId,
      this.target,
      this.debit,
      this.kredit});

  factory Transactions.fromJson(Map<String, dynamic> data) => Transactions(
      id: data['id'],
      name: data['portofolio']['name'],
      portofolioId: data['portofolio']['id'],
      userName: data['user_name'],
      nominal: data['nominal'],
      tanggal: DateFormat("yyyy-MM-dd").parse(data['tanggal']),
      debitOrKredit: data['dk'],
      keterangan: data['keterangan_dk'],
      description: data['description']);

  factory Transactions.fromJsonSubmit(Map<String, dynamic> data1) =>
      Transactions(
        portofolioId: data1['portofolio_id'],
        nominal: data1['nominal'],
        tanggal: DateFormat("yyyy-MM-dd").parse(data1['tanggal']),
        debitOrKredit: data1['dk'],
      );

  factory Transactions.fromJsonDetail(Map<String, dynamic> detail) =>
      Transactions(
          id: detail['id'],
          name: detail['name_portofolio'],
          userName: detail['name_user'],
          nominal: detail['nominal'],
          keterangan: detail['dk'],
          description: detail['description'],
          tanggal: DateFormat("yyyy-MM-dd").parse(detail['tanggal']),
          target: detail['target'],
          debit: detail['debit'] - detail['kredit']);

  Transactions copyWith(
          {int id,
          String name,
          String userName,
          int nominal,
          DateTime tanggal,
          int debitOrKredit,
          String keterangan,
          String description,
          int portofolioId,
          int target,
          int debit,
          int kredit}) =>
      Transactions(
          id: id ?? this.id,
          name: name ?? this.name,
          userName: userName ?? this.userName,
          nominal: nominal ?? this.nominal,
          tanggal: tanggal ?? this.tanggal,
          debitOrKredit: debitOrKredit ?? this.debitOrKredit,
          keterangan: keterangan ?? this.keterangan,
          description: description ?? this.description,
          portofolioId: portofolioId ?? this.portofolioId,
          target: target ?? this.target,
          debit: debit ?? this.debit,
          kredit: kredit ?? this.kredit);

  @override
  List<Object> get props => [
        id,
        name,
        userName,
        nominal,
        tanggal,
        debitOrKredit,
        keterangan,
        description,
        portofolioId,
        target,
        debit,
        kredit
      ];
}
