import 'package:practice_project_module11/rest%20api/profile_update_api.dart';
import 'package:practice_project_module11/utils/style/base64_image.dart';

import '../../const/export.dart';

import '../../utils/validate.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController emailController =
      TextEditingController(text: UserData.userEmail);

  final TextEditingController firstNameController =
      TextEditingController(text: UserData.userFirstName);

  final TextEditingController lastNameController =
      TextEditingController(text: UserData.userLastName);

  final TextEditingController mobileNumberController =
      TextEditingController(text: UserData.userMobileNumber);

  final TextEditingController passwordController =
      TextEditingController(text: UserData.userPassword);

  final FocusNode focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  File? selectedImagePath;

  updateProfile() async {
    EasyLoading.show(status: 'Updating');
    var response = await updateProfileApiRequest(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        mobile: mobileNumberController.text.trim(),
        photo: '$baseUrlBase64${UserData.userPhoto}');
    if (response == true) {
      var response = await loginApiRequest(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (response == true) {
        EasyLoading.showSuccess('Great Success!');
        removeAllToNavigate(
            context: context, route: RouteName.homeScreen, argument: 0);
      }
    } else {
      EasyLoading.showError('failed!');
    }
  }

  Future getImage() async {
    var pickedImage = await pickImage(ImageSource.gallery);
    setState(() {
      selectedImagePath = pickedImage;
    });
  }

  convertImageBase64() async {
    var convertedImage = await encodeBase64Image(selectedImagePath!);
    setState(() {
      UserData.userPhoto = convertedImage;
      print(UserData.userPhoto);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BackgroundView(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height / 1.5,
            width: size.width / 1.2,
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const HeadlineText(text: Strings.updateProfile),
                  SizedBox(
                    height: 80,
                    width: size.width,
                    child: Row(
                      children: [
                        PhotosText(onTap: () {
                          getImage().then((value) => convertImageBase64());
                        }),
                        const SizedBox(width: 10),
                        UserData.userPhoto.isEmpty
                            ? Container()
                            : PhotosCard(
                                img: decodeBase64Image(UserData.userPhoto)),
                      ],
                    ),
                  ),
                  SizedBox(height: kPrimarySmallSize.sp),
                  CustomTextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: validateEmail,
                      controller: emailController,
                      hintText: Strings.enterYourEmail,
                      label: Strings.email),
                  const SizedBox(height: 10),
                  CustomTextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      validator: validate,
                      controller: firstNameController,
                      hintText: Strings.enterYourFirstName,
                      label: Strings.firstName),
                  const SizedBox(height: 10),
                  CustomTextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      validator: validate,
                      controller: lastNameController,
                      hintText: Strings.enterYourLastName,
                      label: Strings.lastName),
                  const SizedBox(height: 10),
                  CustomTextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      validator: validateMobile,
                      controller: mobileNumberController,
                      hintText: Strings.enterYourMobileNumber,
                      label: Strings.mobileNumber),
                  const SizedBox(height: 10),
                  CustomTextField(
                      onFieldSubmitted: (value) {
                        if (formKey.currentState!.validate()) {
                          updateProfile();
                        }
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                      validator: validatePassword,
                      controller: passwordController,
                      hintText: Strings.enterYourPassword,
                      label: Strings.password),
                  const SizedBox(height: 10),
                  GlobalButton(onPress: () {
                    if (formKey.currentState!.validate()) {
                      updateProfile();
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
