import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:psychoverse/Ui/Components/Forms/zFormBox.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class TimeForm extends StatefulWidget {
  final String title;
  String placeHolder;
  DateTime? value;
  bool readOnly;
  bool managers;

  Function(DateTime?) onChanged;
  Function(DateTime?) onFieldSubmitted;

  TimeForm({
    Key? key,
    this.title = "Time Form",
    this.readOnly=true,
    this.managers=true,
    this.value,
    this.placeHolder="00:00",
    required this.onChanged,
    required this.onFieldSubmitted,
  }) : super(key: key);

  @override
  State<TimeForm> createState() => _TimeFormState();
}

class _TimeFormState extends State<TimeForm> {
  DateTime? selected;
  @override
  void initState() {
    selected = widget.value;
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
                              widget.onFieldSubmitted(widget.value);
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
            widget.value==null?widget.placeHolder: DateFormat.jm(Localizations.localeOf(context).languageCode).format(widget.value as DateTime),
            style: widget.value == null
                ?AppTextStyle.formPlaceHolderStyleTexte: AppTextStyle.formStyleTexte,
          )
              : TimePicker(
            hourFormat: HourFormat.HH,
            selected: selected,
            onChanged: (time) => setState(() => selected = time),
          ),
        ],
      ),
    );
  }
}
