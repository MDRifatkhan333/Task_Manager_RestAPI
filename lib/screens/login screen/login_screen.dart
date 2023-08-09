import '../../const/export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  //Login request method
  loginRequest(context) async {
    EasyLoading.show(status: 'loading...');
    var response = await loginApiRequest(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    if (response == true) {
      EasyLoading.showSuccess('Great Success!');
      removeAllToNavigate(context: context, route: RouteName.homeScreen);
    } else {
      EasyLoading.showError('Login failed!');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BackgroundView(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height / 1.8,
            width: size.width / 1.2,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HeadlineText(text: Strings.getStartedWith),
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
                      focusNode: focusNode,
                      onFieldSubmitted: (value) {
                        if (formKey.currentState!.validate()) {
                          focusNode.unfocus();
                          loginRequest(context);
                        }
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                      validator: validatePassword,
                      controller: passwordController,
                      hintText: Strings.enterYourPassword,
                      label: Strings.password),
                  const Spacer(),
                  GlobalButton(onPress: () {
                    if (formKey.currentState!.validate()) {
                      focusNode.unfocus();
                      loginRequest(context);
                    }
                  }),
                  const Spacer(),
                  CommonText(
                    text: Strings.forgotPassword,
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
                  LongLineText(
                    text: Strings.dontHaveAnAccount,
                    btnTxt: Strings.signUp,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RouteName.createAccountScreen);
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
