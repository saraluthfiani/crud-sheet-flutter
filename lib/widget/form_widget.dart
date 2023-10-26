import 'package:flutter/material.dart';
import 'package:flutter_application/api/region_sheets_api.dart';
import 'package:flutter_application/model/region.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_application/page/modify_page.dart';
import 'package:flutter_application/widget/navigate_widget.dart';
import 'button_widget.dart';

class RegionFormWidget extends StatefulWidget {
  final Region? region;
  final ValueChanged<Region> onSavedRegion;

  const RegionFormWidget({
    Key? key,
    this.region,
    required this.onSavedRegion,
  }) : super(key: key);

  @override
  _RegionFormWidgetState createState() => _RegionFormWidgetState();
}

class _RegionFormWidgetState extends State<RegionFormWidget> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerRegionA;
  late TextEditingController controllerRegionB;
  late TextEditingController controllerRegionC;
  late TextEditingController controllerRegionD;
  late TextEditingController controllerRegionE;
  late TextEditingController controllerRegionF;
  late TextEditingController controllerRegionG;

  @override
  void initState() {
    super.initState();

    initRegion();
  }

  @override
  void didUpdateWidget(covariant RegionFormWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    initRegion();
  }

  void initRegion() {
    final regionA = widget.region == null ? '' : widget.region!.regionA;
    final regionB = widget.region == null ? '' : widget.region!.regionB;
    final regionC = widget.region == null ? '' : widget.region!.regionC;
    final regionD = widget.region == null ? '' : widget.region!.regionD;
    final regionE = widget.region == null ? '' : widget.region!.regionE;
    final regionF = widget.region == null ? '' : widget.region!.regionF;
    final regionG = widget.region == null ? '' : widget.region!.regionG;

    setState(() {
      controllerRegionA = TextEditingController(text: regionA);
      controllerRegionB = TextEditingController(text: regionB);
      controllerRegionC = TextEditingController(text: regionC);
      controllerRegionD = TextEditingController(text: regionD);
      controllerRegionE = TextEditingController(text: regionE);
      controllerRegionF = TextEditingController(text: regionF);
      controllerRegionG = TextEditingController(text: regionG);
    });
  }

  @override
  Widget build(BuildContext context) => Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildRegionA(),
            const SizedBox(height: 10),
            buildRegionB(),
            const SizedBox(height: 10),
            buildRegionC(),
            const SizedBox(height: 10),
            buildRegionD(),
            const SizedBox(height: 10),
            buildRegionE(),
            const SizedBox(height: 10),
            buildRegionF(),
            const SizedBox(height: 10),
            buildRegionG(),
            const SizedBox(height: 15),
            buildSubmit(),
          ],
        ),
      );

  Widget buildRegionA() => TextFormField(
        controller: controllerRegionA,
        decoration: InputDecoration(
            labelText: 'Input Region A',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            suffixIcon: Icon(Icons.location_pin, color: Colors.green)),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter Region' : null,
      );
  Widget buildRegionB() => TextFormField(
        controller: controllerRegionB,
        decoration: InputDecoration(
            labelText: 'Input Region B',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            suffixIcon: Icon(Icons.location_pin, color: Colors.green)),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter Region' : null,
      );

  Widget buildRegionC() => TextFormField(
        controller: controllerRegionC,
        decoration: InputDecoration(
            labelText: 'Input Region C',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            suffixIcon: Icon(Icons.location_pin, color: Colors.green)),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter Region' : null,
      );

  Widget buildRegionD() => TextFormField(
        controller: controllerRegionD,
        decoration: InputDecoration(
            labelText: 'Input Region D',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            suffixIcon: Icon(Icons.location_pin, color: Colors.green)),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter Region' : null,
      );

  Widget buildRegionE() => TextFormField(
        controller: controllerRegionE,
        decoration: InputDecoration(
            labelText: 'Input Region E',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            suffixIcon: Icon(Icons.location_pin, color: Colors.green)),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter Region' : null,
      );

  Widget buildRegionF() => TextFormField(
        controller: controllerRegionF,
        decoration: InputDecoration(
            labelText: 'Input Region F',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            suffixIcon: Icon(Icons.location_pin, color: Colors.green)),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter Region' : null,
      );

  Widget buildRegionG() => TextFormField(
        controller: controllerRegionG,
        decoration: InputDecoration(
            labelText: 'Input Region RBN',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            suffixIcon: Icon(
              Icons.location_pin,
              color: Colors.green,
            )),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter Region' : null,
      );

  Widget buildSubmit() => ButtonWidget(
        text: 'Save',
        onClicked: () {
          final form = formKey.currentState!;
          final isValid = form.validate();

          if (isValid) {
            final id = widget.region == null ? null : widget.region!.id;
            final region = Region(
              id: id,
              regionA: controllerRegionA.text,
              regionB: controllerRegionB.text,
              regionC: controllerRegionC.text,
              regionD: controllerRegionD.text,
              regionE: controllerRegionE.text,
              regionF: controllerRegionF.text,
              regionG: controllerRegionG.text,
            );
            widget.onSavedRegion(region);
          }
        },
      );
}
