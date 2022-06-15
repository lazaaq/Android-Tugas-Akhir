import 'package:flutter/material.dart';
import 'package:my_kost/pages/home.dart';
import 'package:my_kost/pages/penghuni.dart';
import 'package:my_kost/providers/penghuni_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PenghuniProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins'
        ),
        onGenerateTitle: (context) {
          var t = AppLocalizations.of(context);
          return t!.appTitle;
        },
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        initialRoute: '/',
        routes: {
          '/': (context) {
            return Home(title: AppLocalizations.of(context)!.appTitle);
          },
          '/penghuni': (context) {
            return Penghuni();
          },
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
