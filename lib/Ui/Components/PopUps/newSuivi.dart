import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';

class NewSuivi extends StatefulWidget {
  const NewSuivi({Key? key}) : super(key: key);

  @override
  State<NewSuivi> createState() => _NewSuiviState();
}

class _NewSuiviState extends State<NewSuivi> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        children: [
          TextForm(
            title: "Pseudonyme",
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
          ),
          SuggestTextForm(
            title: "Type de Suivi",
            list: ["Masculin", "Féminin", "Trans", "Autre"],
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
          ),
          TextForm(
              title: "Sujet",
              onChanged: (value) {},
              onFieldSubmitted: (value) {}),
        ],
      ),
    );
  }
}
