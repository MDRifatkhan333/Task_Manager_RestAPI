import 'package:http/http.dart' as http;
import '../const/export.dart';

Future<bool> setAndResetApiRequest({email, otp, password}) async {
  var url = '$baseUrl/RecoverResetPass';
  var uri = Uri.parse(url);
  var body = jsonEncode({
    "email": email,
    "OTP": otp,
    "password": password,
  });
  Response response = await http.post(uri, body: body, headers: headers);
  var responseBody = json.decode(response.body);
  if (response.statusCode == 200 && responseBody[status] == success) {
    await writeStringData(key: setPasswordKey, value: password);
    return true;
  }
  return false;
}
