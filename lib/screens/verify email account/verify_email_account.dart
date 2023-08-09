import '../../const/export.dart';

class VerifyEmailAccount extends StatefulWidget {
  const VerifyEmailAccount({super.key});

  @override
  State<VerifyEmailAccount> createState() => _VerifyEmailAccountState();
}

class _VerifyEmailAccountState extends State<VerifyEmailAccount> {
  final TextEditingController emailController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  verifyAccount(context) async {
    EasyLoading.show(status: 'Loading..');
    var response = await verifyEmailApiRequest(
        email: emailController.text.trim().toString());
    if (response == true) {
      EasyLoading.dismiss();
      getData();
      Navigator.of(context).pushNamed(RouteName.pinVerificationScreen);
    } else {
      EasyLoading.showError('Email verify failed!');
    }
  }

  Future getData() async {
    String? emailData = await getStringData(key: setEmailKey);
    UserData.userEmail = emailData!;
    setState(() {});
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
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HeadlineText(text: Strings.yourEmailAddress),
                  const SubtitleText(
                      text: Strings.verificationPinSendToEmailAddress),
                  SizedBox(height: kPrimarySmallSize.sp),
                  CustomTextField(

                      onFieldSubmitted: (value) {
                        if (formKey.currentState!.validate()) {
                          verifyAccount(context);
                        }
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: validateEmail,
                      controller: emailController,
                      hintText: Strings.enterYourEmail,
                      label: Strings.email),
                  const Spacer(),
                  GlobalButton(onPress: () {
                    if (formKey.currentState!.validate()) {
                      verifyAccount(context);
                    }
                  }),
                  const Spacer(),
                  LongLineText(
                    text: 'have an account ? ',
                    btnTxt: ' Sign in',
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteName.loginScreen);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
