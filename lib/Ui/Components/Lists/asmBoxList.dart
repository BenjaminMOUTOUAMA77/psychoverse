import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Models/users.dart';
import 'package:psychoverse/Ui/Components/Boxs/asmBox.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class AsmBoxList extends StatefulWidget {
  bool error;
  bool waiting;
  List<App_users> list;
  VoidCallback? onTap;
  AsmBoxList(
      {Key? key,
      this.error = false,
      this.waiting = false,
      this.list = const [],
      this.onTap})
      : super(key: key);

  @override
  State<AsmBoxList> createState() => _AsmBoxListState();
}

class _AsmBoxListState extends State<AsmBoxList> {
  @override
  void didUpdateWidget(covariant AsmBoxList oldWidget) {
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widget.error
        ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          FluentIcons.error_badge,

          size: 100.h,
          color: AppColors.primary,
        ),
        const Gap(5),
        Text("Erreur de recherche ", style: AppTextStyle.buttonStyleTexte.copyWith(color: AppColors.grisTexte),),
        const Gap(10),
        ProgressRing(),
      ],
    )
        : widget.waiting
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    FluentIcons.search_and_apps,
                    size: 100.h,
                    color: AppColors.primary,
                  ),
                  const Gap(5),
                  Text("Recherche ", style: AppTextStyle.buttonStyleTexte.copyWith(color: AppColors.grisTexte),),
                  const Gap(10),
                  ProgressRing(),
                ],
              )
            :widget.list.isEmpty? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          FluentIcons.fabric_user_folder,
          size: 100.h,
          color: AppColors.primary,
        ),
        const Gap(10),
        Text("Aucun profil créé",style: AppTextStyle.buttonStyleTexte.copyWith(color: AppColors.grisTexte),),
      ],
    ):  GridView.builder(
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 170,
                  childAspectRatio: 3.1 / 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: widget.list.length,
                itemBuilder: (BuildContext context, index) {
                  return AsmBox(
                    user: widget.list[index],
                    onTap: widget.onTap,
                  );
                });
  }
}
