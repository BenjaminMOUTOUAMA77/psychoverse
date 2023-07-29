import 'package:file_picker/file_picker.dart';
import 'package:file_sizes/file_sizes.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Functions/extensions.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class SmallFileTile extends StatefulWidget {
  PlatformFile file;
  SmallFileTile({Key? key,required this.file}) : super(key: key);

  @override
  State<SmallFileTile> createState() => _SmallFileTileState();
}

class _SmallFileTileState extends State<SmallFileTile> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Ouvrire",
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
        decoration: BoxDecoration(
          boxShadow: [
            AppDesignEffects.shadow1,
          ],
        ),
        child: Row(
          children: [
            Icon(getFileIcon(widget.file.extension.toString().toLowerCase()),color: AppColors.rouge,size: 30.h,),
            Gap(20.h),
            Expanded(
              child: Text(widget.file.name,overflow: TextOverflow.ellipsis,style: AppTextStyle.bigFilledTexte.copyWith(fontWeight: FontWeight.bold),),
            ),
            Gap(20.h),
            Text(FileSize.getSize(widget.file.size).toString(),style: AppTextStyle.filedTexte,),
          ],
        ),
      ),
    );
  }
}
