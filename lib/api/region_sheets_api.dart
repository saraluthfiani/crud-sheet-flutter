import 'package:flutter_application/model/region.dart';
import 'package:gsheets/gsheets.dart';

class RegionSheetsApi {
  static const _credentials = r''' {
  "type": "service_account",
  "project_id": "regions-402220",
  "private_key_id": "df0fa8270ab4e411a75e4b2e9a01ea947b5b9ca8",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDqz2uUQefq6DgN\n6zkAuF2D0hEHUEHktZyEPALRYomcRbi3WJ3yS/03LpAaw6yF4liiPREKATqFSpHF\nMI9KvZlZSLrYbrdGEsVyR9zH0j4/juiB4wHEoGtSujEPop06eg4Cy2TEArI6lhBO\nAYKc0+WPHZYQLorquCdIi0Fgu/9niORK3q6O85a+JFCc0esVj3UgltFUK+x/ZwZc\nKs5exnvp5gBh9sxVs0Pjx6523n6XLft5Rt7Fstf7jX10YZG9MrMOD0G5GSQVeR1u\nYI5WLUk8ObSf668n6wAtkZJLYiF+j1TKFbW0zOA9fW0L0f8isZ93NliDFxz8Twmu\nkSozei5DAgMBAAECggEANVWj0+scaIkSoma5beZyp0yBva2HKhHuWULgSPse0rYr\nfMnOJokIHQ6ggNPNTiPZihBg3GrnBfuoHKgpBAsI1/TjK+IKEwqUep7EEUc6CGnH\neik775OYjRPprOl82Rl8MTpNyw/pt9D6Jx3EsyaWT+miek54E1R858dptDU/kB5i\nc6hF/j9JvcK4s9NPYcSUxZs94kpEEBGjaydRBLk9V1kFntjeDlJnu7kwxga/i1Sg\nabcMcQH3F0vAQYkGz8bHkUETP+bP2DcrQTK7gwB/K5ic4xhOHFIP8XqKF5RaFGPq\nvs4J/p+IESyK4Q5RqYYovJUHeJX2/EIZryEzWpw+MQKBgQD/WZi4Rv0hEHP2YZPR\nX8ZG/oUyVz/siX/ofe4FBmp7SlkCHfXtNO0vHiWXC/1suKNjIVgmqiLSxCdGDN6v\nd+nwAKv/6LNIWZsucwmcsmAEvxWqYKV9COThnYR+/ARxlo87r8MSvjdzGDnBDJEi\nreTTJTk18qctqriLA9iJuvUhfwKBgQDraHBGCJXp8vOwe+eK4nca5zgeFaYsJuuh\nlhlbYm6/F1dju3t5KV1QV2qjfH9cm5JoOCk4z9GBmbgnAqTTVFsspL918I5Pl5Ak\nSY2wKCcRuHm1gOnKcdfsN3nxMDspIopPmyboOQrfW7wwqhsVWQvocUH1PRL5JtnX\nNlBv1wJNPQKBgQDeDmxg1FsMheJSQEjrqv4ifvQV8woECQ7Sf7CdbhbrYJxG2wci\nYQRiFTVbRXH9OhPcAQNHnGzsHOiKYmbE8OLfc7YftZ0zLblli2Swf+5AMmwE3kcL\nlNB14yV1yHOU0/l7Tj217vUJgee3mdYc8lwrwhMedwYrEGureIy2OX8ywQKBgAJn\nLYY5fjZGKaCqkyGC0E5w/8ym0exvdUZP/vBE3/aJaXX2KvuApZg1XDxRAAfU+rif\noiQXUv8sr4mOaFpT6R5ajC3LB9jeJjWInq6mqkdvB6cHqttLMDYUFuWUZXY1CQ5o\n+guy0V6YVCJ3ChG8t/dmeJLlTbVHZT/iKQ4LNtXNAoGAJB/2neeC+GiL/7slCFvH\nJegywr50jeWYa1hObf+wspSSg9DYtJlzE5hVuGf4ifzlVRaX7q6pdHkCgc9eBrWD\nInLufWPEP0HpVqL/jyqFXxlA1pbdqHBrefBntGzy0qNP5JN6+nZLHp3xeCqbXARl\nUY4M5b4dU3RV94kRCl3mtKs=\n-----END PRIVATE KEY-----\n",
  "client_email": "regions@regions-402220.iam.gserviceaccount.com",
  "client_id": "103089457551188369160",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/regions%40regions-402220.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';
  static const _spreadsheetId = '1JIm-2QEJrRAU4X2715UkB4vchnw6ln23GojNc908k8Q';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _regionSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _regionSheet = await _getWorkSheet(spreadsheet, title: 'Regions');

      final firstRow = RegionFields.getFields();
      _regionSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future<int> getRowCount() async {
    if (_regionSheet == null) return 0;
    final lastRow = await _regionSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }

  static Future<List<Region>> getAll() async {
    if (_regionSheet == null) return <Region>[];

    final regions = await _regionSheet!.values.map.allRows();
    return regions == null ? <Region>[] : regions.map(Region.fromJson).toList();
  }

  static Future<Region?> getRegionById(int id) async {
    if (_regionSheet == null) return null;
    final json = await _regionSheet!.values.map.rowByKey(id, fromColumn: 1);
    return json == null ? null : Region.fromJson(json);
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_regionSheet == null) return;

    _regionSheet!.values.map.appendRows(rowList);
  }

  static Future<bool> update(
    int id,
    Map<String, dynamic> region,
  ) async {
    if (_regionSheet == null) return false;
    return _regionSheet!.values.map.insertRowByKey(id, region);
  }

  static Future<bool> updateCell({
    required int id,
    required String key,
    required dynamic value,
  }) async {
    if (_regionSheet == null) return false;

    return _regionSheet!.values.insertValueByKeys(
      value,
      columnKey: key,
      rowKey: id,
    );
  }

  static Future<bool> deleteById(int id) async {
    if (_regionSheet == null) return false;

    final index = await _regionSheet!.values.rowIndexOf(id);

    if (index == -1) return false;

    return _regionSheet!.deleteRow(index);
  }
}
