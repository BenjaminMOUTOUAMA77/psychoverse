import 'dart:io';

import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/HomeProviders/sliderItemProvider.dart';
import 'package:psychoverse/Ui/Components/AllOthers/imagePlaceholder.dart';
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
            texte:
                "Seuls les psychologues inventent des mots pour les choses qui n'existent pas !"),
        Quote(
            texte:
                "Jamais la psychologie ne pourra dire sur la folie la vérité, puisque c'est la folie qui détient la vérité de la psychologie."),
        Quote(
            texte:
                "La psychologie est la science qui vous apprend des choses que vous savez déjà en des termes que vous ne comprenez pas"),
        Quote(
            texte:
                "Seuls les psychologues inventent des mots pour les choses qui n'existent pas !"),
        Quote(
            texte:
                "La psychologie c'est l'art de faire croire aux autres que nous les comprenons"),
        Quote(
            texte:
                "Seuls les psychologues inventent des mots pour les choses qui n'existent pas !"),
        Quote(
            texte:
                "Ne fais pas de psychologie dans la colère, tu verrais trop juste"),
        Quote(
            texte:
                "Seuls les psychologues inventent des mots pour les choses qui n'existent pas !"),
      ];
    }

    List<Widget> getItems() => getQuotes().map((i) {
          return Builder(
            builder: (BuildContext context) {
              return QuoteSlide(
                  texte: i.texte, image: i.image, author: i.author);
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
        viewportFraction: 1,
        onPageChanged: onSlide,
      ),
    );
  }
}

class QuoteSlide extends StatefulWidget {
  final String texte;
  final String? image;
  final String author;
  const QuoteSlide(
      {Key? key, this.texte = "Texte", this.image, this.author = "Author"})
      : super(key: key);

  @override
  State<QuoteSlide> createState() => _QuoteSlideState();
}

class _QuoteSlideState extends State<QuoteSlide> {
  @override
  Widget build(BuildContext context) {
    ScrollController myScrolController = ScrollController(
      keepScrollOffset: false,
    );
    return Row(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            child: widget.image == null
                ? const ImagePlaceholder()
                : Image.file(File(widget.image!), fit: BoxFit.cover),
          ),
        ),
        Expanded(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 50.h, bottom: 10.h, left: 70.w, right: 70.w),
                alignment: AlignmentDirectional.center,
                width: double.infinity,
                color: getColor(),
                child: AdaptiveLayout(
                  smallLayout: SingleChildScrollView(
                    controller: myScrolController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "« ${widget.texte} »",
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: AppTextStyle.quoteTexte
                              .copyWith(fontSize: 30.sp + 5),
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
                  ),
                  mediumLayout: SingleChildScrollView(
                    controller: myScrolController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "« ${widget.texte} »",
                          style:
                              AppTextStyle.quoteTexte.copyWith(fontSize: 30.sp),
                          textAlign: TextAlign.justify,
                        ),
                        Gap(40.h),
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
              Positioned(
                height: 50.h,
                top: 50.h,
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
        ),
      ],
    );
  }
}
