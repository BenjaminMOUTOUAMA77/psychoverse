import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class SmallAppButton extends StatefulWidget {
  VoidCallback function;
  final String texte;
  SmallAppButton({Key? key,this.texte="Small Button",required this.function}) : super(key: key);

  @override
  State<SmallAppButton> createState() => _SmallAppButtonState();
}

class _SmallAppButtonState extends State<SmallAppButton> {
  @override
  Widget build(BuildContext context) {
    return Button(child: Text(widget.texte), onPressed: widget.function,
    style: ButtonStyle(
      padding: ButtonState.all(EdgeInsets.symmetric(horizontal: 50.w,vertical: 15.h)),
      shape: ButtonState.all<OutlinedBorder>(
        RoundedRectangleBorder(
          side: BorderSide(
              color: AppColors.grisLite.withOpacity(0.3),
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    ),
    );
  }
}
