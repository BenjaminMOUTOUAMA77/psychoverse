import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Screens/connexion.dart';
import 'package:psychoverse/Ui/Components/AllOthers/backgroungImage.dart';
import 'package:psychoverse/Ui/Components/AllOthers/quotesSlider.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool synched = true;
  bool connected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const MakeBackgroundImage(),
        const Center(
          child: Column(
            children: [
              Expanded(
                child: MakeQuotesSlider(),
              ),
            ],
          ),
        ),
        Column(
          children: [
            const Expanded(child: Gap(0)),
            Row(
              children: [
                const Expanded(child: Gap(0)),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.blancGrise,
                    boxShadow: [
                      AppDesignEffects.shadow2,
                    ],
                    borderRadius: BorderRadius.circular(60),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Tooltip(
                        message: "Vérouiller",
                        child: IconButton(
                          icon: Icon(
                            FluentIcons.authenticator_app,
                            size: 26,
                            color: AppColors.primary,
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            FluentPageRoute(
                              builder: (BuildContext context) => Connexion(
                                firstTime: false,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(5),
                      Icon(
                        FluentIcons.gripper_dots_vertical,
                        color: AppColors.grisLite,
                      ),
                      const Gap(5),
                      Tooltip(
                        message: "7 rendez-vous aujourd'hui",
                        child: IconButton(
                          icon: Icon(
                            FluentIcons.calendar_mirrored,
                            size: 26,
                            color: AppColors.secondary,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const Gap(5),
                      Icon(
                        FluentIcons.gripper_dots_vertical,
                        color: AppColors.grisLite,
                      ),
                      const Gap(5),
                      Tooltip(
                        message: synched
                            ? "Sauvegarde complèté"
                            : "Sauvegarde incomplète",
                        child: IconButton(
                          icon: synched
                              ? Icon(
                                  FluentIcons.to_do_logo_inverse,
                                  size: 26,
                                  color: AppColors.primary,
                                )
                              : Icon(
                                  FluentIcons.cloud_not_synced,
                                  size: 26,
                                  color: AppColors.primary,
                                ),
                          onPressed: () {},
                        ),
                      ),
                      const Gap(5),
                      Icon(
                        FluentIcons.gripper_dots_vertical,
                        color: AppColors.grisLite,
                      ),
                      const Gap(5),
                      Tooltip(
                        message: synched
                            ? "Vous êtes Connecté !"
                            : "Vous êtes hors ligne !",
                        child: IconButton(
                          icon: synched
                              ? Icon(
                            FluentIcons.offline_one_drive_parachute,
                            size: 26,
                            color: AppColors.primary,
                          )
                              : Icon(
                            FluentIcons.offline_one_drive_parachute_disabled,
                            size: 26,
                            color: AppColors.primary,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: Gap(0)),
              ],
            ),
            Gap(50.h),
          ],
        ),
      ],
    );
  }
}
