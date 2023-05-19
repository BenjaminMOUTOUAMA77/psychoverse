import 'dart:convert';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Forms/formBox.dart';
import 'package:psychoverse/Ui/Components/Forms/myTexte.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class BigTextForm extends StatefulWidget {
  final String title;
  String data;
  String placehholder;
  bool readOnly = true;
  Function(String) onFieldSubmitted;

  BigTextForm({
    Key? key,
    this.title = "Big Texte Form",
    this.data = "",
    this.placehholder = "...",
    required this.onFieldSubmitted,
  }) : super(key: key);

  String getData() {
    if (data == null || data.isEmpty) {
      return jsonEncode([
        {"insert": "\n"}
      ]);
    } else {
      return data;
    }
  }

  @override
  State<BigTextForm> createState() => _BigTextFormState();
}

class _BigTextFormState extends State<BigTextForm> {
  @override
  Widget build(BuildContext context) {
    QuillController controller = QuillController(
      document: Document.fromJson(jsonDecode(widget.getData())),
      selection: TextSelection.collapsed(offset: 0),
    );

    return AppFormBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyTexte(
                texte: widget.title,
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
                                  setState(() {
                                    widget.data = jsonEncode(
                                        controller.document.toDelta().toJson());
                                    widget.onFieldSubmitted(widget.data);
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
                              fontWeight: FontWeight.w400, fontSize: 12.sp + 5),
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
