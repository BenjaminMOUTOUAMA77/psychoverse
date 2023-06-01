import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class MakeSearchBar extends StatefulWidget {

  String? value;
  String? selected;
  List<String> list;
  String? comboSelected;
  List<String> comboList;
  TextEditingController controller = TextEditingController();
  Function({String? filtre, String? text}) onChanged;
  Function({String? filtre, String? text}) onFieldSubmitted;

  var formKey = GlobalKey<FormState>();
  MakeSearchBar({Key? key,
    this.selected,
    this.comboSelected,
    this.value,
    this.list = const [],
    this.comboList = const [],
    required this.onChanged,
    required this.onFieldSubmitted,}) : super(key: key);

  GlobalKey getFormKey()=>formKey;
  TextEditingController getController()=>controller;

  @override
  State<MakeSearchBar> createState() => _MakeSearchBarState();
}

class _MakeSearchBarState extends State<MakeSearchBar> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.blanc,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          AppDesignEffects.shadow1,
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            height: 50.h,
            child: ComboBox<String>(
              value: widget.comboSelected,
              items: widget.comboList.map((e) {
                return ComboBoxItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              style: AppTextStyle.filedTexte
                  .copyWith(fontWeight: FontWeight.bold),
              onChanged:(value) {
                setState(() => widget.comboSelected = value);
              },
              icon: Icon(FluentIcons.chevron_down_small),
              iconEnabledColor: AppColors.rouge,
              iconDisabledColor: AppColors.gris,
              focusColor: AppColors.rouge,
              placeholder: Text("Trier par"),
            ),
          ),
          Gap(10.w),
          Expanded(
            child: Form(
              key: _formKey,
              child: AutoSuggestBox<String>(
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
                placeholder: "Rechercher ...",
                clearButtonEnabled: false,
                showCursor: true,
                placeholderStyle: AppTextStyle.filedTexte.copyWith(fontWeight: FontWeight.bold,color: AppColors.grisLitePlus,),
              ),
            ),
          ),
          Gap(10.w),
          GestureDetector(
            onTap: ()=>widget.onFieldSubmitted(filtre: widget.comboSelected,text: widget.controller.text),
            child: Container(
              padding: EdgeInsets.all(15.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.rouge,
                boxShadow: [
                  AppDesignEffects.shadow2,
                ],
              ),
              child: Transform.rotate(
                angle: 30,
                child: Icon(
                  FluentIcons.search_art64,
                  color: AppColors.blanc,
                  size: 40.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
