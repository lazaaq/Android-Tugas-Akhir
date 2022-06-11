import 'package:flutter/material.dart';
import 'package:my_kost/providers/penghuni_provider.dart';
import 'package:provider/provider.dart';
import './pages/penghuni.dart';

void main() {
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
        home: Penghuni(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
