import 'dart:convert';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Forms/zFormBox.dart';
import 'package:psychoverse/Ui/Components/Forms/zQuillTexte.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class BigTextForm extends StatefulWidget {
  final String title;
  String? value;
  String placehholder;
  bool readOnly;
  bool managers;
  Function(String?)? onFieldSubmitted;

  BigTextForm({
    Key? key,
    this.title = "Big Texte Form",
    this.readOnly=true,
    this.managers=true,
    this.value,
    this.placehholder = "Text",
    this.onFieldSubmitted,
  }) : super(key: key);


  @override
  State<BigTextForm> createState() => _BigTextFormState();
}

class _BigTextFormState extends State<BigTextForm> {

  String getData() {
  if (widget.value == null || widget.value!.isEmpty) {
    return jsonEncode([
      {"insert": "\n"}
    ]);
  } else {
    return widget.value!;
  }
}

  @override
  Widget build(BuildContext context) {

    QuillController controller = QuillController(
      document: Document.fromJson(jsonDecode(getData())),
      selection: TextSelection.collapsed(offset: 0),
    );
    return AppFormBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuillTexte(
                texte: widget.title,
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
                                  setState(() {
                                    widget.value = jsonEncode(
                                        controller.document.toDelta().toJson());
                                    widget.onFieldSubmitted!(widget.value!);
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
          Column(
            children: [
              widget.readOnly
                  ? Gap(20.h)
                  : Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: QuillToolbar.basic(
                        controller: controller,
                        fontSizeValues: const {
                          '2': '2',
                          '4': '4',
                          '6': '6',
                          '8': '8',
                          '10': '10',
                          '12': '12',
                          '14': '14',
                          '16': '16',
                          '18': '18',
                          '20': '20',
                          '22': '22',
                          '24': '24',
                          '26': '26',
                          '28': '28',
                          '30': '30',
                          '34': '34',
                          '38': '38',
                          '42': '42',
                          '46': '46',
                          '50': '50',
                          '55': '55',
                          '60': '60',
                          '65': '65',
                          '70': '70'
                        },
                        showAlignmentButtons: true,
                        showSmallButton: false,
                        showDirection: true,
                        color: AppColors.rouge,
                        iconTheme: QuillIconTheme(
                          iconSelectedColor: AppColors.blanc,
                          iconUnselectedColor: AppColors.gris,
                          iconSelectedFillColor: AppColors.rouge,
                          iconUnselectedFillColor: Colors.transparent,
                          disabledIconColor: AppColors.blanc,
                          disabledIconFillColor: AppColors.grisLitePlus,
                          borderRadius: 10,
                        ),
                        dialogTheme: QuillDialogTheme(
                          labelTextStyle: AppTextStyle.formStyleTexte,
                          inputTextStyle: AppTextStyle.filedTexte.copyWith(
                              fontWeight: FontWeight.w400, fontSize: 12.sp + 10),
                        ),
                      ),
                    ),
              QuillEditor.basic(
                controller: controller,
                readOnly: widget.readOnly,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
