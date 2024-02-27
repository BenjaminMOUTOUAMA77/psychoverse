import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Models/asm.dart';
import 'package:psychoverse/Models/users.dart';

class UserProvider extends ChangeNotifier{
  static App_users _user=App_users();
  static Asm _asm=Asm();

  App_users get user => _user;

  set user(App_users value) {
    _user = value;
    notifyListeners();
  }

  Asm get asm => _asm;

  set asm(Asm value) {
    _asm = value;
    notifyListeners();
  }
}
