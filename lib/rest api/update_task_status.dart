import 'package:http/http.dart' as http;

import '../const/export.dart';

Future updateTaskStatusApiRequest({sId, taskStatus}) async {
  var url = '$baseUrl/updateTaskStatus/$sId/$taskStatus';
  var uri = Uri.parse(url);
  var response = await http.get(uri, headers: headerWithTokens);
  var responseBody = jsonDecode(response.body);
  if (response.statusCode == 200 && responseBody[status] == success) {
    return true;
  }
  return false;
}
