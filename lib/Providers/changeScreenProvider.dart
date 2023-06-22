import 'package:fluent_ui/fluent_ui.dart';

class MainScreenPagesManagerProvider extends ChangeNotifier{
  int _currentPage = 0;

  int get page => _currentPage;

  set(int page){
    _currentPage=page;
    notifyListeners();
  }
}