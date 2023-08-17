import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class SuiviBoxList extends StatefulWidget {
  List<String> list;
  int uiKey;
  int suiviUiKey;
  String texte;
  SuiviBoxList({Key? key,this.list=const[],this.uiKey=0,this.suiviUiKey=0,this.texte="Nom du Suivi Nom du Suivi"}) : super(key: key);

  @override
  State<SuiviBoxList> createState() => _SuiviBoxListState();
}

class _SuiviBoxListState extends State<SuiviBoxList> {
  @override
  Widget build(BuildContext context) {
    ChangeSectionsProvider page = Provider.of<ChangeSectionsProvider>(context) ;
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 9 / 4,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
        ),
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w,),
            decoration: BoxDecoration(
              color: getColor().withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                AppDesignEffects.shadow1,
              ],
            ),
            child: Tooltip(
              message: widget.texte,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    page.setSuiviPage(1, widget.uiKey, widget.suiviUiKey);
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w,vertical:30.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.blancGrise,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FluentIcons.dataverse,size: 40.h,color: AppColors.rouge,),
                      Gap(15.h),
                      Text(widget.texte,style: AppTextStyle.buttonStyleTexte.copyWith(color:AppColors.primary,fontWeight: FontWeight.w800),overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
