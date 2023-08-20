import 'package:fluent_ui/fluent_ui.dart';
import 'package:psychoverse/Ui/Components/Forms/zFormBox.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class SwitchForm extends StatefulWidget {
  bool isChecked;
  String checkedTexte;
  String unCheckedTexte;
  Function(bool value)? onChanged;
  SwitchForm(
      {Key? key,
      this.isChecked = false,
      this.checkedTexte = "Activé",
      this.unCheckedTexte = "Désactivé",this.onChanged})
      : super(key: key);

  @override
  State<SwitchForm> createState() => _SwitchFormState();
}

class _SwitchFormState extends State<SwitchForm> {
  @override
  Widget build(BuildContext context) {
    return AppFormBox(
      child: ToggleSwitch(
        checked: widget.isChecked,
        onChanged: (value) {
          setState(() {
            widget.onChanged!(value);
            widget.isChecked=value;
          });
        },
        style: ToggleSwitchThemeData(
          checkedKnobDecoration: ButtonState.all(BoxDecoration(
            color: AppColors.blanc,
            shape: BoxShape.circle,
          ),),
          uncheckedKnobDecoration: ButtonState.all(BoxDecoration(
            color: AppColors.blanc,
            shape: BoxShape.circle,
          ),),
          checkedDecoration: ButtonState.all(BoxDecoration(
            color: AppColors.rouge,
            borderRadius: BorderRadius.circular(20),
          ),),
          uncheckedDecoration: ButtonState.all(BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),),
        ),
        content: Text(widget.isChecked ? widget.checkedTexte : widget.unCheckedTexte,style: AppTextStyle.formStyleTexte,),
      ),
    );
  }
}
