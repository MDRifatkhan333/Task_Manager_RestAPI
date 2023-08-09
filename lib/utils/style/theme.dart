
import '../../const/export.dart';

ThemeData mainTheme() => ThemeData(

primarySwatch: AppColor.kPrimaryColor,
    appBarTheme: globalAppBarTheme(),
    elevatedButtonTheme: globalElevatedButtonStyle(),
    inputDecorationTheme: globalInputDecorationTheme(),
  );

InputDecorationTheme globalInputDecorationTheme() => const InputDecorationTheme(
    border:   OutlineInputBorder(borderSide: BorderSide.none),
    filled: true,
  );

ElevatedButtonThemeData globalElevatedButtonStyle() => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shadowColor: Colors.black,
          padding: const EdgeInsets.all(16)));

AppBarTheme globalAppBarTheme() =>
    const AppBarTheme(elevation: 0, );
