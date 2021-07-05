part of 'services.dart';

class TransactionsServices {
  static Future<ApiReturnValue<List<Transactions>>> getTransactions(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "transactions/get";
    var uri = Uri.parse(url);

    var response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Transactions> transactions =
        (data['data']['list_transaksi'] as Iterable)
            .map((e) => Transactions.fromJson(e))
            .toList();

    return ApiReturnValue(
      value: transactions,
    );
  }

  static Future<ApiReturnValue<Transactions>> submitTransactions(
      Transactions transactions,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "transactions/insert";
    var uri = Uri.parse(url);

    var response = await client.post(uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${User.token}"
        },
        body: jsonEncode(<String, dynamic>{
          'portofolio_id': transactions.portofolioId,
          'nominal': transactions.nominal,
          'dk': transactions.debitOrKredit,
          'tanggal': transactions.tanggal.toString(),
          'description': (transactions.description != null)
              ? transactions.description
              : null
        }));

    if (response.statusCode != 200) {
      ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    Transactions value = Transactions.fromJsonSubmit(data['data']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<Transactions>> detailTransactions(int id,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "transactions/detail/"+id.toString()+"/${User.familyId}";
    var uri = Uri.parse(url);

    var response = await client.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${User.token}"
      },
    );

    if (response.statusCode != 200) {
      ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    Transactions detailTransaksi = Transactions.fromJsonDetail(data['data']);

    return ApiReturnValue(value: detailTransaksi);
  }
}
