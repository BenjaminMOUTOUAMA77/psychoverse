import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/PopUps/zSmallPopUp.dart';
import 'package:psychoverse/Ui/Components/Tiles/simpleTile.dart';

class ListGenerator extends StatefulWidget {
  List<String> list;
  String? popUpTitle;
  String? deleteTexte;
  String? formTexte;
  bool useParticularOntap;
  bool useParticularWidget;
  Function(int index)? deleteFunction;
  Function(int index)? onTap;
  Widget Function(int index)? getWidget;
  Function({String? value, int? index})? onChanged;
  Function({String? value, int? index})? onSubmitted;
  ListGenerator(
      {Key? key,
      this.list=const [],
      this.popUpTitle,
      this.deleteTexte = "Supprimer",
      this.formTexte = "Désignation",
      this.useParticularOntap = false,
      this.useParticularWidget = false,
      this.onChanged,
      this.onTap,
      this.getWidget,
      this.deleteFunction,
      this.onSubmitted})
      : super(key: key);

  @override
  State<ListGenerator> createState() => _ListGeneratorState();
}

class _ListGeneratorState extends State<ListGenerator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.list.length,
        (i) => GestureDetector(
          onTap: () {
            widget.useParticularOntap
                ? widget.onTap!(i)
                : showDialog(
                    context: context,
                    builder: (context) => SmallPopUp(
                      title: widget.popUpTitle!,
                      delete: true,
                      deleteTexte: widget.deleteTexte!,
                      deleteFunction: widget.deleteFunction!(i),
                      child: TextForm(
                        title: widget.formTexte!,
                        value: widget.list[i],
                        onChanged: (value) {
                          widget.onChanged!(value: value, index: i);
                        },
                        onFieldSubmitted: (value) {
                          widget.onSubmitted!(value: value, index: i);
                        },
                      ),
                    ),
                  );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: widget.useParticularWidget
                ? widget.getWidget!(i)
                : SimpleTile(
                    title: widget.list[i],
                    deleteTexte: widget.deleteTexte!,
                    deleteFunction: widget.deleteFunction!(i),
                  ),
          ),
        ),
      ),
    );
  }
}
