import 'package:flutter/material.dart';
import 'package:flutter_festival/homepage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'invitation_card.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates:const  [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("ar", "AE"),],
      locale: const Locale("ar", "AE"),
      title: 'Dash Invitation Card',
      theme: ThemeData(
        primaryColor: const Color(0xff2372A3) ,
        appBarTheme: const AppBarTheme(
          elevation: 40,
          color: Color(0xff104c91),
          titleTextStyle: TextStyle(
            fontFamily: 'arial',
            fontSize: 26,
            color: Color(0xffF4ECDF),
          )
        ),
        scaffoldBackgroundColor: const Color(0xffF9F5ED),
        //backgroundColor: const Color(0xffF4ECDF),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontFamily: 'arial',
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color:  Color(0xff104c91)
            // Color(0xff2372A3),
          ),
        ),
        // buttonTheme: const ButtonThemeData(
        //   highlightColor: Color(0xff2372A3),
        //   buttonColor: Color(0xff2372A3)
        //
        // ),

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}


