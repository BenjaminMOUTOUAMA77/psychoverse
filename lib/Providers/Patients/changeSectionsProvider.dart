import 'package:fluent_ui/fluent_ui.dart';

class ChangeSectionsProvider extends ChangeNotifier{
  static bool _mode=false;
  static List<int> _selected=[0];
  static int _selectedMenuNum=0;

  List<int> get slected => _selected;
  int get selectedMenuNum => _selectedMenuNum;
  bool get mode => _mode;

  setSelected(List<int> value){
    _selected=value;
    notifyListeners();
  }

  setSelectedNum(int value){
    _selectedMenuNum=value;
    notifyListeners();
  }

  setMode(bool value){
    _mode=value;
    notifyListeners();
  }
}