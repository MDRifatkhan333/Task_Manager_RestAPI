String baseUrl = 'https://task.teamrabbil.com/api/v1';
var headers = {'Content-Type': 'application/json'};
var headerWithTokens = {
  'Content-Type': 'application/json',
  'token': UserData.userToken
};
//login or create account  data get key
String firstName = 'firstName';
String lastName = 'lastName';
String mobile = 'mobile';
String photo = 'photo';
String email = 'email';
String password = 'password';
String createdDate = 'createdDate';
String id = '_id';
String data = 'data';
String status = 'status';
String success = 'success';
String description = 'description';
String token = 'token';
String title = 'title';
// Shared Preferences data set Key
String setEmailKey = 'setEmail';
String setOtpKey = 'setOtp';
String setFirstNameKey = 'setFirstName';
String setLastNameKey = 'setLastName';
String setMobileKey = 'setMobile';
String setPhotoKey = 'setPhoto';
String setIdKey = 'setId';
String setPasswordKey = 'setPassword';
String setCreatedDate = 'setCreatedDate';
String setTokenKey = 'token';
bool isLoading = true;

//User Data Store =================
class UserData {
  static String userEmail = '';
  static String userPassword = '';
  static String userOtp = '';
  static String userToken = '';
  static String userId = '';
  static String userPhoto = "";
  static String userFirstName = '';
  static String userLastName = '';
  static String userCreatedDate = '';
  static String userMobileNumber = '';

  UserData._();
}
