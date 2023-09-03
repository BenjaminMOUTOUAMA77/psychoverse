import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class AttributAbonnementTile extends StatefulWidget {
  IconData icon;
  String texte;
  bool active;
  AttributAbonnementTile({Key? key,this.icon= FluentIcons.double_chevron_right8,this.texte="Texte",this.active=false}) : super(key: key);

  @override
  State<AttributAbonnementTile> createState() => _AttributAbonnementTileState();
}

class _AttributAbonnementTileState extends State<AttributAbonnementTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Icon(widget.icon,color: AppColors.secondary,),
          Gap(20.w),
          Expanded(child: Text(widget.texte,style: AppTextStyle.filedTexte,)),
          Gap(20.w),
          widget.active?Icon(FluentIcons.skype_check,color: Colors.green,):Icon(FluentIcons.cancel,color: AppColors.secondary,),
        ],
      ),
    );
  }
}
