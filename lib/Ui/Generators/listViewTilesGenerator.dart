import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ListViewTilesGenerator extends StatefulWidget {
  int number;
  Function({int index}) onTap;
  Widget Function({int index}) getTile;
  ListViewTilesGenerator({Key? key,this.number=5, required this.onTap,required this.getTile}) : super(key: key);

  @override
  State<ListViewTilesGenerator> createState() => _ListViewTilesGeneratorState();
}

class _ListViewTilesGeneratorState extends State<ListViewTilesGenerator> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      child: ListView.separated(
        itemCount: widget.number,
        itemBuilder: (context, i) => GestureDetector(
            onTap: ()=>widget.onTap(index: i),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: widget.getTile(index: i),
            )),
        separatorBuilder: (context, i) => Gap(20.h),
      ),
    );
  }
}
