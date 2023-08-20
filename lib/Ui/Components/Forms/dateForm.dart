import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:psychoverse/Ui/Components/Forms/zFormBox.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class AppDateForm extends StatefulWidget {

  final String title;
  String placeHolder;
  DateTime? value;
  bool readOnly;
  bool managers;

  Function(DateTime?)? onChanged;
  Function(DateTime?)? onFieldSubmitted;

  AppDateForm({Key? key,
    this.title = "Date Form",
    this.readOnly=true,
    this.managers=true,
    this.value,
    this.placeHolder="_",
    required this.onChanged,
    required this.onFieldSubmitted,}) : super(key: key);

  @override
  State<AppDateForm> createState() => _AppDateFormState();
}

class _AppDateFormState extends State<AppDateForm> {
  DateTime? selected;
  @override
  Widget build(BuildContext context) {
    selected=widget.value;
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
                            widget.value=selected;
                            widget.onFieldSubmitted!(widget.value);
                            setState(() {
                              widget.readOnly = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ): const Gap(0),
            ],
          ),
          widget.readOnly
              ? Text(
            widget.value==null?widget.placeHolder: DateFormat.yMMMMEEEEd(Localizations.localeOf(context).languageCode).format(widget.value as DateTime),
            style: widget.value == null
                ?AppTextStyle.formPlaceHolderStyleTexte: AppTextStyle.formStyleTexte,
          )
              :DatePicker(

            selected: selected,
            onChanged: (time) => setState(() => selected = time),
          ),
        ],
      ),
    );
  }
}
