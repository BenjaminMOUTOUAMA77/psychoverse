import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Functions/dbQueries.dart';
import 'package:psychoverse/Models/users.dart';
import 'package:psychoverse/Ui/Components/AllOthers/imagePlaceholder.dart';
import 'package:psychoverse/Ui/Components/PopUps/zSmallPopUp.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appDesignEffects.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';

class AsmBox extends StatefulWidget {
  PlatformFile? image;
  App_users user;
  VoidCallback? onTap;
  AsmBox({Key? key, this.image, required this.user, this.onTap})
      : super(key: key);

  @override
  State<AsmBox> createState() => _AsmBoxState();
}

class _AsmBoxState extends State<AsmBox> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.blanc,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: getColor(),
                    boxShadow: [
                      AppDesignEffects.shadow2,
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: AppColors.blanc,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      height: 150.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: widget.image == null
                          ? const ImagePlaceholder()
                          : Image.file(
                              File(widget.image!.path!),
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                    ),
                  ),
                ),
                const Gap(0),
                Text(
                  widget.user.nom!,
                  style: AppTextStyle.buttonStyleTexte.copyWith(
                      color: AppColors.noire, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.user.is_local_user!
                          ? FluentIcons.saved_offline
                          : FluentIcons.my_network,
                      color: AppColors.secondary,
                    ),
                    const Gap(5),
                    Text(
                      widget.user.is_local_user! ? "local" : "sync",
                      style: AppTextStyle.filedTexte,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: CommandBar(
            overflowBehavior: CommandBarOverflowBehavior.wrap,
            mainAxisAlignment: MainAxisAlignment.end,
            primaryItems: [],
            secondaryItems: [
              CommandBarBuilderItem(
                builder: (context, mode, w) => Tooltip(
                  message: "Supprimer",
                  child: w,
                ),
                wrappedItem: CommandBarButton(
                  icon: Icon(
                    FluentIcons.delete,
                    color: AppColors.secondary,
                  ),
                  label: const Text('Supprimer'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => SmallPopUp(
                        title: "Suppression de prpfil",
                        delete: true,
                        deleteTexte: "Supprimer quand même",
                        deleteFunction: (){
                          dbq.deleteUser(widget.user, true);
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: [
                            Text("Attention toutes les donnés concernants ce profils seront perdues !!")
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
