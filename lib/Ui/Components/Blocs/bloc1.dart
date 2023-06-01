import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Ui/Components/Titles/titre1.dart';

class Bloc1 extends StatefulWidget {
  final String title;
  final IconData? icon;
  final int number;
  final Widget? child;
  const Bloc1({Key? key,this.title = "Title", this.icon, this.number=0, this.child}) : super(key: key);

  @override
  State<Bloc1> createState() => _Bloc1State();
}

class _Bloc1State extends State<Bloc1> {
  late ChangeSectionsProvider sections;
  @override
  Widget build(BuildContext context) {
    sections = Provider.of<ChangeSectionsProvider>(context);
    return sections.mode?Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        children: [
          Titre1(
            icon: widget.icon,
            title: widget.title,
            number: widget.number,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: widget.child,
          ),
        ],
      ),
    ): Column(
      children: [
        Titre1(
          icon: widget.icon,
          title: widget.title,
          number: widget.number,
        ),
        Expanded(
          child: SizedBox(
            child: SingleChildScrollView(
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }
}
