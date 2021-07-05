part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signUp(
      User user, String password, String confirmPassword,
      {File pictureFile, http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "register";
    var uri = Uri.parse(url);

    var response = await client.post(uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          'name': user.name,
          'email': user.email,
          'password': password,
          'password_confirmation': confirmPassword,
          'address': user.address,
          'houseNumber': user.houseNumber,
          'phoneNumber': user.phoneNumber,
          'status': user.status,
          'family_name': user.familyName,
          'code_familiy': user.codeFamily
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User.familyId = data['data']['family_id'];
    User.viewCodeFamily = data['data']['code_family'];
    User value = User.fromJson(data['data']['user']);

    // Upload PP
    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadProfilePicture(pictureFile);
      if (result.value != null) {
        value = value.copyWith(picturePath: imageStorage + result.value);
      }
    }

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest request}) async {
    String url = baseURL + "user/photo";
    var uri = Uri.parse(url);
    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers["Content-Type"] = "application/json"
        ..headers["Authorization"] = "Bearer ${User.token}";
    }

    var multiPartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);
    request.files.add(multiPartFile);

    var response = await request.send();
print(response.statusCode); 

    // if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];

      return ApiReturnValue(value: imagePath);

    // } else {
    //   return ApiReturnValue(message: 'Uploading Profile Picture Failed');
    // }
  }

  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "login";
    var uri = Uri.parse(url);

    var response = await client.post(uri,
        headers: {"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    User.token = data['data']['access_token'];
    User.familyId = data['data']['family_id'];
    User.viewCodeFamily = data['data']['code_family'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> signOut({http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'logout';
    var uri = Uri.parse(url);

    var response = await client.post(uri, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    return ApiReturnValue(message: 'sukses');
  }

  static Future<ApiReturnValue<String>> generateKodeFamily(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "user/generate-kode/${User.familyId}";
    var uri = Uri.parse(url);

    var response = await client.post(uri, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    User.viewCodeFamily = data['data']['code'];

    return ApiReturnValue(value: data['data']['code']);
  }

  static Future<ApiReturnValue<User>> editProfile(User user,
      {File pictureFile, http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "user";
    var uri = Uri.parse(url);

    var response = await client.post(uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${User.token}"
        },
        body: jsonEncode(<String, String>{
          'name': user.name,
          'email': user.email,
          'address': user.address,
          'houseNumber': user.houseNumber,
          'phoneNumber': user.phoneNumber,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);


    User value = User.fromJson(data['data']);
    // Upload PP
    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadProfilePicture(pictureFile);
      if (result.value != null) {
        value = value.copyWith(picturePath: imageStorage + result.value);
      }
    }
    
    return ApiReturnValue(value: value);
  }
}
