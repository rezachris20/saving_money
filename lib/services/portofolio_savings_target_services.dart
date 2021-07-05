part of 'services.dart';

class PortofolioSavingsTargetServices {
  static Future<ApiReturnValue<PortofolioSavingsTarget>> getSavings({http.Client client}) async {
client ??= http.Client();
    String url = baseURL + "portofolio/saving-target/${User.familyId}";
    var uri = Uri.parse(url);

    var response = await client.get(uri,headers:{
      "Content-Type" : "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if(response.statusCode != 200){
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    PortofolioSavingsTarget portofolioSavingsTarget = PortofolioSavingsTarget.fromJson(data['data']);

    return ApiReturnValue(value: portofolioSavingsTarget);
  }
}