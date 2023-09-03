import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/Boxs/FileBox.dart';

class FilesBoxList extends StatefulWidget {
  List<PlatformFile>? list;
  FilesBoxList({Key? key,this.list}) : super(key: key);

  @override
  State<FilesBoxList> createState() => _FilesBoxListState();
}

class _FilesBoxListState extends State<FilesBoxList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (widget.list!.length <= 5 ? 1 : widget.list!.length / 5 + 1) * 320.h,
      width: double.infinity,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3.4 / 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: widget.list!.length,
        itemBuilder: (BuildContext context, index) {
          return FileBox(file: widget.list![index],);
        },
      ),
    );
  }
}
