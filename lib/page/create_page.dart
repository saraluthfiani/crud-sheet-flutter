import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/api/region_sheets_api.dart';
import 'package:flutter_application/page/modify_page.dart';
import 'package:flutter_application/widget/form_widget.dart';

class CreatePage extends StatelessWidget {
  static const String title = 'Create Sheets';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        centerTitle: true,
        backgroundColor: Color.fromARGB(135, 139, 75, 148),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            const SizedBox(height: 40),
            SingleChildScrollView(
              child: RegionFormWidget(
                onSavedRegion: (region) async {
                  final id = await RegionSheetsApi.getRowCount() + 1;
                  final newRegion = region.copy(id: id);

                  await RegionSheetsApi.insert([newRegion.toJson()]);
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ModifyPage()));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF95779B))),
                child: Text('Edit Sheets')),
          ],
        ),
      ),
    );
  }
}
