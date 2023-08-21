import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Adaptive extends StatefulWidget {
  final Widget? first;
  final Widget? second;
  final Widget? third;
  const Adaptive({Key? key, this.first, this.second, this.third})
      : super(key: key);

  @override
  State<Adaptive> createState() => _AdaptiveState();
}

class _AdaptiveState extends State<Adaptive> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mediumLayout: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.first != null)
            Expanded(
              child: Row(
                children: [
                  Expanded(child: widget.first!),
                ],
              ),
            ),

          if(widget.second != null)
            Expanded(
              child: Row(
                children: [
                  Gap(20.w),
                  Expanded(child: widget.second!),
                ],
              ),
            ),

          if(widget.third != null)
            Expanded(
              child: Row(
                children: [
                  Gap(20.w),
                  Expanded(child: widget.third!),
                ],
              ),
            ),
        ],
      ),
      smallLayout: Column(
        children: [
          if(widget.first != null)
            widget.first!,

          if(widget.second != null)
            widget.second!,

          if(widget.third != null)
            widget.third!,
        ],
      ),
    );
  }
}
