import 'package:fluent_ui/fluent_ui.dart';

class MainScreenPagesManagerProvider extends ChangeNotifier{
  int _currentPage = 0;

  int get page => _currentPage;

  set(int page){
    _currentPage=page;
    notifyListeners();
  }
}

class ChangePatientPageProvider extends ChangeNotifier{
  static int _activePage = 0;
  static PageController _controller = PageController(
    initialPage: _activePage,
  );

  int get activePage => _activePage;
  PageController get pageController => _controller;

  jump(int page){
    _activePage = page;
    _controller.jumpToPage(_activePage);
    _controller = PageController(
      initialPage: activePage,
    );
    notifyListeners();
  }

}