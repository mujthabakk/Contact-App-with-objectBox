import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:objectboxcontact/services/contactservices.dart';
import 'package:objectboxcontact/view/pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ContactServices.create();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Homepage(),
    );
  }
}
