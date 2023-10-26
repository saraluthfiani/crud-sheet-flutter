import 'dart:convert';

class RegionFields {
  static const String id = 'id';
  static final String regionA = 'Region1';
  static final String regionB = 'Region2';
  static final String regionC = 'Region3';
  static final String regionD = 'Region4';
  static final String regionE = 'Region5';
  static final String regionF = 'Region6';
  static final String regionG = 'RBN';

  static List<String> getFields() =>
      [id, regionA, regionB, regionC, regionD, regionE, regionF, regionG];
}

class Region {
  final int? id;
  final String regionA;
  final String regionB;
  final String regionC;
  final String regionD;
  final String regionE;
  final String regionF;
  final String regionG;

  const Region({
    this.id,
    required this.regionA,
    required this.regionB,
    required this.regionC,
    required this.regionD,
    required this.regionE,
    required this.regionF,
    required this.regionG,
  });

  Region copy({
    int? id,
    String? regionA,
    String? regionB,
    String? regionC,
    String? regionD,
    String? regionE,
    String? regionF,
    String? regionG,
  }) =>
      Region(
        id: id ?? this.id,
        regionA: regionA ?? this.regionA,
        regionB: regionB ?? this.regionB,
        regionC: regionC ?? this.regionC,
        regionD: regionD ?? this.regionD,
        regionE: regionE ?? this.regionE,
        regionF: regionF ?? this.regionF,
        regionG: regionG ?? this.regionG,
      );

  static Region fromJson(Map<String, dynamic> json) => Region(
        id: jsonDecode(json[RegionFields.id]),
        regionA: json[RegionFields.regionA],
        regionB: json[RegionFields.regionB],
        regionC: json[RegionFields.regionC],
        regionD: json[RegionFields.regionD],
        regionE: json[RegionFields.regionE],
        regionF: json[RegionFields.regionF],
        regionG: json[RegionFields.regionG],
      );

  Map<String, dynamic> toJson() => {
        RegionFields.id: id,
        RegionFields.regionA: regionA,
        RegionFields.regionB: regionB,
        RegionFields.regionC: regionC,
        RegionFields.regionD: regionD,
        RegionFields.regionE: regionE,
        RegionFields.regionF: regionF,
        RegionFields.regionG: regionG,
      };
}
