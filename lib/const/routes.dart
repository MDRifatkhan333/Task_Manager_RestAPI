import 'export.dart';

Map<String, WidgetBuilder> routes() => {
      RouteName.splashScreen: (context) => const SplashScreen(),
      RouteName.loginScreen: (context) => const LoginScreen(),
      RouteName.createAccountScreen: (context) => const VerifyEmailAccount(),
      RouteName.pinVerificationScreen: (context) =>
          const PinVerificationScreen(),
      RouteName.setPasswordScreen: (context) => const SetPasswordScreen(),
      RouteName.joinWithUsScreen: (context) => const JoinWithUsScreen(),
      RouteName.addNewTaskScreen: (context) => const AddNewTaskScreen(),
      RouteName.updateProfileScreen: (context) => const UpdateProfileScreen(),
      RouteName.homeScreen: (context) => const HomeScreen(),
    };
