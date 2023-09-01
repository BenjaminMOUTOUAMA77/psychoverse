import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Forms/zFormBox.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';


class NumberTextForm extends StatefulWidget {
  final String title;
  String placeHolder;
  int? value;
  bool readOnly;
  bool managers;
  Function(int?)? onChanged;
  Function(int?)? onFieldSubmitted;
  NumberTextForm({Key? key,
    this.title = "Number Text Form",
    this.readOnly=true,
    this.managers=true,
    this.value,
    this.placeHolder="0",
    this.onChanged,
    this.onFieldSubmitted,}) : super(key: key);

  @override
  State<NumberTextForm> createState() => _NumberTextFormState();
}

class _NumberTextFormState extends State<NumberTextForm> {
  int? selected;
  @override
  void initState() {
    selected=widget.value;
    super.initState();
  }
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
                            setState(() {
                              widget.value=selected;
                              widget.onFieldSubmitted!(widget.value);
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
            value: selected,
            onChanged: widget.readOnly ? null : (value){
              setState(() {
                selected=value;
              });
            },
            mode: SpinButtonPlacementMode.compact,
            clearButton: false,
            cursorColor: AppColors.bleu,
            highlightColor: Colors.transparent,
            placeholder: widget.placeHolder,
            placeholderStyle: AppTextStyle.formPlaceHolderStyleTexte,
          ),
        ],
      ),
    );
  }
}
