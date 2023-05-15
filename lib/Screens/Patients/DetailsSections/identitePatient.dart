import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/bloc1.dart';
import 'package:psychoverse/Ui/Components/bloc2.dart';
import 'package:psychoverse/Ui/Components/texteForm.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class Identite extends StatefulWidget {
  const Identite({Key? key}) : super(key: key);

  @override
  State<Identite> createState() => _IdentiteState();
}

class _IdentiteState extends State<Identite> {
  @override
  Widget build(BuildContext context) {
    return Bloc1(
      icon: FluentIcons.user_clapper,
      title: "Identité",
      number: 10,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Bloc2(
            body: Column(
              children: [
                AppTextForm(title: "Nom Prénom",initialValue: "Prosper ONACHOUKOU",onChanged: (value){}, onSaved: (value){}, onFieldSubmitted: (value){}, validator: (value){}),
                AppTextForm(onChanged: (value){}, onSaved: (value){}, onFieldSubmitted: (value){}, validator: (value){}),
                AppTextForm(onChanged: (value){}, onSaved: (value){}, onFieldSubmitted: (value){}, validator: (value){}),
                AppTextForm(onChanged: (value){}, onSaved: (value){}, onFieldSubmitted: (value){}, validator: (value){}),
                AppTextForm(onChanged: (value){}, onSaved: (value){}, onFieldSubmitted: (value){}, validator: (value){}),
                AppTextForm(onChanged: (value){}, onSaved: (value){}, onFieldSubmitted: (value){}, validator: (value){}),
                AppTextForm(onChanged: (value){}, onSaved: (value){}, onFieldSubmitted: (value){}, validator: (value){}),
                AppTextForm(onChanged: (value){}, onSaved: (value){}, onFieldSubmitted: (value){}, validator: (value){}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
