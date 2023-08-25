import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:open_file/open_file.dart';
import 'package:psychoverse/Functions/pickFiles.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class ShowImage extends StatefulWidget {
  PlatformFile? image;
  ShowImage({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        widget.image == null
            ? FadeInImage(
                image: AssetImage(
                  "assets/images/im7.jpg",
                ),
                placeholder: AssetImage(
                  "assets/images/nuanceBlanc.png",
                ),
              )
            : Image.file(
                File(widget.image!.path.toString()),
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
              ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                    message: "Agrandire",
                    child: IconButton(
                      style: ButtonStyle(
                        elevation: ButtonState.all(1),
                        backgroundColor: ButtonState.all(AppColors.rouge),
                      ),
                      icon: Icon(
                        FluentIcons.picture_position,
                        color: AppColors.blancGrise,
                        size: 30.h,
                        weight: 100,
                      ),
                      onPressed: () {
                        if (widget.image != null) {
                          OpenFile.open(widget.image!.path.toString());
                        }
                      },
                    ),
                  ),
                  Gap(30.w),
                  Tooltip(
                    message: "Modifier",
                    child: IconButton(
                      style: ButtonStyle(
                        elevation: ButtonState.all(1),
                        backgroundColor: ButtonState.all(AppColors.rouge),
                      ),
                      icon: Icon(
                        FluentIcons.edit_photo,
                        color: AppColors.blancGrise,
                        size: 30.h,
                        weight: 100,
                      ),
                      onPressed: () => pickFiles(
                        context,
                        dialogueTitle: "Choisir une image",
                        image: true,
                        onPiked: (value) async {
                          PlatformFile newImage = await saveFile(value[0]);
                          if (widget.image != null) {
                            PlatformFile oldImage = widget.image!;
                            setState(() {
                              widget.image = newImage;
                            });
                            deleteFile(oldImage);
                          }else{
                            setState(() {
                              widget.image = newImage;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  Gap(30.w),
                  Tooltip(
                    message: "Fermer",
                    child: IconButton(
                      style: ButtonStyle(
                        elevation: ButtonState.all(1),
                        backgroundColor: ButtonState.all(AppColors.blancGrise),
                      ),
                      icon: Icon(
                        FluentIcons.cancel,
                        color: AppColors.rouge,
                        size: 30.h,
                        weight: 100,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
