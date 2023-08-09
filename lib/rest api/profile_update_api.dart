
import '../const/export.dart';
import 'package:http/http.dart' as http;
updateProfileApiRequest( {email, password, firstName, lastName, mobile, photo}) async {
  var url = '$baseUrl/profileUpdate';
  var uri = Uri.parse(url);
  var body = json.encode({
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "mobile": mobile,
    "password": password,
    "photo": photo
  });
  Response response =
  await http.post(uri, body: body, headers: headerWithTokens);
  var responseBody = json.decode(response.body);
  if (response.statusCode == 200 && responseBody[status] == success) {
    return true;
  }
  return false;
}
