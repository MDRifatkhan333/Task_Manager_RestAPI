import '../../const/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getData() async {
    String? token = await getStringData(key: setTokenKey);
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (token != null) {
        removeAllToNavigate(context: context,route: RouteName.homeScreen);
      } else {
        removeAllToNavigate(context: context,route: RouteName.loginScreen);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: true,
        body: BackgroundView(
          child: SplashLogo(),
        ));
  }
}
