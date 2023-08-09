import 'package:http/http.dart' as http;

import '../const/export.dart';

Future<bool> loginApiRequest({email, password}) async {
  String url = '$baseUrl/login';
  Uri uri = Uri.parse(url);
  var body = jsonEncode({
    'email': email,
    'password': password,
  });
  Response response = await http.post(uri, body: body, headers: headers);
  var responseBody = json.decode(response.body);
  if (response.statusCode == 200 && responseBody[status] == success) {
    await writeStringData(key: setPasswordKey,value: password);
    await writeLoginData(value: responseBody);
    return true;
  }
  return false;
}
