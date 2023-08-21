import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AllOthers/adaptive.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/Lists/relationList.dart';

class Parents extends StatefulWidget {
  const Parents({Key? key}) : super(key: key);

  @override
  State<Parents> createState() => _ParentsState();
}

class _ParentsState extends State<Parents> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Gap(30.h),
          RelationList(
            list: ["", ""],
          ),
          Gap(20.h),
          Adaptive(
            first: SuggestTextForm(
                title: "Situation Matrimoniale",
                list: [
                  "En couple",
                  "Divorcés",
                ],
                onChanged: (value) {},
                onFieldSubmitted: (value) {}),
            second: SuggestTextForm(
                title: "État Matrimoniale",
                list: ["Polygamie", "Monogamie", "Poluandrie"],
                onChanged: (value) {},
                onFieldSubmitted: (value) {}),
          ),
          Gap(20.h),
          BigTextForm(title: "Commentaire", onFieldSubmitted: (value) {}),
        ],
      ),
    );
  }
}
