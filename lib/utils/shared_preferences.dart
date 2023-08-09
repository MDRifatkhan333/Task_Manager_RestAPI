import 'package:practice_project_module11/const/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future writeStringData({key, value}) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString(key, value);
}

Future writeStringDataList({key, value}) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setStringList(key, value);
}

Future<String?> getStringData({key}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? value = prefs.getString(key);
  return value;
}

Future<List?> getStringDataList({key}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List? value = prefs.getStringList(key);
  return value;
}

removeSharedPrefData(key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}

Future writeLoginData({value}) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString(setEmailKey, value[data][email]);
  await pref.setString(setTokenKey, value[token]);
  await pref.setString(setFirstNameKey, value[data][firstName]);
  await pref.setString(setLastNameKey, value[data][lastName]);
  await pref.setString(setMobileKey, value[data][mobile]);
  await pref.setString(setPhotoKey, value[data][photo]);
}

Future writeAccountCreatedData({value}) async {
  await writeStringData(key: setEmailKey, value: value[data][email]);
  await writeStringData(key: setPasswordKey, value: value[data][password]);
  await writeStringData(key: setFirstNameKey, value: value[data][firstName]);
  await writeStringData(key: setLastNameKey, value: value[data][lastName]);
  await writeStringData(key: setIdKey, value: value[data][id]);
  await writeStringData(key: setMobileKey, value: value[data][mobile]);
  await writeStringData(key: setPhotoKey, value: value[data][photo]);
  await writeStringData(key: setCreatedDate, value: value[data][createdDate]);
}
