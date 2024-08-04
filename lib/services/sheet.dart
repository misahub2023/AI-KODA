import 'package:hive/hive.dart';
import 'package:koda_new_res/models/dataset.dart';
import 'package:gsheets/gsheets.dart';

class DataSheetApi {
  static const credentials = r'''
{
  "type": "service_account",
  "project_id": "inner-radius-376716",
  "private_key_id": "31183428642676d2afca34f1c91eb88cb202461c",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCz5hBz4ApbsQGW\nIW8Ljx2TD5qbu+QE2pwhAKpYFpEHRvAc9AI4vs4zPn3AuFVAfLXn6IMt+lhNTDrf\nNiXkUUdUOExEr5ydzpMI6YKl/zYwXv9maS6KHatwUJ80KrHuKUkP8hhv9qrY6SSR\ncYHvEBtsaQ5m2sOIXVmBXHEEG4yQU5mLSmZIt3aZosXAIEs4gGNFal9T3QCwvdzl\nxcDm4BDBc1rPRDyvsqfvI6m/Ye80jvjvHSM8gDzaotKX7ETzqeUi1RSeMKPZWIft\nBfG7H8V3+i7zo+ety0KB/4Fr59HVx2kXFobUgFiFiFPbi+WEjQctjZWNWI4VO2VY\noiN3maqdAgMBAAECggEAAayKivwoNy81Tmd+6DLLjyfuLonNNuBZOJNlgmP/XdEi\nqy+iv6gYNMYy7F1VacAJ/0pHbODvURTRrWxhu4yoEcK5BEtFX/s2nLbI4PDi2Qi2\nmVuG3oElLGqLo17MVg+AnwsygAQ3FcVMR6WF6dVoCUEMVxetCcf4l767odKnIwao\nHiJVkQK2ymZuTR22Awq0h1Vwgg5Se7EnUxqOK2xl60LFz7b5XPhF2/NjuE/Of96e\n+f5bGyUh1Dw8zKsLd1m5L4yCG+6V7FomtJYVPLgVfaxagKEj+jB/90F/YVf0+8kt\neztsRG4x3ssq6fnm6iYviwAOKzkBRtOXstE+EKoNjwKBgQDmzYjn1BQbZk1dhHG9\n2+ezd4/VS02V0Is7E/NfebG3kj34C2T0ATkCqlpbt8uZIN7n+b6d8Io06VA9WE8p\nW5vuZe0GM+Qit3Lw1sS+Ko4MJ9tz83xgC5Cq+Yy2bOSpS2/Yv8dCs0RkTHAJndxx\nnWZlvCxOIXHUaCEMbJf410guLwKBgQDHidzEEMBD2rxPci3VdXuNS5fcCKGpawUU\nCJWbS8eRFtmzuCNlh8w0mhvKjUc3N/LgfrW5fWVa+eZ5KZH/O3tfgBiLm1UH6PwG\nTPxcTBRCZ8NsTDc6HU5ToU0YTbiCRdlgLGRBdneB5+uQxlVQervaqm4C8xHS3Tkw\n8K6h4oZs8wKBgAgBPutTdrMQlERXEJ7WHq4hynJKX1F/3yRYZ8t67AgC4XVV59Vy\nqWiHQgUGVeBkvHZtOgg+THzTTr4h7vTvQXQ+Qr9BU3tEw47I1CAIV87iHwFhg4HN\nROI5L4EwO6oHfMSWujF9CDU2VXhv6jJilCeZJCw9irYkOmk05vxxcwZvAoGBAJTm\nSqjAu0inTIiYcp1siuM4er0Gb+Sl6Oc3NLTrSqP5gkE7cqaMPJUwPvbakD8jcAmY\nZHFjoqPOAe9+VuU4dOsiAq8DHePGN3NYNaWGXEPlfI4vHbMvNUjxAD/Xl40XJIxA\n9BtplOqKr12cswNYYyBct7VZv34z+T6NDDPff2KDAoGAaYKvcHRhnbEu2Gr8TwV0\nSmtRRTWFKC7BoK5EnZG3xaQpov7JS0hl00GUPYzT0JFSKRO/mLujXQyClTZFytHT\nlOznhjegWZq7NTsU1kqnriGuJmxtxEx7gDVfSrAL+9nIcPRA7CPRlckl0GazNwEc\n1xiSBtkDZc21pn8y71ZbhF8=\n-----END PRIVATE KEY-----\n",
  "client_email": "demo-565@inner-radius-376716.iam.gserviceaccount.com",
  "client_id": "111093443031907966509",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/demo-565%40inner-radius-376716.iam.gserviceaccount.com"
}
''';
  static const spreadsheetId = '1DXGDx5pDGBH9De7IRuWp5gDVqgQwgok7triqUiJ_2Kg';

  static final gsheets = GSheets(credentials);

  static Worksheet? dataSheet;

  //static final progress = Hive.box('user_progress');

  static Future init() async {
    try {
      final spreadsheet = await gsheets.spreadsheet(spreadsheetId);
      dataSheet = await getWorksheet(spreadsheet, 'Sheet 1');

      final firstRow = DataSet.getFields();
      dataSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('init error: $e');
    }
  }

  static Future<Worksheet> getWorksheet(
      Spreadsheet spreadsheet, String title) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList, int index) async {
    dataSheet!.values.map.appendRows(rowList);
    //await progress.add(index);
  }

  static Future deleteByImagePath(String imagePath) async {
    if (dataSheet == null) return false;

    final index = await dataSheet!.values.rowIndexOf(imagePath);
    if (index == -1) return false;

    return dataSheet!.deleteRow(index);
  }
}
