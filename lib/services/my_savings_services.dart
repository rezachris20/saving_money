part of 'services.dart';

class MySavingsServices {
  static Future<ApiReturnValue<MySavings>> getSavings(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "transactions/get";
    var uri = Uri.parse(url);
    var response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    MySavings value = MySavings.fromJson(data['data']['my_saving']);

    return ApiReturnValue(value: value);
  }
}
