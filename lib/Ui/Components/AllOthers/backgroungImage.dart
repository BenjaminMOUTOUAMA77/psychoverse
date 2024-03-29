import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';

class MakeBackgroundImage extends StatefulWidget {
  const MakeBackgroundImage({Key? key}) : super(key: key);
  @override
  State<MakeBackgroundImage> createState() => _MakeBackgroundImageState();
}

class _MakeBackgroundImageState extends State<MakeBackgroundImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.blanc,
      child: Image.asset(AppImages.pattern,opacity: const AlwaysStoppedAnimation(0.01),),
    );
  }
}
