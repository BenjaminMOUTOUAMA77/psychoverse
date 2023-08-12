import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/ArchitectureProvider/changeScreenProviderArchitecture.dart';
import 'package:psychoverse/Screens/Architecture/Sections/Formulaire/architectureFormulaires.dart';
import 'package:psychoverse/Screens/Architecture/Sections/contacter.dart';
import 'package:psychoverse/Screens/Architecture/Sections/histotiqueArchitecture.dart';
import 'package:psychoverse/Screens/Architecture/Sections/identiteArchitecture.dart';
import 'package:psychoverse/Screens/Architecture/Sections/suivisArchitecture.dart';
import 'package:psychoverse/Screens/Architecture/Sections/testesArchitecture.dart';
import 'package:psychoverse/Ui/Components/Buttons/togleButton.dart';
import 'package:psychoverse/Ui/Components/PopUps/bigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/brouillonPopUp.dart';
import 'package:psychoverse/Ui/Components/appNav/appNavMenuPane.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class Architecture extends StatefulWidget {
  const Architecture({Key? key}) : super(key: key);

  @override
  State<Architecture> createState() => _ArchitectureState();
}

class _ArchitectureState extends State<Architecture> {
  @override
  Widget build(BuildContext context) {

    late ChangeSectionsProviderArchitecture sections;
    List<AppNavMenuPane> menu = [
      AppNavMenuPane(
        title: "Identité",
        body: IdentiteArchitecture(),
      ),
      AppNavMenuPane(
        title: "Historique",
        body: HistoriqueArchitecture(),
      ),
      AppNavMenuPane(
        title: "Suivis",
        body: SuivisArchitecture(),
      ),
      AppNavMenuPane(
        title: "Testes",
        body: TextesArchitecture(),
      ),
      AppNavMenuPane(
        title: "Formulaire",
        body: ArchitectureFormulaires(),
      ),
      AppNavMenuPane(
        title: "Rappel",
        body: ContacterArchitecture(),
      ),
    ];
    List<String> getTitles() {
      List<String> list = [];
      for (var i in menu) {
        list.add(i.title);
      }
      return list;
    }

    List<Widget> getBodys() {
      List<Widget> list = [];
      for (var i in menu) {
        list.add(i.body);
      }
      return list;
    }

    late List<Widget> bodys;

    sections = Provider.of<ChangeSectionsProviderArchitecture>(context);
    bodys = getBodys();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          Gap(50.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(context: context, builder: (context)=>BigPopUp(title: "Brouillon",child: BrouillonPopUp(),),);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.rouge,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      AppDesignEffects.shadow0,
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(FluentIcons.text_document_edit,color: AppColors.blanc,),
                      Gap(10),
                      Text("Brouillon",style: AppTextStyle.filedTexte.copyWith(fontWeight: FontWeight.bold,color: AppColors.blanc),),
                    ],
                  ),
                ),
              ),
              Gap(50.w),
              Expanded(
                child: MakeToggleMenu(
                  type: 2,
                  menu: getTitles(),
                  selectedMenuNums: sections.selectedMenuNums,
                  mode: sections.mode,
                  selectedMenuNum: sections.selectedMenuNum,
                  onChanged: (
                      {mode = true,
                        menu = const [],
                        selectedMenuNums = const [2, 4],
                        selectedMenuNum = 0,
                        getSelectedOnString = const []}) {
                    setState(() {
                      sections.mode=mode;
                      if (mode) {
                        sections.selectedMenuNums=selectedMenuNums;
                      } else {
                        sections.selectedMenuNum=selectedMenuNum;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          Gap(20.h),
          Expanded(
            child: sections.mode
                ? SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: List.generate(
                  bodys.length,
                      (i) => Visibility(
                    visible:
                    sections.selectedMenuNums.contains(i)
                        ? true
                        : false,
                    child: bodys[i],
                  ),
                ),
              ),
            )
                : bodys[sections.selectedMenuNum],
          ),
        ],
      ),
    );
  }
}
