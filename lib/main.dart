import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rentalhood/pages/login/login_screen.dart';
import 'package:rentalhood/pages/login/register_screen.dart';
import 'package:rentalhood/pages/splash.dart';
import 'package:rentalhood/widgets/navbar/navBar.dart';
import 'package:rentalhood/widgets/navbar/themes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFbe3144),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          title: 'RentalHood',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: SplashScreen(),
          routes: {
            '/home': (context) => NavigationBar(),
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen()
          },
        );
      },
    ),
  );
}
