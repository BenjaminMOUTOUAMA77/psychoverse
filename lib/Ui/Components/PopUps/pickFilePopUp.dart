import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Functions/pickFiles.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Buttons/smallButton.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';
import 'package:file_sizes/file_sizes.dart';

class PickFilePopUp extends StatefulWidget {
  String image;
  PlatformFile file;
  PickFilePopUp({Key? key,this.image="assets/images/im4.jpg",required this.file}) : super(key: key);

  @override
  State<PickFilePopUp> createState() => _PickFilePopUpState();
}

class _PickFilePopUpState extends State<PickFilePopUp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 100+50.h,
          child: Image.asset(widget.image),
        ),
        Gap(40.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(FluentIcons.file_image,color: AppColors.rouge,size: 30.h,),
            Gap(20.h),
            Expanded(
              child: Column(
                children: [
                  Text(widget.file.name, style: AppTextStyle.bigFilledTexte.copyWith(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
        ],),
        Gap(20.h),
        Row(children: [
          Text("Taille du fichier :", style: AppTextStyle.filedTexte.copyWith(fontWeight: FontWeight.bold),),
          Gap(20.w),
          Text(FileSize.getSize(widget.file.size).toString(),style: AppTextStyle.filedTexte,),
        ],),
        Gap(20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SimpleAppButon(function: (){},texte: "OK",icon: FluentIcons.to_do_logo_inverse,),
            Gap(40.w),
            SmallAppButton(function: (){
              Navigator.pop(context);
              pickFile(context);
            },texte: "Modifier",)
          ],
        ),
      ],
    );
  }
}
