import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/changeScreenProvider.dart';
import 'package:psychoverse/Ui/Components/AllOthers/backgroungImage.dart';
import 'package:psychoverse/Ui/Components/Blocs/bloc2.dart';
import 'package:psychoverse/Ui/Components/Forms/switchForm.dart';

class Parametre extends StatefulWidget {
  const Parametre({Key? key}) : super(key: key);

  @override
  State<Parametre> createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
  @override
  Widget build(BuildContext context) {
    MainScreenPagesManagerProvider pagesManager = Provider.of<MainScreenPagesManagerProvider>(context);
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
                    Bloc2(
                      title: "Paramètre d'affichage",
                      child: Column(
                        children: [
                          SwitchForm(
                            isChecked: pagesManager.displayMode == PaneDisplayMode.auto?false:true,
                            checkedTexte: "Menu Horizontal",
                            unCheckedTexte: "Menu Vertical",
                            onChanged: (value){
                              if(value){
                                pagesManager.setDisplayMode(PaneDisplayMode.top);
                              }else{
                                pagesManager.setDisplayMode(PaneDisplayMode.auto);
                              }
                            },
                          ),
                          Gap(20.h),
                          SwitchForm(
                            isChecked: false,
                            checkedTexte: "Mode Sombre",
                            unCheckedTexte: "Mode Claire",
                            onChanged: (value){},
                          ),
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
