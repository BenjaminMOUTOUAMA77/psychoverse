import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/Patients/changeSectionsProvider.dart';
import 'package:psychoverse/Ui/Components/Titres/titre1.dart';

class AppContainer1 extends StatefulWidget {
  int uiKey;
  final String title;
  final IconData? icon;
  final int number;
  final Widget? child;
  AppContainer1({Key? key,required this.uiKey,this.title = "Title", this.icon, this.number=0, this.child}) : super(key: key);

  @override
  State<AppContainer1> createState() => _AppContainer1State();
}

class _AppContainer1State extends State<AppContainer1> {
  late ChangeSectionsProvider sections;
  @override
  Widget build(BuildContext context) {
    sections = Provider.of<ChangeSectionsProvider>(context);
    return sections.getMode(widget.uiKey)?Padding(
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
