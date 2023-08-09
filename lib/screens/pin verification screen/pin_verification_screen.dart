import '../../const/export.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController otpController = TextEditingController();

  verifyOtp(context) async {
    EasyLoading.show(status: 'Loading..');
    var response = await verifyOtpApiRequest(
        email: UserData.userEmail, otp: otpController.text.trim());
    if (response == true) {
      EasyLoading.dismiss();
      removeAllToNavigate(context: context,route: RouteName.setPasswordScreen);
    } else {
      EasyLoading.showError('Provided pin wrong!');
    }
  }

  getData() async {
    String? emailData = await getStringData(key: setEmailKey);
    String? passwordData = await getStringData(key: setPasswordKey);
    UserData.userEmail = emailData!;
    UserData.userPassword = passwordData!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BackgroundView(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height / 2.5,
            width: size.width / 1.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeadlineText(text: Strings.pinVerification),
                SubtitleText(
                    text: Strings.verificationPinSendToEmailAddress +
                        UserData.userEmail.toString()),
                SizedBox(height: kPrimarySmallSize.sp),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      inactiveFillColor: AppColor.kTextColor.withOpacity(0.10),
                      activeColor: AppColor.kPrimaryColor),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: otpController,
                  onCompleted: (v) {
                    verifyOtp(context);
                  },
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
                const Spacer(),
                GlobalButton(
                  onPress: () {
                    verifyOtp(context);
                  },
                ),
                const Spacer(),
                LongLineText(
                  text: 'have an account ? ',
                  btnTxt: ' Sign in',
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteName.loginScreen, (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
