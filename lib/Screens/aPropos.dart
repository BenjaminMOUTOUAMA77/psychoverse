import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AllOthers/backgroungImage.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer2.dart';
import 'package:psychoverse/Ui/Components/Titres/pageTitle.dart';


class APropos extends StatefulWidget {
  const APropos({Key? key}) : super(key: key);

  @override
  State<APropos> createState() => _AProposState();
}

class _AProposState extends State<APropos> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MakeBackgroundImage(),
        Column(
          children: [
            Gap(20.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PageTitle(title: "À Propos",icon: FluentIcons.waffle_office365,),
                    AppContainer2(
                      title: "Paramètre de sauvegarde automatique",
                      child: Column(
                        children: [
                        ],
                      ),
                    ),
                    AppContainer2(
                      title: "Paramètre de sauvegarde Manuelle",
                      child: Column(
                        children: [
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
