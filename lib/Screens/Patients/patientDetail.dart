import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Models/patient.dart';
import 'package:psychoverse/Providers/changeScreenProvider.dart';
import 'package:psychoverse/Ui/Components/appNavBar.dart';
import 'package:psychoverse/Ui/Components/togleButton.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class PatientDetail extends StatefulWidget {
  final Patient? patient;
  const PatientDetail({Key? key, this.patient}) : super(key: key);

  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  @override
  Widget build(BuildContext context) {
    ChangePatientPageProvider page =
        Provider.of<ChangePatientPageProvider>(context);
    List<int> selected=[];


    late MakeToggleMenu myToglemenu;
    changeSections(List<int> balue){
      setState(() {
        selected=myToglemenu.getSelectedMenuNums;
      });
    }
    myToglemenu =MakeToggleMenu(
      type: 2,
      menu: [
        "Identité",
        "Historique",
        "Suivis",
        "Testes",
        "Relations",
        "SMS",
      ],
      selectedMenuNums: [0],
      onChanged: (
          {mode = true,
            menu = const [],
            selectedMenuNums = const [2,4],
            selectedMenuNum = 0,
            getSelectedOnString = const []}) {
        print("Mode = " + mode.toString());
        print("menu = " + menu.toString());
        print("selectedMenuNums = " + selectedMenuNums.toString());
        print("selectedMenuNum = " + selectedMenuNum.toString());
        print("getSelectedOnString = " +
            getSelectedOnString.toString());
        print(
            "*********************************************************************");
      },
    );
    
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 50.h),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(20.h),
            AppNavBar(
              links: [
                NavLink(
                    title: "Dossiers",
                    function: () {
                      page.jump(0);
                    }),
                NavLink(title: "TOUMOUDAGOU Jeanne", function: () {})
              ],
            ),
            Gap(20.h),
            Row(
              children: [
                GestureDetector(
                  child: Container(
                    child: Row(
                      children: [
                        Icon(FluentIcons.sad_solid),
                        Gap(10.w),
                        Text("Unsaved"),
                      ],
                    ),
                  ),
                ),
                Gap(50.w),
                Expanded(
                    child: myToglemenu,),
              ],
            ),
            Gap(20.h),
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(20.h),
                  Visibility(
                    visible: selected.contains(0)? true:false,
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Identité",style: AppTextStyle.buttonStyleTexte,),
                    ),
                  ),
                  Gap(20.h),
                  Visibility(
                    visible: selected.contains(1)? true:false,
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Historique",style: AppTextStyle.buttonStyleTexte,),
                    ),
                  ),
                  Gap(20.h),
                  Visibility(
                    visible: selected.contains(2)? true:false,
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Testes",style: AppTextStyle.buttonStyleTexte,),
                    ),
                  ),
                  Gap(20.h),
                  Visibility(
                    visible: selected.contains(3)? true:false,
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Relations",style: AppTextStyle.buttonStyleTexte,),
                    ),
                  ),
                  Gap(20.h),
                  Visibility(
                    visible: selected.contains(4)? true:false,
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("SMS",style: AppTextStyle.buttonStyleTexte,),
                    ),
                  ),
                ],
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
