import 'package:fluent_ui/fluent_ui.dart';
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
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages.pattern), fit: BoxFit.cover, opacity: 0.1),
      ),
    );
  }
}
