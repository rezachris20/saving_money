part of 'controllers.dart';

class TransactionController extends GetxController {
  final transactions = TransactionsV2();

  Future<void> detailTransactions(int idTransaksi) async {
    ApiReturnValue<Transactions> result =
        await TransactionsServices.detailTransactions(idTransaksi);
    if (result.value != null) {
      transactions.id.value = result.value.id;
      transactions.name.value = result.value.name;
      transactions.userName.value = result.value.userName;
      transactions.nominal.value = result.value.nominal;
      transactions.keterangan.value = result.value.keterangan;
      transactions.description.value = result.value.description;
      transactions.tanggal.value = result.value.tanggal.toString();
      transactions.target.value = result.value.target;
      transactions.debit.value = result.value.debit;
      transactions.kredit.value = result.value.kredit;
      transactions.percent.value =
          result.value.nominal / result.value.target;
    }
  }
}
