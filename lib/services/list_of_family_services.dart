part of 'services.dart';

class ListOfFamilyServices {
  static Future<ApiReturnValue<List<ListFamily>>> getList(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "list-family/${User.familyId}";
    var uri = Uri.parse(url);
    var response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<ListFamily> listFamily =
        (data['data'] as Iterable).map((e) => ListFamily.fromJson(e)).toList();

    return ApiReturnValue(value: listFamily);
  }
}
