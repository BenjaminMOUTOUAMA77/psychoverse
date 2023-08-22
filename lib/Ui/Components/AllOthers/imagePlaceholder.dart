import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';

class ImagePlaceholder extends StatefulWidget {
  final String image;
  const ImagePlaceholder({Key? key, this.image = "assets/images/im8.jpg"})
      : super(key: key);

  @override
  State<ImagePlaceholder> createState() => _ImagePlaceholderState();
}

class _ImagePlaceholderState extends State<ImagePlaceholder> {
  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: AssetImage(AppImages.logoSymbole),
      image: AssetImage(widget.image),
      fit: BoxFit.cover,
      placeholderFit: BoxFit.cover,
      filterQuality: FilterQuality.high,
      placeholderFilterQuality: FilterQuality.high,
    );
  }
}
