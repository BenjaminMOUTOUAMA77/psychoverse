import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_fade/image_fade.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';
import 'package:psychoverse/models/quotes.dart';
import 'dart:math';
import '../../screens/Home/HomeProviders/sliderItemProvider.dart';

class QuoteSlider extends StatefulWidget {
  final String texte;
  final String image;
  final String author;
  const QuoteSlider(
      {Key? key,
      required this.texte,
      required this.image,
      required this.author})
      : super(key: key);

  @override
  State<QuoteSlider> createState() => _QuoteSliderState();
}

class _QuoteSliderState extends State<QuoteSlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 700.w,
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
          child: ImageFade(
            width: double.infinity,
            height: double.infinity,
            image: AssetImage(widget.image),
            // slow fade for newly loaded images:
            duration: const Duration(milliseconds: 900),
            syncDuration: const Duration(milliseconds: 150),
            alignment: Alignment.center,
            fit: BoxFit.cover,
            placeholder: Container(
              color: AppColors.grisLite,
              alignment: Alignment.center,
              child: Opacity(
                opacity: 0.5,
                child: SvgPicture.asset(AppIcons.logoSymbole, height: 250.h),
              ),
            ),
            errorBuilder: (context, error) => Container(
              color: AppColors.blanc,
              alignment: Alignment.center,
              child: SvgPicture.asset(AppIcons.logoSymbole,
                  color: AppColors.primary, height: 20),
            ),
          ),
        ),
        Gap(30.w),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              padding: EdgeInsets.all(30.w),
              alignment: AlignmentDirectional.center,
              width: 700.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                color: AppColors.primary,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary,
                    blurRadius: 1,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "« ${widget.texte} »",
                    style: AppTextStyle.quoteTexte.copyWith(fontSize: 28.sp),
                    textAlign: TextAlign.justify,
                  ),
                  Gap(20.h),
                  Text(
                    widget.author,
                    style: AppTextStyle.quoteTexte.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w900,
                        color: AppColors.grisLite),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Positioned(
              height: 30.h,
              top: 20.h,
              child: Opacity(
                opacity: 0.4,
                child: Transform.rotate(
                    angle: pi,
                    child: SvgPicture.asset(AppIcons.quote,
                        color: AppColors.blanc)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

List<Widget> getItems() => getQuotes().map((i) {
      return Builder(
        builder: (BuildContext context) {
          return QuoteSlider(texte: i.texte, image: i.image, author: i.author);
        },
      );
    }).toList();

List<Quote> getQuotes() {
  return [
    Quote(
        image: "assets/images/im2.jpg",
        texte:
            "Seuls les psychologues inventent des mots pour les choses qui n'existent pas !"),
    Quote(
        image: "assets/images/im3.jpg",
        texte:
            "Jamais la psychologie ne pourra dire sur la folie la vérité, puisque c'est la folie qui détient la vérité de la psychologie."),
    Quote(
        image: "assets/images/im4.jpg",
        texte:
            "La psychologie est la science qui vous apprend des choses que vous savez déjà en des termes que vous ne comprenez pas"),
    Quote(
        image: "assets/images/im5.jpg",
        texte:
            "Seuls les psychologues inventent des mots pour les choses qui n'existent pas !"),
    Quote(
        image: "assets/images/im6.jpg",
        texte:
            "La psychologie c'est l'art de faire croire aux autres que nous les comprenons"),
    Quote(
        image: "assets/images/im7.jpg",
        texte:
            "Seuls les psychologues inventent des mots pour les choses qui n'existent pas !"),
    Quote(
        image: "assets/images/im8.jpg",
        texte:
            "Ne fais pas de psychologie dans la colère, tu verrais trop juste"),
    Quote(
        image: "assets/images/im1.jpg",
        texte:
            "Seuls les psychologues inventent des mots pour les choses qui n'existent pas !"),
  ];
}

Function(int index, CarouselPageChangedReason changeReason) onSlide(
    SliderItemProvider sliderItem) {
  return (int index, CarouselPageChangedReason changeReason) {
    sliderItem.set(index);
    print(sliderItem.slide);
  };
}

CarouselOptions getOptions(context, SliderItemProvider sliderItem) =>
    CarouselOptions(
      height: 340.h,
      initialPage: sliderItem.slide,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 60),
      autoPlayAnimationDuration: const Duration(milliseconds: 2000),
      autoPlayCurve: Curves.fastOutSlowIn,
      scrollDirection: Axis.vertical,
      pauseAutoPlayOnTouch: false,
      enlargeCenterPage: true,
      enlargeFactor: 0.5,
      viewportFraction: 0.97,
      onPageChanged: onSlide(sliderItem),
    );
