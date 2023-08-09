
import '../../const/export.dart';

class JoinWithUsScreen extends StatefulWidget {
  const JoinWithUsScreen({super.key});

  @override
  State<JoinWithUsScreen> createState() => _JoinWithUsScreenState();
}

class _JoinWithUsScreenState extends State<JoinWithUsScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  createAccount(context) async {
    EasyLoading.show(status: 'Loading..');
    if (emailController.text.trim() == UserData.userEmail &&
        passwordController.text.trim() == UserData.userPassword) {
      var response = await createAccountApiRequest(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          mobile: mobileNumberController.text.trim(),
          photo: base64String);
      if (response == true) {
        var response = await loginApiRequest(
            email: UserData.userEmail, password: UserData.userPassword);
        if (response == true) {
          EasyLoading.showSuccess('Great Success!');
          removeAllToNavigate(context: context, route: RouteName.homeScreen);
        }
      } else {
        EasyLoading.showError('Something went wrong!');
      }
    } else {
      EasyLoading.showError('Required verified email and password!');
    }
  }

  getUserEmailPassword() async {
    String? passwordData = await getStringData(key: setPasswordKey);
    String? emailData = await getStringData(key: setEmailKey);
    UserData.userPassword = passwordData!;
    UserData.userEmail = emailData!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserEmailPassword();
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
                child: Column(
                  children: [
                    const HeadlineText(text: Strings.joinWithUs),
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
                      validator: validateMobile,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        controller: mobileNumberController,
                        hintText: Strings.enterYourMobileNumber,
                        label: Strings.mobileNumber),
                    const SizedBox(height: 10),
                    CustomTextField(
                      validator: validatePassword,
                        focusNode: focusNode,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.name,
                        onFieldSubmitted: (value) {
                          if (formKey.currentState!.validate()) {
                            focusNode.unfocus();
                            createAccount(context);
                          }
                        },
                        controller: passwordController,
                        hintText: Strings.enterYourPassword,
                        label: Strings.password),
                    const SizedBox(height: 10),
                    SizedBox(height: kDefaultSize.sp),
                    GlobalButton(
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          focusNode.unfocus();
                          createAccount(context);
                        }
                      },
                    ),
                    const Spacer(),
                    LongLineText(
                      text: 'have an account ? ',
                      btnTxt: ' Sign in',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
