import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Models/asm.dart';
import 'package:psychoverse/Models/users.dart';

class UserProvider extends ChangeNotifier{
  static Users _user=Users();
  static Asm _asm=Asm();

  Users get user => _user;

  set user(Users value) {
    _user = value;
    notifyListeners();
  }

  Asm get asm => _asm;

  set asm(Asm value) {
    _asm = value;
    notifyListeners();
  }
}
