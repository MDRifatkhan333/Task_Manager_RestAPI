import '../const/export.dart';
import 'package:http/http.dart' as http;

Future<bool> verifyEmailApiRequest({email}) async {
  var url = '$baseUrl/RecoverVerifyEmail/$email';
  var uri = Uri.parse(url);
  var response = await http.get(uri, headers: headers);
  var responseBody = jsonDecode(response.body);
  if (response.statusCode == 200 && responseBody[status] == success) {
    await writeStringData(key: setEmailKey, value: email);
    return true;
  }
  return false;
}
