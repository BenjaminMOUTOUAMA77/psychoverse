import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Forms/formBox.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class MenuForm extends StatefulWidget {
  final String title;
  String? selected;
  String? value;
  String placeHolder;
  bool readOnly;
  bool managers;
  List<String> list;
  Function(String?) onChanged;
  Function(String?) onFieldSubmitted;
  MenuForm({
    Key? key,
    this.title = "ComboBox Form",
    this.readOnly=true,
    this.managers=true,
    this.selected,
    this.value,
    this.placeHolder = "Slectionnez ici",
    this.list = const [],
    required this.onChanged,
    required this.onFieldSubmitted,
  }) : super(key: key);

  @override
  State<MenuForm> createState() => _MenuFormState();
}

class _MenuFormState extends State<MenuForm> {
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
                                  widget.onFieldSubmitted(widget.value);
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
                  widget.value == null
                      ? widget.placeHolder
                      : widget.value.toString(),
                  style:widget.value == null
                      ?AppTextStyle.formPlaceHolderStyleTexte: AppTextStyle.formStyleTexte,
                )
              : SizedBox(
                  height: 70.h,
                  child: ComboBox<String>(
                          value: widget.selected,
                          items: widget.list.map((e) {
                            return ComboBoxItem(
                              child: Text(e),
                              value: e,
                            );
                          }).toList(),
                          style: AppTextStyle.filedTexte
                              .copyWith(fontWeight: FontWeight.bold),
                          onChanged: widget.readOnly
                              ? null
                              : (value) {
                                  setState(() => widget.selected = value);
                                  widget.onChanged(value);
                                },
                          icon: Icon(FluentIcons.chevron_down_small),
                          iconEnabledColor: AppColors.rouge,
                          iconDisabledColor: AppColors.gris,
                          focusColor: AppColors.rouge,
                          isExpanded: true,
                          placeholder: Text(widget.placeHolder),
                        ),
                )
        ],
      ),
    );
  }
}
