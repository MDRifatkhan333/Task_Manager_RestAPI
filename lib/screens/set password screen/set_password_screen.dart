
import '../../const/export.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FocusNode focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  setPassword(context) async {
    EasyLoading.show(status: 'Loading..');
    if (passwordController.text == confirmPasswordController.text) {
      //Set password method========================================
      var response = await setAndResetApiRequest(
          email: UserData.userEmail,
          otp: UserData.userOtp,
          password: passwordController.text.trim());
      if (response == true) {
        EasyLoading.dismiss();
        removeAllToNavigate(
            context: context, route: RouteName.joinWithUsScreen);
      } else {
        EasyLoading.showError('Password set failed!');
      }
    } else {
      EasyLoading.showError('Password same as required!');
    }
  }

  getData() async {
    String? otpData = await getStringData(key: setOtpKey);
    UserData.userOtp = otpData!;
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: BackgroundView(
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height / 2.0,
              width: size.width / 1.2,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const HeadlineText(text: Strings.setPassword),
                    const SubtitleText(
                        text: Strings.minimumLengthCharacterText),
                    SizedBox(height: kPrimarySmallSize.sp),
                    CustomTextField(

                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        validator: validatePassword,
                        controller: passwordController,
                        hintText: Strings.enterYourPassword,
                        label: Strings.password),
                    const SizedBox(height: 10),
                    CustomTextField(
                        focusNode: focusNode,
                        onFieldSubmitted: (value) {
                          if (formKey.currentState!.validate()) {
                            focusNode.unfocus();
                            setPassword(context);
                          }
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        validator: validatePassword,
                        controller: confirmPasswordController,
                        hintText: Strings.enterYourConfirmPassword,
                        label: Strings.confirmPassword),
                    const Spacer(),
                    GlobalButton(
                      onPress: () {
                        focusNode.unfocus();
                        if (formKey.currentState!.validate()) {
                          setPassword(context);
                        }
                      },
                    ),
                    const Spacer(),
                    LongLineText(
                      text: 'have an account ? ',
                      btnTxt: ' Sign in',
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouteName.createAccountScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
