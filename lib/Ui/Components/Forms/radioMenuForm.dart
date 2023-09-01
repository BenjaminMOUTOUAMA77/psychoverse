import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Forms/zFormBox.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class RadioMenuForm extends StatefulWidget {

  final String title;
  String? selected;
  String placeHolder;
  bool readOnly;
  bool managers;
  List<String>? list=[];
  Function(String?)? onChanged;
  Function(String?)? onFieldSubmitted;

  RadioMenuForm({Key? key,
    this.title = "Radio Menu",
    this.readOnly=true,
    this.managers=true,
    this.selected,
    this.placeHolder = "...",
    required this.list,
    this.onChanged,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  State<RadioMenuForm> createState() => _RadioMenuFormState();
}

class _RadioMenuFormState extends State<RadioMenuForm> {
  String? selected;
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
                              widget.onFieldSubmitted!(widget.selected);
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
              ? Text( widget.selected==null? widget.placeHolder:widget.selected.toString(),
            style: widget.selected==null?AppTextStyle.formPlaceHolderStyleTexte:AppTextStyle.formStyleTexte,
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.list!.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: RadioButton(
                      content:Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(i,style: AppTextStyle.filedTexte.copyWith(fontWeight: FontWeight.bold),),
                      ),
                        checked: i==selected,
                        onChanged: (checked) {
                          if (checked) {
                            setState((){selected = i;});
                          }
                        },
                      style: RadioButtonThemeData(
                        checkedDecoration: ButtonState.all(BoxDecoration(
                          color: AppColors.bleu,
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

