import 'package:flutter/material.dart';
import 'applocale/applocale.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Localization',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),



      home: MyHomePage(),
      localizationsDelegates: const [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
        Locale("en", ""),
        Locale("ar", ""),
      ],

      localeResolutionCallback: (currentLang, supportLang) {
        if (currentLang != null) {
          for (Locale locale in supportLang) {
            if (locale.languageCode == currentLang.languageCode) {
             // mySharedPreferences.setString("lang",currentLang.languageCode) ;
              return currentLang;
            }  }  }
        return supportLang.first;
      }, );
  }  }


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text("My Home Page"),),
      body: Text("${getLang(context, "welcome")}"
      ),
    );
  }
}

