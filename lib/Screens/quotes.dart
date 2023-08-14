import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/PopUps/bigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/quotePopUp.dart';
import 'package:psychoverse/Ui/Components/TilesGroupe/quotesTilesGroupe.dart';
import 'package:psychoverse/Ui/Components/ZElements/backgroungImage.dart';
import 'package:psychoverse/Ui/Components/AppNav/appNavBar.dart';

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MakeBackgroundImage(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            children: [
              Gap(20.h),
              AppNavBar(
                links: [NavLink(title: "Quotes", function: () {})],
              ),
              Gap(50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SimpleAppButon(
                      texte: "Ajouter une citation", function: () {
                        showDialog(context: context, builder: (context)=>BigPopUp(title: "Nouvelle pensée",save: true,child: QuotePopUp(),));
                  }),
                ],
              ),
              Gap(20.h),
              Expanded(
                child: QuotesTilesGroupe(list: ["","","","","","","",],),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
