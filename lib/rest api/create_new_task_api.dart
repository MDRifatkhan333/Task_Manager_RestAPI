import 'package:http/http.dart' as http;
import '../const/export.dart';
createNewTaskApiRequest({title, description, taskStatus}) async {
  var url = '$baseUrl/createTask';
  var uri = Uri.parse(url);
  var body = json.encode({
    "title": title,
    "description": description,
    "status": taskStatus,
  });
  Response response =
      await http.post(uri, body: body, headers: headerWithTokens);
  var responseBody = json.decode(response.body);
  if (response.statusCode == 200 && responseBody[status] == success) {
    return true;
  }
  return false;
}
