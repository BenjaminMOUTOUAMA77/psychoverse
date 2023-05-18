import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Forms/formBox.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class CheckBoxMenu extends StatefulWidget {
  final String title;
  List<CheckBoxUnit> value;
  String placeHolder;
  bool readOnly = true;
  List<CheckBoxUnit> list;
  Function(List<CheckBoxUnit>) onChanged;
  Function(List<CheckBoxUnit>) onFieldSubmitted;

  CheckBoxMenu({
    Key? key,
    this.title = "TextFormBox Title",
    this.value = const [],
    this.placeHolder = "Slectionnez ici",
    this.list = const [],
    required this.onChanged,
    required this.onFieldSubmitted,
  }) : super(key: key);

  List<String> getSelected() {
    List<String> list = [];
    for (var i in value) {
      if (i.checked != null && i.checked == true) {
        list.add(i.element);
      }
    }
    return list;
  }

  @override
  State<CheckBoxMenu> createState() => _CheckBoxMenuState();
}

class _CheckBoxMenuState extends State<CheckBoxMenu> {
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
              Row(
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
                                  widget.value = widget.list;
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
              ),
            ],
          ),
          widget.readOnly
              ? widget.value.length == 0
                  ? Text(
                      widget.placeHolder,
                      style: AppTextStyle.formPlaceHolderStyleTexte,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.getSelected().map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              child: Row(
                                children: [
                                  Icon(
                                    FluentIcons.verified_brand_solid,
                                    color: AppColors.rouge,
                                    size: 20.h,
                                  ),
                                  Gap(20.w + 5),
                                  Text(
                                    i,
                                    style: AppTextStyle.formStyleTexte,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.list.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Checkbox(
                            checked: i.checked,
                            onChanged: (value) {
                              setState(() {
                                i.checked == false
                                    ? i.checked = true
                                    : i.checked = false;
                              });
                            },
                            content: Text(i.element,style: AppTextStyle.filedTexte,),
                            style: CheckboxThemeData(
                              checkedDecoration: ButtonState.all(BoxDecoration(
                                color: AppColors.rouge,
                                borderRadius: BorderRadius.circular(2.r+2),
                              )),
                              uncheckedDecoration: ButtonState.all(BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: AppColors.gris,
                                ),
                                borderRadius: BorderRadius.circular(2.r+2),
                              )),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }
}

class CheckBoxUnit {
  String element;
  bool? checked;

  CheckBoxUnit({
    Key? key,
    this.element = "Element",
    this.checked = false,
  });

  String getElement() => element;
  bool? getChecked() => checked;

  setElement(String value) => element = value;
  setChecked(bool value) => checked = value;
}
