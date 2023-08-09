import 'package:http/http.dart' as http;

import '../const/export.dart';

Future<bool> verifyOtpApiRequest({email, otp}) async {
  var url = '$baseUrl/RecoverVerifyOTP/$email/$otp';
  var uri = Uri.parse(url);
  var response = await http.get(uri, headers: headers);
  var responseBody = jsonDecode(response.body);
  if (response.statusCode == 200 && responseBody[status] == success) {
    await writeStringData(key: setOtpKey, value: otp);
    return true;
  }
  return false;
}
