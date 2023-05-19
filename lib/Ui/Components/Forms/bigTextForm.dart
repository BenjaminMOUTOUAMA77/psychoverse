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

  Delta getDataDelta(String value) {
    Delta data = new Delta();
    if (value == null || value.isEmpty) {
      data.insert('Hello \n', {"bold": true});
    } else {}
    return data;
  }

  @override
  State<BigTextForm> createState() => _BigTextFormState();
}

class _BigTextFormState extends State<BigTextForm> {
  @override
  Widget build(BuildContext context) {
    var data = [
      {"insert": "Flutter Quill"},
      {
        "attributes": {"header": 1},
        "insert": "\n"
      },
      {
        "insert": {
          "video":
              "https://www.youtube.com/watch?v=V4hgdKhIqtc&list=PLbhaS_83B97s78HsDTtplRTEhcFsqSqIK&index=1"
        }
      },
      {
        "insert": {
          "video":
              "https://user-images.githubusercontent.com/122956/126238875-22e42501-ad41-4266-b1d6-3f89b5e3b79b.mp4"
        }
      },
      {"insert": "\nRich text editor for Flutter"},
      {
        "attributes": {"header": 2},
        "insert": "\n"
      },
      {"insert": "Quill component for Flutter"},
      {
        "attributes": {"header": 3},
        "insert": "\n"
      },
      {"insert": "This "},
      {
        "attributes": {"italic": true, "background": "transparent"},
        "insert": "library"
      },
      {"insert": " supports "},
      {
        "attributes": {"bold": true, "background": "#ebd6ff"},
        "insert": "mobile"
      },
      {"insert": " platform "},
      {
        "attributes": {"underline": true, "bold": true, "color": "#e60000"},
        "insert": "only"
      },
      {
        "attributes": {"color": "rgba(0, 0, 0, 0.847)"},
        "insert": " and "
      },
      {
        "attributes": {"strike": true, "color": "black"},
        "insert": "web"
      },
      {"insert": " is not supported.\nYou are welcome to use "},
      {
        "attributes": {"link": "https://bulletjournal.us/home/index.html"},
        "insert": "Bullet Journal"
      },
      {
        "insert":
            ":\nTrack personal and group journals (ToDo, Note, Ledger) from multiple views with timely reminders"
      },
      {
        "attributes": {"list": "ordered"},
        "insert": "\n"
      },
      {
        "insert":
            "Share your tasks and notes with teammates, and see changes as they happen in real-time, across all devices"
      },
      {
        "attributes": {"list": "ordered"},
        "insert": "\n"
      },
      {
        "insert":
            "Check out what you and your teammates are working on each day"
      },
      {
        "attributes": {"list": "ordered"},
        "insert": "\n"
      },
      {"insert": "\nSplitting bills with friends can never be easier."},
      {
        "attributes": {"list": "bullet"},
        "insert": "\n"
      },
      {"insert": "Start creating a group and invite your friends to join."},
      {
        "attributes": {"list": "bullet"},
        "insert": "\n"
      },
      {
        "insert":
            "Create a BuJo of Ledger type to see expense or balance summary."
      },
      {
        "attributes": {"list": "bullet"},
        "insert": "\n"
      },
      {
        "insert":
            "\nAttach one or multiple labels to tasks, notes or transactions. Later you can track them just using the label(s)."
      },
      {
        "attributes": {"blockquote": true},
        "insert": "\n"
      },
      {"insert": "\nvar BuJo = 'Bullet' + 'Journal'"},
      {
        "attributes": {"code-block": true},
        "insert": "\n"
      },
      {"insert": "\nStart tracking in your browser"},
      {
        "attributes": {"indent": 1},
        "insert": "\n"
      },
      {"insert": "Stop the timer on your phone"},
      {
        "attributes": {"indent": 1},
        "insert": "\n"
      },
      {"insert": "All your time entries are synced"},
      {
        "attributes": {"indent": 2},
        "insert": "\n"
      },
      {"insert": "between the phone apps"},
      {
        "attributes": {"indent": 2},
        "insert": "\n"
      },
      {"insert": "and the website."},
      {
        "attributes": {"indent": 3},
        "insert": "\n"
      },
      {"insert": "\n"},
      {"insert": "\nCenter Align"},
      {
        "attributes": {"align": "center"},
        "insert": "\n"
      },
      {"insert": "Right Align"},
      {
        "attributes": {"align": "right"},
        "insert": "\n"
      },
      {"insert": "Justify Align"},
      {
        "attributes": {"align": "justify"},
        "insert": "\n"
      },
      {"insert": "Have trouble finding things? "},
      {
        "attributes": {"list": "ordered"},
        "insert": "\n"
      },
      {"insert": "Just type in the search bar"},
      {
        "attributes": {"indent": 1, "list": "ordered"},
        "insert": "\n"
      },
      {"insert": "and easily find contents"},
      {
        "attributes": {"indent": 2, "list": "ordered"},
        "insert": "\n"
      },
      {"insert": "across projects or folders."},
      {
        "attributes": {"indent": 2, "list": "ordered"},
        "insert": "\n"
      },
      {"insert": "It matches text in your note or task."},
      {
        "attributes": {"indent": 1, "list": "ordered"},
        "insert": "\n"
      },
      {"insert": "Enable reminders so that you will get notified by"},
      {
        "attributes": {"list": "ordered"},
        "insert": "\n"
      },
      {"insert": "email"},
      {
        "attributes": {"indent": 1, "list": "ordered"},
        "insert": "\n"
      },
      {"insert": "message on your phone"},
      {
        "attributes": {"indent": 1, "list": "ordered"},
        "insert": "\n"
      },
      {"insert": "popup on the web site"},
      {
        "attributes": {"indent": 1, "list": "ordered"},
        "insert": "\n"
      },
      {"insert": "Create a BuJo serving as project or folder"},
      {
        "attributes": {"list": "bullet"},
        "insert": "\n"
      },
      {"insert": "Organize your"},
      {
        "attributes": {"indent": 1, "list": "bullet"},
        "insert": "\n"
      },
      {"insert": "tasks"},
      {
        "attributes": {"indent": 2, "list": "bullet"},
        "insert": "\n"
      },
      {"insert": "notes"},
      {
        "attributes": {"indent": 2, "list": "bullet"},
        "insert": "\n"
      },
      {"insert": "transactions"},
      {
        "attributes": {"indent": 2, "list": "bullet"},
        "insert": "\n"
      },
      {"insert": "under BuJo "},
      {
        "attributes": {"indent": 3, "list": "bullet"},
        "insert": "\n"
      },
      {"insert": "See them in Calendar"},
      {
        "attributes": {"list": "bullet"},
        "insert": "\n"
      },
      {"insert": "or hierarchical view"},
      {
        "attributes": {"indent": 1, "list": "bullet"},
        "insert": "\n"
      },
      {"insert": "this is a check list"},
      {
        "attributes": {"list": "checked"},
        "insert": "\n"
      },
      {"insert": "this is a uncheck list"},
      {
        "attributes": {"list": "unchecked"},
        "insert": "\n"
      },
      {"insert": "Font "},
      {
        "attributes": {"font": "sans-serif"},
        "insert": "Sans Serif"
      },
      {"insert": " "},
      {
        "attributes": {"font": "serif"},
        "insert": "Serif"
      },
      {"insert": " "},
      {
        "attributes": {"font": "monospace"},
        "insert": "Monospace"
      },
      {"insert": " Size "},
      {
        "attributes": {"size": "small"},
        "insert": "Small"
      },
      {"insert": " "},
      {
        "attributes": {"size": "large"},
        "insert": "Large"
      },
      {"insert": " "},
      {
        "attributes": {"size": "huge"},
        "insert": "Huge"
      },
      {
        "attributes": {"size": "15.0"},
        "insert": "font size 15"
      },
      {"insert": " "},
      {
        "attributes": {"size": "35"},
        "insert": "font size 35"
      },
      {"insert": " "},
      {
        "attributes": {"size": "20"},
        "insert": "font size 20"
      },
      {
        "attributes": {"token": "built_in"},
        "insert": " diff"
      },
      {
        "attributes": {"token": "operator"},
        "insert": "-match"
      },
      {
        "attributes": {"token": "literal"},
        "insert": "-patch"
      },
      {
        "insert": {
          "image":
              "https://user-images.githubusercontent.com/122956/72955931-ccc07900-3d52-11ea-89b1-d468a6e2aa2b.png"
        },
        "attributes": {"width": "230", "style": "display: block; margin: auto;"}
      },
      {"insert": "\n"}
    ];
    QuillController controller = QuillController(
      document: Document.fromDelta(widget.getDataDelta(widget.data)),
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
                                    print(controller.document
                                        .toDelta()
                                        .toString());
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
