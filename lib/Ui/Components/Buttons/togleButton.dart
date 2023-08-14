import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class MakeToggleMenu extends StatefulWidget {
  int type;
  bool showModeControle;
  bool mode;
  List<String> menu;
  List<int> selectedMenuNums;
  int selectedMenuNum;
  Function({bool mode,List<String> menu,List<int> selectedMenuNums,int selectedMenuNum,List<String> getSelectedOnString}) onChanged;

  MakeToggleMenu({
    Key? key,
    required this.menu,
    this.selectedMenuNum = 0,
    required this.selectedMenuNums,
    this.mode = true,
    this.showModeControle = true,
    this.type = 1,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<MakeToggleMenu> createState() => _MakeToggleMenuState();

  int get getType => type;
  bool get getShowModeControle => showModeControle;
  bool get getMode=>mode;
  List<String> get getMenu=>menu;
  List<int> get getSelectedMenuNums=>selectedMenuNums;
  int get getSelectedMenuNum=>selectedMenuNum;

  List<String> selectedMenus() {
    List<String> menus = [];
    for (int i in selectedMenuNums) {
      menus.add(menu[i]);
    }
    return menus;
  }
  String selectedMenu() => menu[selectedMenuNum];

  List<String> getSelected() {
    if (mode) {
      return selectedMenus();
    } else {
      return [selectedMenu()];
    }
  }
}
class _MakeToggleMenuState extends State<MakeToggleMenu> {
  @override
  Widget build(BuildContext context) {
    List<bool> boolStock = [];

    initBoolStock() {
      for (int i = 0; i < widget.menu.length; i++) {
        boolStock.add(false);
      }
      if (widget.mode) {
        for (int i in widget.selectedMenuNums) {
          boolStock[i] = true;
        }
      } else {
        boolStock[widget.selectedMenuNum] = true;
      }
    }

    initBoolStock();
    toggleElements(int active) {
      setState(() {
        if (widget.mode) {
          if (widget.selectedMenuNums.contains(active)) {
            widget.selectedMenuNums.remove(active);
          } else {
            widget.selectedMenuNums.add(active);
          }
        } else {
          widget.selectedMenuNum = active;
        }
        initBoolStock();
      });
      widget.onChanged(mode: widget.getMode,menu:widget.getMenu,selectedMenuNums:widget.selectedMenuNums,selectedMenuNum : widget.getSelectedMenuNum,getSelectedOnString:widget.getSelected());
    }

    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.menu.length,
                    (i) => Row(
                      children: [
                        Gap(10.w),
                        widget.type == 1? AppToggleButton(
                          texte: widget.menu[i],
                          checked: boolStock[i],
                          toggle: () => toggleElements(i),
                        ) : AppToggleMenuButton(texte: widget.menu[i],
                          checked: boolStock[i],
                          toggle: () => toggleElements(i),),
                        Gap(10.w),
                      ],
                    ),
                  ),),
            ),
          ),
        ),
        Gap(50.w),
        Visibility(
          visible: widget.showModeControle,
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.mode = !widget.mode;
                initBoolStock();
                widget.onChanged(mode: widget.mode,menu:widget.menu,selectedMenuNums:widget.selectedMenuNums,selectedMenuNum : widget.getSelectedMenuNum,getSelectedOnString:widget.getSelected());
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.rouge,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.mode
                      ? Icon(
                          FluentIcons.list,
                          color: AppColors.blanc,
                        )
                      : Icon(
                          FluentIcons.slider_handle_size,
                          color: AppColors.blanc,
                        ),
                  Gap(10.w),
                  widget.mode
                      ? Text(
                          "Liste",
                          style: AppTextStyle.buttonStyleTexte,
                        )
                      : Text(
                          "Slide",
                          style: AppTextStyle.buttonStyleTexte,
                        ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ToggleButton
class AppToggleButton extends StatefulWidget {
  bool checked;
  String texte;
  VoidCallback toggle;
  AppToggleButton({
    Key? key,
    this.checked = false,
    this.texte = "TogleButton",
    required this.toggle,
  }) : super(key: key);

  @override
  State<AppToggleButton> createState() => _AppToggleButtonState();
}
class _AppToggleButtonState extends State<AppToggleButton> {
  @override
  Widget build(BuildContext context) {
    return ToggleButton(
      style: ToggleButtonThemeData(
        uncheckedButtonStyle: ButtonStyle(
          shape: ButtonState.all<OutlinedBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                  color: AppColors.grisLite.withOpacity(0.3),
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter),
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
          ),
          padding: ButtonState.all(
              EdgeInsets.symmetric(horizontal: 15.w+10, vertical: 5.h+3)),
          textStyle: ButtonState.all(
              TextStyle(color: AppColors.gris, fontSize: 7.sp+10,)),
          backgroundColor: ButtonState.all(AppColors.blancGrise),
        ),
        checkedButtonStyle: ButtonStyle(
          shape: ButtonState.all<OutlinedBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                  color: AppColors.grisLite.withOpacity(0.3),
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter),
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
          ),
          padding: ButtonState.all(
              EdgeInsets.symmetric(horizontal: 15.w+10, vertical: 5.h+3)),
          textStyle: ButtonState.all(
              TextStyle(color: AppColors.blanc, fontSize: 7.sp+10)),
          backgroundColor: ButtonState.all(AppColors.rouge),
        ),
      ),
      checked: widget.checked,
      onChanged: (value) {
        widget.toggle();
      },
      child: Text(
        widget.texte,
        style:
            TextStyle(color: widget.checked ? AppColors.blanc : AppColors.gris),
      ),
    );
  }
}

// ToggleMenuButton
class AppToggleMenuButton extends StatefulWidget {
  bool checked;
  String texte;
  VoidCallback toggle;
  AppToggleMenuButton({
    Key? key,
    this.checked = false,
    this.texte = "TogleButton",
    required this.toggle,
  }) : super(key: key);

  @override
  State<AppToggleMenuButton> createState() => _AppToggleMenuButtonState();
}
class _AppToggleMenuButtonState extends State<AppToggleMenuButton> {
  @override
  Widget build(BuildContext context) {
    return ToggleButton(
      style: ToggleButtonThemeData(
        uncheckedButtonStyle: ButtonStyle(
          shape: ButtonState.all<OutlinedBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                  color: AppColors.blancGrise,
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          padding: ButtonState.all(
              EdgeInsets.symmetric(horizontal: 20.w+5, vertical: 10.h+5)),
          textStyle: ButtonState.all(
              TextStyle(color: AppColors.primary, fontSize: 7.sp+10, fontWeight: FontWeight.bold)),
          backgroundColor: ButtonState.all(AppColors.blancGrise.withOpacity(0.3)),
        ),
        checkedButtonStyle: ButtonStyle(
          shape: ButtonState.all<OutlinedBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                  color: AppColors.blancGrise,
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          padding: ButtonState.all(
              EdgeInsets.symmetric(horizontal: 20.w+5, vertical: 10.h+5)),
          textStyle: ButtonState.all(
              TextStyle(color: AppColors.blanc, fontSize: 7.sp+10, fontWeight: FontWeight.bold)),
          backgroundColor: ButtonState.all(AppColors.primary),
        ),
      ),
      checked: widget.checked,
      onChanged: (value) {
        widget.toggle();
      },
      child: Text(
        widget.texte,
        style:
            TextStyle(color: widget.checked ? AppColors.blanc : AppColors.primary),
      ),
    );
  }
}
