import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AllOthers/adaptive.dart';
import 'package:psychoverse/Ui/Components/AllOthers/imagePlaceholder.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/dateForm.dart';
import 'package:psychoverse/Ui/Components/Forms/numberTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/phoneForm.dart';
import 'package:psychoverse/Ui/Components/Forms/suggestTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/PopUps/showImage.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class Relation extends StatefulWidget {
  final Function(String? genre)? onChanged;
  const Relation({Key? key, this.onChanged}) : super(key: key);

  @override
  State<Relation> createState() => _RelationState();
}

class _RelationState extends State<Relation> {
  String image = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Gap(20.h),
          Adaptive(
            first: GestureDetector(
              onTap: () => showDialog(
                  context: context, builder: (context) => ShowImage()),
              child: Container(
                width: double.infinity,
                height: 550.h,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grisLite,
                      blurRadius: 1,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: image.isEmpty
                    ? const ImagePlaceholder()
                    : Image.file(
                  File(image),
                ),
              ),
            ),
            second: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextForm(
                    title: "Nom prénoms",
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
                PhoneForm(
                  title: "Téléphone",
                ),
                TextForm(
                    title: "Email",
                    email: true,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
                TextForm(
                    title: "Adresse",
                    addresse: true,
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {}),
              ],
            ),
          ),
          Adaptive(
            first: SuggestTextForm(
                title: "Genre",
                list: const ["Masculin", "Féminin", "Trans", "Autre"],
                onChanged: (value) {},
                onFieldSubmitted: (value) {
                  widget.onChanged!(value);
                }),
            second: NumberTextForm(
              title: "Âge",
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
            ),
          ),
          Adaptive(
            first: SuggestTextForm(
                title: "Condition de résidence",
                list: ["Placé", "Exil", "Prison", "Location", "Maison propre"],
                onChanged: (value) {},
                onFieldSubmitted: (value) {}),
            second: SuggestTextForm(
                title: "Èthnie",
                list: ["Placé", "Exil", "Prison", "Location", "Maison propre"],
                onChanged: (value) {},
                onFieldSubmitted: (value) {}),
          ),
          Adaptive(
            first: AppDateForm(
                title: "Date de naissance",
                onChanged: (value) {},
                onFieldSubmitted: (value) {}),
            second: SuggestTextForm(
                title: "Lieu de naissance",
                list: [
                  "Calavi",
                  "Cotonou",
                  "Natitingou",
                ],
                onChanged: (value) {},
                onFieldSubmitted: (value) {}),
          ),
          Adaptive(
            first: SuggestTextForm(
                title: "Niveau d'étude",
                list: [
                  "Analphabet",
                  "Maternelle",
                  "CEP",
                  "Doctorat",
                  "Mater",
                ],
                onChanged: (value) {},
                onFieldSubmitted: (value) {}),
            second: SuggestTextForm(
                title: "Profession",
                list: [
                  "Analphabet",
                  "Maternelle",
                  "CEP",
                  "Doctorat",
                  "Mater",
                ],
                onChanged: (value) {},
                onFieldSubmitted: (value) {}),
          ),
          SuggestTextForm(
              title: "Réligion",
              list: [
                "Analphabet",
                "Maternelle",
                "CEP",
                "Doctorat",
                "Mater",
              ],
              onChanged: (value) {},
              onFieldSubmitted: (value) {}),
          BigTextForm(title: "Commentaire", onFieldSubmitted: (value) {}),
          const Gap(30),
        ],
      ),
    );
  }
}
