import 'package:fluent_ui/fluent_ui.dart';

class ChangeSectionsProviderArchitecture extends ChangeNotifier{
  bool _mode=false;
  List<int> _selectedMenuNums=[0];
  int _selectedMenuNum=0;

  bool get mode => _mode;

  set mode(bool value) {
    _mode = value;
    notifyListeners();
  }

  List<int> get selectedMenuNums => _selectedMenuNums;

  set selectedMenuNums(List<int> value) {
    _selectedMenuNums = value;
    notifyListeners();
  }

  int get selectedMenuNum => _selectedMenuNum;

  set selectedMenuNum(int value) {
    _selectedMenuNum = value;
    notifyListeners();
  }
}