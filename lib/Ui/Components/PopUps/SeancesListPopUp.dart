import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/PopUps/SeanceDetailPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/bigPopUp.dart';
import 'package:psychoverse/Ui/Components/Tiles/seanceTile.dart';
import 'package:psychoverse/Ui/Generators/listViewTilesGenerator.dart';

class SeanceListPopUp extends StatefulWidget {
  List<String> list;
  SeanceListPopUp({Key? key,this.list = const []}) : super(key: key);

  @override
  State<SeanceListPopUp> createState() => _SeanceListPopUpState();
}

class _SeanceListPopUpState extends State<SeanceListPopUp> {
  @override
  Widget build(BuildContext context) {
    return ListViewTilesGenerator(
      number: widget.list.length,
      onTap: ({index = 0}) {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => BigPopUp(title: "Séances du Samedi 14 Avril 2023",child: SeanceDetailPopUp(),),
        );
      },
      getTile: ({index = 0}) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: SeanceTile(),
        );
      },
    );
  }
}
