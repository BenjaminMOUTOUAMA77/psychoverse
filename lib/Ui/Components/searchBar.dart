import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class MakeSearchBar extends StatefulWidget {
  var formKey = GlobalKey<FormState>();
  var controller = TextEditingController();
  Function(String) onChanged;
  MakeSearchBar({Key? key, required this.onChanged}) : super(key: key);

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
            child: DropDownButton(
              title: const Text('Par Nom'),
              items: [
                MenuFlyoutItem(text: const Text('Nom'), onPressed: () {}),
                const MenuFlyoutSeparator(),
                MenuFlyoutItem(
                    text: const Text('Numero de dossier'), onPressed: () {}),
                const MenuFlyoutSeparator(),
                MenuFlyoutItem(
                    text: const Text('Traitement'), onPressed: () {}),
              ],
            ),
          ),
          Gap(10.w),
          Expanded(
            child: Form(
              key: _formKey,
              child: TextFormBox(
                onChanged: (value)=>widget.onChanged(value),
                controller: controller,
                unfocusedColor: Colors.transparent,
                autofocus: true,
                decoration: BoxDecoration(
                  boxShadow: [
                    AppDesignEffects.shadow0,
                  ],
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.transparent,
                    style: BorderStyle.none,
                  ),
                ),
                keyboardType: TextInputType.text,
                highlightColor: Colors.transparent,
                placeholder: "Rechercher ...",
                placeholderStyle:
                    AppTextStyle.filedTexte.copyWith(color: AppColors.grisLite),
                padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
                cursorColor: AppColors.rouge,
                textAlignVertical: TextAlignVertical.center,
                style: AppTextStyle.filedTexte,
              ),
            ),
          ),
          Gap(10.w),
          GestureDetector(
            onTap: ()=>print("tapped"),
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
