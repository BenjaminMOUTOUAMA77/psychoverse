import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarIconButton extends StatefulWidget {
  IconData icon;
  Color color;
  VoidCallback? onTap;
  CalendarIconButton({
    Key? key,
    this.icon = FluentIcons.lower_brightness,
    this.color = const Color(0xFF000000),
    this.onTap,
  }) : super(key: key);

  @override
  State<CalendarIconButton> createState() => _CalendarIconButtonState();
}

class _CalendarIconButtonState extends State<CalendarIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.icon,
        color: widget.color,
        size: 30.h,
      ),
      onPressed:widget.onTap,
    );
  }
}
