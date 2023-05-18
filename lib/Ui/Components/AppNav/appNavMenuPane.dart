import 'package:fluent_ui/fluent_ui.dart';

class AppNavMenuPane{
  String title;
  Widget body;

  AppNavMenuPane({this.title="Titre",this.body= const Text("Body"),});

  String get getTitle=>title;
  Widget get getBody=>body;

  setTitle(String value)=>title=value;
  setBody(Widget value)=>body=value;
}