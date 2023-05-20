import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Forms/formBox.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class SuggestTextForm extends StatefulWidget {
  final String title;
  String? value;
  String? selected;
  String placeHolder;
  bool readOnly;
  bool managers;
  List<String> list;
  TextEditingController controller = TextEditingController();
  Function(String?) onChanged;
  Function(String?) onFieldSubmitted;

  SuggestTextForm({
    Key? key,
    this.title = "SuggestForm",
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
  State<SuggestTextForm> createState() => _SuggestTextFormState();
}

class _SuggestTextFormState extends State<SuggestTextForm> {
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
                                    widget.value==null?widget.controller.clear()
                                    :widget.controller.value=TextEditingValue(text:widget.value.toString());
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
                                  if(!widget.list.contains(widget.controller.text)){
                                    widget.list.add(widget.controller.text);
                                    widget.selected=widget.controller.text;
                                  }
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
              :AutoSuggestBox<String>(
            controller: widget.controller,
            items: widget.list.map((e) {
              return AutoSuggestBoxItem<String>(
                  value: e,
                  label: e,
                  onFocusChange: (focused) {
                    if (focused) {
                      debugPrint(e);
                    }
                  });
            }).toList(),
            onSelected: (value) {
              setState(() => widget.selected = value.value);
            },
            style: AppTextStyle.formStyleTexte,
            decoration: BoxDecoration(
              border: Border.all(
                style: BorderStyle.none,
              ),
            ),
            unfocusedColor: Colors.transparent,
            cursorColor: AppColors.rouge,
            placeholder: widget.placeHolder,
            clearButtonEnabled: false,
            placeholderStyle: AppTextStyle.formPlaceHolderStyleTexte,
          ),
        ],
      ),
    );
  }
}
