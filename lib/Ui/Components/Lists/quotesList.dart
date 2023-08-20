import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/PopUps/zBigPopUp.dart';
import 'package:psychoverse/Ui/Components/PopUps/quotePopUp.dart';
import 'package:psychoverse/Ui/Components/Tiles/quoteTile.dart';

class QuotesList extends StatefulWidget {
  List<String> list;
  QuotesList({Key? key,this.list = const [],}) : super(key: key);

  @override
  State<QuotesList> createState() => _QuotesListState();
}

class _QuotesListState extends State<QuotesList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.list!.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (context) => BigPopUp(title: "Pensée",delete: true,child: QuotePopUp(),),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
                  child: QuoteTile(),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}