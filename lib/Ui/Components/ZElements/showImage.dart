import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowImage extends StatefulWidget {
  final String image;
  const ShowImage({Key? key, this.image = "assets/images/im1.jpg"})
      : super(key: key);

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fit: BoxFit.cover,
      placeholder: AssetImage("assets/images/lFBlanc.png"),
      image: AssetImage(widget.image),
    );
  }
}
