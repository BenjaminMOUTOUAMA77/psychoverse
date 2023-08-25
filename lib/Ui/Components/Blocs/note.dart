import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';

class Note extends StatefulWidget {
  String? value;
  Function(String value)? onChanged;
  Note({Key? key,this.value,this.onChanged}) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blanc,
      child: SingleChildScrollView(
        child: BigTextForm(
          value: widget.value,
          onFieldSubmitted: (value) {
            widget.onChanged!(value!);
          },
          title: "Note",
        ),
      ),
    );
  }
}
