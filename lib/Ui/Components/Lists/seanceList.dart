import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/PopUps/zBigPopUp.dart';
import 'package:psychoverse/Ui/Components/Sections/seance.dart';
import 'package:psychoverse/Ui/Components/Tiles/simpleTile.dart';

class SeanceList extends StatefulWidget {
  List<String>? list;
  SeanceList({Key? key,this.list}) : super(key: key);

  @override
  State<SeanceList> createState() => _SeanceListState();
}

class _SeanceListState extends State<SeanceList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.list != null ? widget.list!.map((item) {
        return Builder(builder: (BuildContext context){
          return GestureDetector(
            onTap: (){
              showDialog(
                context: context,
                builder: (context) => BigPopUp(
                  title: item,
                  delete:true,
                  deleteTexte: "Retirer cette séance",
                  deleteFunction: (){
                    Navigator.pop(context);
                  },
                  child: SingleChildScrollView(child: Seance()),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: SimpleTile(
                title: item,
              ),
            ),
          );
        },);
      }).toList():[],
    );
  }
}
