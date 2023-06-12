import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_fade/image_fade.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/HomeProviders/sliderItemProvider.dart';
import 'package:psychoverse/Ui/Utils/appColors.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';
import 'package:psychoverse/Ui/Utils/appTexteStyle.dart';
import 'package:psychoverse/models/quotes.dart';
import 'dart:math';

class MakeQuotesSlider extends StatefulWidget {
  const MakeQuotesSlider({Key? key}) : super(key: key);
  @override
  State<MakeQuotesSlider> createState() => _MakeQuotesSliderState();
}
class _MakeQuotesSliderState extends State<MakeQuotesSlider> {
  @override
  Widget build(BuildContext context) {
    SliderItemProvider sliderItem = Provider.of<SliderItemProvider>(context);
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
    List<Widget> getItems() => getQuotes().map((i) {
      return Builder(
        builder: (BuildContext context) {
          return QuoteSlide(texte: i.texte, image: i.image, author: i.author);
        },
      );
    }).toList();
    void onSlide(int index, CarouselPageChangedReason changeReason) {
      sliderItem.set(index);
    }
    return CarouselSlider(
      items: getItems(),
      options: CarouselOptions(
        height: double.infinity,
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
        onPageChanged: onSlide,
      ),
    );
  }
}

class QuoteSlide extends StatefulWidget {
  final String texte;
  final String image;
  final String author;
  const QuoteSlide(
      {Key? key,
      required this.texte,
      required this.image,
      required this.author})
      : super(key: key);

  @override
  State<QuoteSlide> createState() => _QuoteSlideState();
}
class _QuoteSlideState extends State<QuoteSlide> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container(
            width: double.infinity,
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
          ),),
          Gap(15.w),
          Expanded(child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                height: double.infinity,
                width:double.infinity,
                child: Acrylic(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                  blurAmount: 5,
                  luminosityAlpha: 5,
                  tint: AppColors.primary,
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.all(70.w),
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      color: Colors.transparent,
                    ),
                    child: AdaptiveLayout(
                      smallLayout: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "« ${widget.texte} »",
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: AppTextStyle.quoteTexte.copyWith(fontSize: 30.sp),
                            textAlign: TextAlign.justify,
                          ),
                          Gap(30.h),
                          Text(
                            widget.author,
                            style: AppTextStyle.quoteTexte.copyWith(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w900,
                                color: AppColors.grisLite),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      mediumLayout: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "« ${widget.texte} »",
                            style: AppTextStyle.quoteTexte.copyWith(fontSize: 30.sp),
                            textAlign: TextAlign.justify,
                          ),
                          Gap(50.h),
                          Text(
                            widget.author,
                            style: AppTextStyle.quoteTexte.copyWith(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w900,
                                color: AppColors.grisLite),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                height: 30.h,
                top: 10.h,
                child: Opacity(
                  opacity: 0.4,
                  child: Transform.rotate(
                      angle: pi,
                      child: SvgPicture.asset(AppIcons.quote,
                          color: AppColors.blanc)),
                ),
              ),
            ],
          ),),
        ],
      );
  }
}