import 'package:flutter/material.dart';
import 'package:flutter_application/api/region_sheets_api.dart';
import 'package:flutter_application/page/create_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await RegionSheetsApi.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreatePage(),
    );
  }
}
