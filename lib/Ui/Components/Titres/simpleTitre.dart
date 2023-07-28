import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpleTitre extends StatefulWidget {
  String text;
  Color textColor;
  Color backgroundColor;
  SimpleTitre({
    Key? key,
    this.text = "Text",
    this.textColor = const Color(0xFFFFFFFF),
    this.backgroundColor = const Color(0xFF170038),
  }) : super(key: key);

  @override
  State<SimpleTitre> createState() => _SimpleTitreState();
}

class _SimpleTitreState extends State<SimpleTitre> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
      ),
      child: Text(widget.text,style: TextStyle(color: widget.textColor),),
    );
  }
}
