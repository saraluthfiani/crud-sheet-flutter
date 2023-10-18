import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/api/region_sheets_api.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RegionSheetsApi.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Regions';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: Container(),
      );
}
