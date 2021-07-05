part of 'services.dart';

class PortofolioServices {
  static Future<ApiReturnValue<List<Portofolio>>> getPortofolio(
      {http.Client client}) async {
    client ??= http.Client();

    var url = Uri.parse(baseURL + "portofolio/get/${User.familyId}");

    var response = await client.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Portofolio> portofolio =
        (data['data'] as Iterable).map((e) => Portofolio.fromJson(e)).toList();

    return ApiReturnValue(value: portofolio);
  }

  static Future<ApiReturnValue<List<Portofolio>>> getDropdown(
      {http.Client client}) async {
    client ??= http.Client();

    var url = Uri.parse(baseURL + "portofolio/dropdown/${User.familyId}");

    var response = await client.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Portofolio> dropdown = (data['data'] as Iterable)
        .map((e) => Portofolio.fromJsonDropdown(e))
        .toList();

    return ApiReturnValue(value: dropdown);
  }

  static Future<ApiReturnValue<Portofolio>> addNewPortofolio(
      Portofolio portofolio,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "portofolio/insert";
    var uri = Uri.parse(url);

    var response = await client.post(uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${User.token}"
        },
        body: jsonEncode(<String, dynamic>{
          'name': portofolio.name,
          'target': portofolio.target
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    Portofolio value = Portofolio.jsonSuccess(data['data']['portofolio']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<Portofolio>> submitTarget(Portofolio portofolio,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "portofolio/add-target/${User.familyId}";
    var uri = Uri.parse(url);

    var response = await client.post(uri, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${User.token}"
    }, body: jsonEncode(<String,dynamic>{
      'target': portofolio.target
    }));

    if(response.statusCode != 200){
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    Portofolio value = Portofolio.jsonAddTarget(data['data']);

    return ApiReturnValue(value: value);
  }
}
