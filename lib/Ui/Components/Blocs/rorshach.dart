import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:psychoverse/Ui/Components/AllOthers/imagePlaceholder.dart';
import 'package:psychoverse/Ui/Components/Forms/bigTextForm.dart';
import 'package:psychoverse/Ui/Components/Forms/textForm.dart';
import 'package:psychoverse/Ui/Components/Blocs/showImage.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';

class Rorshach extends StatefulWidget {
  const Rorshach({Key? key}) : super(key: key);

  @override
  State<Rorshach> createState() => _RorshachState();
}

class _RorshachState extends State<Rorshach> {
  String image= "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: ()=>showDialog(context: context, builder: (context)=>ShowImage(),),
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
              ),
              child: image.isEmpty
                  ? const ImagePlaceholder()
                  : Image.file(File(image),
              ),
            ),
          ),
          Gap(20.w),
          Column(
            children: [
              TextForm(
                title: "Designation",
                onChanged: (value){},
                onFieldSubmitted: (value){},
              ),
              BigTextForm(
                title: "Résultat" ,
                onFieldSubmitted: (value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
