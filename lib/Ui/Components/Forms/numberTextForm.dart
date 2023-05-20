import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Forms/formBox.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';


class NumberTextForm extends StatefulWidget {
  final String title;
  String placeHolder;
  int? value;
  int? selected;
  bool readOnly;
  bool managers;
  TextEditingController controller = TextEditingController();
  Function(int?) onChanged;
  Function(int?) onFieldSubmitted;
  NumberTextForm({Key? key,
    this.title = "Number Text Form",
    this.readOnly=true,
    this.managers=true,
    this.value,
    this.placeHolder="0",
    this.selected,
    required this.onChanged,
    required this.onFieldSubmitted,}) : super(key: key);

  @override
  State<NumberTextForm> createState() => _NumberTextFormState();
}

class _NumberTextFormState extends State<NumberTextForm> {
  @override
  Widget build(BuildContext context) {
    return AppFormBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: AppTextStyle.formLabelStyleTexte,
              ),
              widget.managers?Row(
                children: [
                  widget.readOnly
                      ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: IconButton(
                      icon: Icon(
                        FluentIcons.edit,
                        color: AppColors.primary,
                        size: 20.h,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.readOnly = false;
                        });
                      },
                    ),
                  )
                      : Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: IconButton(
                          icon: Icon(
                            FluentIcons.sync_occurence_cancel,
                            color: AppColors.primary,
                            size: 20.h,
                          ),
                          onPressed: () {
                            setState(() {
                              widget.readOnly = true;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: IconButton(
                          icon: Icon(
                            FluentIcons.save_template,
                            color: AppColors.primary,
                            size: 20.h,
                          ),
                          onPressed: () {
                            widget.value=widget.selected;
                            widget.onFieldSubmitted(widget.selected);
                            setState(() {
                              widget.readOnly = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ):const Gap(0),
            ],
          ),
          widget.readOnly
              ? Text(
            widget.value==null?widget.placeHolder: widget.value.toString(),
            style: widget.value == null
                ?AppTextStyle.formPlaceHolderStyleTexte: AppTextStyle.formStyleTexte,
          )
              :NumberBox<int>(
            value: widget.selected,
            onChanged: widget.readOnly ? null : (value){
              setState(() {
                widget.selected=value;
              });
            },
            mode: SpinButtonPlacementMode.compact,
            clearButton: false,
            cursorColor: AppColors.rouge,
            highlightColor: Colors.transparent,
            placeholder: widget.placeHolder,
            placeholderStyle: AppTextStyle.formPlaceHolderStyleTexte,
          ),
        ],
      ),
    );
  }
}
