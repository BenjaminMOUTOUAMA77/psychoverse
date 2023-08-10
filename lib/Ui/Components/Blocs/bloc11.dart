import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/ArchitectureProvider/changeScreenProviderArchitecture.dart';
import 'package:psychoverse/Ui/Components/Titres/titre1.dart';

class Bloc11 extends StatefulWidget {
  final String title;
  final IconData? icon;
  final int number;
  final Widget? child;
  Bloc11({Key? key,this.title = "Title", this.icon, this.number=0, this.child}) : super(key: key);

  @override
  State<Bloc11> createState() => _Bloc11State();
}

class _Bloc11State extends State<Bloc11> {
  late ChangeSectionsProviderArchitecture sections;
  bool variable=true;
  @override
  Widget build(BuildContext context) {
    sections = Provider.of<ChangeSectionsProviderArchitecture>(context);
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
