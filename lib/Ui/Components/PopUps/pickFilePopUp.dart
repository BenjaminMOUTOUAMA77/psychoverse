import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:open_file/open_file.dart';
import 'package:psychoverse/Functions/pickFiles.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/Tiles/smallFileTile.dart';
import 'package:psychoverse/Ui/Generators/listViewTilesGenerator.dart';

class PickFilePopUp extends StatefulWidget {
  List<PlatformFile> files;
  PickFilePopUp({Key? key, required this.files})
      : super(key: key);

  @override
  State<PickFilePopUp> createState() => _PickFilePopUpState();
}

class _PickFilePopUpState extends State<PickFilePopUp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(20.h),
          SizedBox(
            height: 700.h-200,
            child: ListViewTilesGenerator(
              number: widget.files.length,
              onTap: ({index = 0}) {
                OpenFile.open(widget.files[index].path);
              },
              getTile: ({index = 0}) {
                return Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: SmallFileTile(file: widget.files[index],),
                );
              },
            ),
          ),
          Gap(30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleAppButon(
                function: () {
                  for(PlatformFile file in widget.files){
                    saveFile(file);
                  }
                  Navigator.pop(context);
                },
                texte: "Charger",
                icon: FluentIcons.to_do_logo_inverse,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
