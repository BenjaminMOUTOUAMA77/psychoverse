import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Functions/appPaths.dart';

class MyAppPathProvider extends ChangeNotifier{
  static String _appPath="";
  static String _appFilesPath="";

  String get appPath => _appPath;

  set appPath(String value) {
    _appPath = value;
    notifyListeners();
  }

  String get appFilesPath => _appFilesPath;

  set appFilesPath(String value) {
    _appFilesPath = value;
    notifyListeners();
  }

  init() async {
    _appPath = await  getAppPath();
    notifyListeners();
    _appFilesPath = await getAppPath(appFilesDirectory: true);
    notifyListeners();
  }

}
