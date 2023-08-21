import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AllOthers/imagePlaceholder.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/PopUps/showImage.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';

class Quote extends StatefulWidget {
  const Quote({Key? key}) : super(key: key);

  @override
  State<Quote> createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  String image = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (context) => ShowImage(),
            ),
            child: Container(
              width: double.infinity,
              height: 500.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grisLite,
                    blurRadius: 1,
                    spreadRadius: 0.5,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(AppImages.logoSymbole),
                  fit: BoxFit.contain,
                ),
              ),
              child: image.isEmpty
                  ? const ImagePlaceholder()
                  : Image.file(
                      File(image),
                    ),
            ),
          ),
          Gap(20.w),
          Column(
            children: [
              TextForm(
                title: "Auteur",
                onChanged: (value) {},
                onFieldSubmitted: (value) {},
              ),
              BigTextForm(
                title: "Pensée",
                onFieldSubmitted: (value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
