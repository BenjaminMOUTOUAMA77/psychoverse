import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:open_file/open_file.dart';
import 'package:psychoverse/Functions/pickFiles.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class ImagePopUp extends StatefulWidget {
  String image;
  ImagePopUp({Key? key,this.image="assets/images/im7.jpg"}) : super(key: key);

  @override
  State<ImagePopUp> createState() => _ImagePopUpState();
}

class _ImagePopUpState extends State<ImagePopUp> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Stack(
          children: [
            Image.asset(
              widget.image,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
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
                      onPressed: () => OpenFile.open("C:/Users/Utilisateur/StudioProjects/psychoverse/"+widget.image),
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
                        FluentIcons.page_header_edit,
                        color: AppColors.blancGrise,
                        size: 30.h,
                        weight: 100,
                      ),
                      onPressed: () => pickFile(context),
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
      ),
    );
  }
}
