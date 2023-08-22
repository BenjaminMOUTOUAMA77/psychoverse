import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Forms/zFormBox.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class MultiCheckBoxMenuForm extends StatefulWidget {
  final String title;
  List<String>? selected;
  String placeHolder;
  bool readOnly;
  bool managers;
  List<String>? list;
  Function(List<String>?)? onChanged;
  Function(List<String>?)? onFieldSubmitted;

  MultiCheckBoxMenuForm({
    Key? key,
    this.title = "CheckBox Menu Form",
    this.readOnly=true,
    this.managers=true,
    required this.selected,
    this.placeHolder = "_",
    required this.list,
    required this.onChanged,
    required this.onFieldSubmitted,
  }) : super(key: key);


  @override
  State<MultiCheckBoxMenuForm> createState() => _MultiCheckBoxMenuFormState();
}

class _MultiCheckBoxMenuFormState extends State<MultiCheckBoxMenuForm> {
  List<String>? selected;
  @override
  void initState() {
    selected=widget.selected;
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
              widget.managers? Row(
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
                                  widget.selected=selected;
                                  widget.onFieldSubmitted!(widget.selected);
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
              ? widget.selected!.length == 0
                  ? Text(
                      widget.placeHolder,
                      style: AppTextStyle.formPlaceHolderStyleTexte,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.selected!.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Row(
                                children: [
                                  Icon(
                                    FluentIcons.verified_brand_solid,
                                    color: AppColors.rouge,
                                    size: 20.h,
                                  ),
                                  Gap(20.w),
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
                  children: widget.list!.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Checkbox(
                            checked: selected!.contains(i)?true:false,
                            onChanged: (value) {
                              setState(() {
                                if(value!){
                                  selected!.add(i);
                                }else{
                                  selected!.remove(i);
                                }
                              },);
                            },
                            content: Text(i,style: AppTextStyle.filedTexte,),
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
