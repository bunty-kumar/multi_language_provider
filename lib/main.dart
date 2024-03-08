import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multi_language_provider/change_language_controller.dart';
import 'package:multi_language_provider/presentation/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  String languageCode = sp.getString("language_code") ?? "";
  runApp(MyApp(
    languageType: languageCode,
  ));
}

class MyApp extends StatelessWidget {
  final String languageType;

  const MyApp({super.key, required this.languageType});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangeLanguageController())
      ],
      child: Consumer<ChangeLanguageController>(
        builder: (BuildContext context, ChangeLanguageController provider,
            Widget? child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            locale: languageType.isEmpty
                ? const Locale("en")
                : provider.appLocale ?? Locale(languageType),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: const [
              Locale("en"),
              Locale("hi"),
              Locale("es"),
            ],
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
