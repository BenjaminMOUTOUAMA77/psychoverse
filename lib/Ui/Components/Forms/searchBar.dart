import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/Buttons/togleButton.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class MakeSearchBar extends StatefulWidget {
  bool withComboFilter;
  bool withToggleFilter;

  String? textValue;
  String? textSelected;
  List<String> textList;

  String? comboFilterSelected;
  List<String> comboFilterList;

  String? toggleFilterSelected;
  List<String> toggleFilterList;
  TextEditingController controller = TextEditingController();
  Function({String? comboFilter,String? toggleFilter, String? text}) onChanged;
  Function({String? comboFilter,String? toggleFilter, String? text}) onFieldSubmitted;

  var formKey = GlobalKey<FormState>();
  MakeSearchBar({
    Key? key,
    this.withComboFilter = false,
    this.withToggleFilter = false,
    this.textSelected,
    this.comboFilterSelected,
    this.toggleFilterSelected,
    this.textValue,
    this.textList = const [],
    this.comboFilterList = const [],
    this.toggleFilterList= const [],
    required this.onChanged,
    required this.onFieldSubmitted,
  }) : super(key: key);

  GlobalKey getFormKey() => formKey;
  TextEditingController getController() => controller;

  @override
  State<MakeSearchBar> createState() => _MakeSearchBarState();
}

class _MakeSearchBarState extends State<MakeSearchBar> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.blancGrise,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              AppDesignEffects.shadow0,
            ],
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if(!widget.comboFilterList.contains(widget.controller.text)){
                    widget.comboFilterList.add(widget.controller.text);
                  }
                  widget.onFieldSubmitted(
                      toggleFilter: widget.toggleFilterSelected,
                      comboFilter: widget.comboFilterSelected,
                      text: widget.controller.text);
                },
                child: Container(
                  padding: EdgeInsets.all(15.h),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: getColor(),
                    boxShadow: [
                      AppDesignEffects.shadow2,
                    ],
                  ),
                  child: Transform.rotate(
                    angle: 30,
                    child: Icon(
                      FluentIcons.search_art64,
                      color: AppColors.blanc,
                      size: 30.h,
                    ),
                  ),
                ),
              ),
              Gap(10.w),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: AutoSuggestBox<String>(
                    controller: widget.controller,
                    items: widget.textList.map((e) {
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
                      setState(() => widget.textSelected = value.value);
                    },
                    style: AppTextStyle.formStyleTexte,
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.none,
                      ),
                    ),
                    unfocusedColor: Colors.transparent,
                    cursorColor: getColor(),
                    placeholder: "Rechercher ...",
                    clearButtonEnabled: false,
                    showCursor: true,
                    placeholderStyle: AppTextStyle.filedTexte.copyWith(
                      color: AppColors.grisLitePlus,
                    ),
                  ),
                ),
              ),
              Gap(10.w),
              SizedBox(
                height: 55.h,
                child: widget.withComboFilter? ComboBox<String>(
                  value: widget.comboFilterSelected,
                  items: widget.comboFilterList.map((e) {
                    return ComboBoxItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  style:
                  AppTextStyle.filedTexte.copyWith(fontWeight: FontWeight.bold),
                  onChanged: (value) {
                    setState(() => widget.comboFilterSelected = value);
                  },
                  icon: Icon(
                    FluentIcons.chevron_down_small,
                    size: 20.h,
                  ),
                  iconEnabledColor: AppColors.rouge,
                  iconDisabledColor: AppColors.gris,
                  focusColor: AppColors.rouge,
                  placeholder: const Text("Trier par"),
                  elevation: 1,
                ):const Gap(0),
              ),
            ],
          ),
        ),
        widget.withToggleFilter? Column(
          children: [
            Gap(15.h),
            Center(
              child: MakeToggleMenu(
                onChanged: (
                    {mode = true,
                      menu = const [],
                      selectedMenuNums = const [],
                      selectedMenuNum = 0,
                      getSelectedOnString = const []}) {
                  widget.toggleFilterSelected=menu[selectedMenuNum];
                  widget.onFieldSubmitted(text: widget.textValue,comboFilter: widget.comboFilterSelected,toggleFilter: widget.toggleFilterSelected);
                },
                mode: false,
                menu: widget.toggleFilterList,
                selectedMenuNums: [1],
                showModeControle: false,
              ),
            ),
          ],
        ):Gap(0),
      ],
    );
  }
}
