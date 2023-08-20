import 'package:fluent_ui/fluent_ui.dart';

class MainScreenPagesManagerProvider extends ChangeNotifier{
  int _currentPage = 0;
  PaneDisplayMode _displayMode=PaneDisplayMode.auto;

  int get page => _currentPage;
  setPage(int page){
    _currentPage=page;
    notifyListeners();
  }

  PaneDisplayMode get displayMode => _displayMode;
  setDisplayMode(PaneDisplayMode displayMode){
    _displayMode=displayMode;
    notifyListeners();
  }

}