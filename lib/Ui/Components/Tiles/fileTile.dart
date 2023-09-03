import 'package:file_picker/file_picker.dart';
import 'package:file_sizes/file_sizes.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Functions/extensions.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class FileTile extends StatefulWidget {
  PlatformFile file;
  String cancelTexte;
  VoidCallback? cancelFunction ;
  FileTile({Key? key,required this.file,this.cancelTexte="retirer",this.cancelFunction}) : super(key: key);

  @override
  State<FileTile> createState() => _FileTileState();
}

class _FileTileState extends State<FileTile> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Ouvrir",
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
        decoration: BoxDecoration(
          boxShadow: [
            AppDesignEffects.shadow1,
          ],
        ),
        child: Row(
          children: [
            Icon(getFileIcon(widget.file.extension.toString().toLowerCase()),color: AppColors.secondary,size: 30.h,),
            Gap(20.h),
            Expanded(
              child: Text(widget.file.name,overflow: TextOverflow.ellipsis,style: AppTextStyle.bigFilledTexte.copyWith(fontWeight: FontWeight.bold),),
            ),
            Gap(20.h),
            Text(FileSize.getSize(widget.file.size).toString(),style: AppTextStyle.filedTexte,),
            Gap(10.w),
            Tooltip(message: widget.cancelTexte,child: IconButton(icon: Icon(FluentIcons.cancel,size: 20.h,color: AppColors.secondary,), onPressed:widget.cancelFunction))
          ],
        ),
      ),
    );
  }
}
