import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class AppTextForm extends StatefulWidget {
  final title;
  String placehholder;
  String? initialValue;
  bool readOnly = true;
  var controller = TextEditingController();
  Function(String) onChanged;
  Function(String) onFieldSubmitted;
  Function(String?) onSaved;
  String? Function(String?) validator;
  AppTextForm(
      {Key? key,
      this.title = "TextFormBox Title",
      this.initialValue,
      this.placehholder = "...",
      required this.onChanged,
      required this.onSaved,
      required this.onFieldSubmitted,
      required this.validator})
      : super(key: key);

  @override
  State<AppTextForm> createState() => _AppTextFormState();
}

class _AppTextFormState extends State<AppTextForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.blanc,
        boxShadow: [
          AppDesignEffects.shadow1,
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: AppTextStyle.filedTexte.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.grisLite),
              ),
              Row(
                children: [
                  widget.readOnly?Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: IconButton(
                      icon: Icon(
                        FluentIcons.edit,
                        color: AppColors.primary,
                        size: 20.h,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.readOnly=false;
                        });
                      },
                    ),
                  ):Row(
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
                              widget.readOnly=true;
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
                              widget.readOnly=true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          TextFormBox(
            initialValue: widget.initialValue,
            keyboardType: TextInputType.text,
            style: AppTextStyle.filedTexte.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 10.sp + 10,
                color: AppColors.primary),
            readOnly: widget.readOnly,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            onChanged: (value) => widget.onChanged(value),
            onFieldSubmitted: (value) => widget.onFieldSubmitted(value),
            onSaved: (value) => widget.onSaved(value),
            validator: (value) => widget.validator(value),
            inputFormatters: [],
            cursorColor: AppColors.rouge,
            placeholder: widget.placehholder,
            placeholderStyle: AppTextStyle.filedTexte.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 10.sp + 10,
                color: AppColors.grisLitePlus),
            unfocusedColor: Colors.transparent,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.transparent,
                style: BorderStyle.none,
              ),
            ),
            highlightColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
