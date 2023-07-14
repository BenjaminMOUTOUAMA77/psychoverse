import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TilesGenerator extends StatefulWidget {
  int number;
  Widget tile;
  Function({int index}) onTap;
  TilesGenerator({Key? key,this.number=5,required this.tile, required this.onTap}) : super(key: key);

  @override
  State<TilesGenerator> createState() => _TilesGeneratorState();
}

class _TilesGeneratorState extends State<TilesGenerator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
      child: ListView.separated(
        itemCount: widget.number,
        itemBuilder: (context, i) => GestureDetector(
            onTap: ()=>widget.onTap(index: i),
            child: widget.tile),
        separatorBuilder: (context, i) => Gap(20.h),
      ),
    );
  }
}
