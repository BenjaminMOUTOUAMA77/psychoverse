import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/TilesGroupe/relationTilesGroupe.dart';

class ParentsPopUp extends StatefulWidget {
  const ParentsPopUp({Key? key}) : super(key: key);

  @override
  State<ParentsPopUp> createState() => _ParentsPopUpState();
}

class _ParentsPopUpState extends State<ParentsPopUp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(30.h),
        RelationTilesGroupe(list: ["",""],),
        Gap(20.h),
        AdaptiveLayout(
          mediumLayout: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: SuggestTextForm(title: "Situation Matrimoniale",list: ["En couple","Divorcés",],onChanged: (value){}, onFieldSubmitted: (value){})),
              Gap(20.w),
              Expanded(child: SuggestTextForm(title: "État Matrimoniale",list: ["Polygamie","Monogamie","Poluandrie"],onChanged: (value){}, onFieldSubmitted: (value){})),
            ],
          ),
          smallLayout: Column(
            children: [
              SuggestTextForm(title: "Situation Matrimoniale",list: ["En couple","Divorcés",],onChanged: (value){}, onFieldSubmitted: (value){}),
              Gap(20.h),
              SuggestTextForm(title: "État Matrimoniale",list: ["Polygamie","Monogamie","Poluandrie"],onChanged: (value){}, onFieldSubmitted: (value){}),
            ],
          ),
        ),
        Gap(20.h),
        BigTextForm(title: "Commentaire", onFieldSubmitted: (value) {}),
      ],
    );
  }
}
