import 'package:http/http.dart' as http;
import '../const/export.dart';

Future<bool> createAccountApiRequest(
    {email, password, firstName, lastName, mobile, photo}) async {
  String url = '$baseUrl/registration';
  Uri uri = Uri.parse(url);
  var body = jsonEncode({
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "mobile": mobile,
    "password": password,
    "photo": photo
  });
  Response response = await http.post(uri, headers: headers, body: body);
  var responseBody = jsonDecode(response.body);
  if (response.statusCode == 200 && responseBody[status] == success) {
    await writeAccountCreatedData(value: responseBody);
    return true;
  }
  return false;
}
