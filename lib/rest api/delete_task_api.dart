import 'package:http/http.dart' as http;
import '../const/export.dart';

Future<bool> deleteTaskApiRequest({taskId}) async {
  String url = '$baseUrl/deleteTask/$taskId';
  Uri uri = Uri.parse(url);
  Response response = await http.get(uri, headers: headerWithTokens);
  var responseBody = jsonDecode(response.body);
  if (response.statusCode == 200 && responseBody[status] == success) {
    return true;
  }
  return false;
}
