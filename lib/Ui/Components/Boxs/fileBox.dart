import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:open_file/open_file.dart';
import 'package:psychoverse/Functions/extensions.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';
import 'package:psychoverse/Providers/myAppPathProvider.dart';
import 'package:provider/provider.dart';

class FileBox extends StatefulWidget {
  PlatformFile file;
  FileBox({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  State<FileBox> createState() => _FileBoxState();
}

class _FileBoxState extends State<FileBox> {
  @override
  Widget build(BuildContext context) {
    MyAppPathProvider appPath = Provider.of<MyAppPathProvider>(context);
    return Tooltip(
      message: widget.file.name,
      child: GestureDetector(
        onTap: () {
          print(widget.file.path);
          OpenFile.open(widget.file.path);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              AppDesignEffects.shadow1,
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 200.h,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: isImage(widget.file.extension.toString())?Colors.transparent:getColor(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: isImage(widget.file.extension.toString())
                    ? Image.file(File(widget.file.path!),fit: BoxFit.cover,)
                    : Icon(
                        getFileIcon(widget.file.extension.toString()),
                        size: 100.h,
                        color: AppColors.blanc,
                      ),
              ),
              Gap(20.h),
              Text(
                widget.file.name.length > 10
                    ? widget.file.name.substring(0, 10) + "..."
                    : widget.file.name,
                overflow: TextOverflow.fade,
                style: AppTextStyle.bigFilledTexte
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 22.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
