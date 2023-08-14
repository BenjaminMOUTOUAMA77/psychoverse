import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/PopUps/bigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/quotePopUp.dart';
import 'package:psychoverse/Ui/Components/Tiles/quoteTile.dart';
import 'package:psychoverse/Ui/Generators/listViewTilesGenerator.dart';

class QuotesTilesGroupe extends StatefulWidget {
  List<String> list;
  QuotesTilesGroupe({Key? key,this.list = const [],}) : super(key: key);

  @override
  State<QuotesTilesGroupe> createState() => _QuotesTilesGroupeState();
}

class _QuotesTilesGroupeState extends State<QuotesTilesGroupe> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 445.h * widget.list.length,
      width: double.infinity,
      child: ListViewTilesGenerator(
        number: widget.list.length,
        onTap: ({index = 0}) {
          showDialog(
            context: context,
            builder: (context) => BigPopUp(title: "Pensée",delete: true,child: QuotePopUp(),),
          );
        },
        getTile: ({index = 0}) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
            child: QuoteTile(),
          );
        },
      ),
    );
  }
}
