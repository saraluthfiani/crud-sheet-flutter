import 'package:flutter/material.dart';
import 'package:flutter_application/api/region_sheets_api.dart';
import 'package:flutter_application/main.dart';
import 'package:flutter_application/model/region.dart';
import 'package:flutter_application/widget/button_widget.dart';
import 'package:flutter_application/widget/form_widget.dart';
import 'package:flutter_application/widget/navigate_widget.dart';

class ModifyPage extends StatefulWidget {
  @override
  _ModifyPageState createState() => _ModifyPageState();
}

class _ModifyPageState extends State<ModifyPage> {
  List<Region> regions = [];
  int index = 0;
  @override
  void initState() {
    super.initState();

    getRegions();
  }

  Future getRegions({int index = 0}) async {
    final regions = await RegionSheetsApi.getAll();
    //print(region!.toJson());

    setState(() {
      this.regions = regions;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Modify Sheets'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(135, 139, 75, 148),
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(15),
            children: [
              RegionFormWidget(
                region: regions.isEmpty ? null : regions[index],
                onSavedRegion: (region) async {
                  await RegionSheetsApi.update(region.id!, region.toJson());
                  // RegionSheetsApi.updateCell(
                  //     id: 1, key: 'regionA', value: '200');
                },
              ),
              const SizedBox(height: 16),
              if (regions.isNotEmpty) buildRegionControls(),
            ],
          ),
        ),
      );

  Widget buildRegionControls() => Column(children: [
        ButtonWidget(text: 'Delete', onClicked: deleteRegion),
        NavigateWidget(
          text: '${index + 1}/${regions.length} Lists',
          onClickedNext: () {
            final nextIndex = index >= regions.length - 1 ? 0 : index + 1;
            setState(() => index = nextIndex);
          },
          onClickedPrevious: () {
            final previousIndex = index <= 0 ? regions.length - 1 : index - 1;
            setState(() => index = previousIndex);
          },
        )
      ]);

  Future deleteRegion() async {
    final region = regions[index];

    await RegionSheetsApi.deleteById(region.id!);

    //update UI
    final newIndex = index > 0 ? index - 1 : 0;
    await getRegions(index: newIndex);
  }
}
