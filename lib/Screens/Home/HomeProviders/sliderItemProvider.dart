import 'package:fluent_ui/fluent_ui.dart';

class SliderItemProvider extends ChangeNotifier{
  static int _currentSlide=0;

  int get slide => _currentSlide;

  set(int slide){
    _currentSlide=slide;
    notifyListeners();
  }
}