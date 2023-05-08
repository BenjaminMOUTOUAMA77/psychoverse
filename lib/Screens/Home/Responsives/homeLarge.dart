import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/UI/Widgets/mainMenuBotton.dart';
import 'package:psychoverse/UI/Widgets/quotesSlider.dart';
import 'package:psychoverse/screens/Home/HomeProviders/sliderItemProvider.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';


class HomeLarge extends StatefulWidget {
  const HomeLarge({Key? key}) : super(key: key);

  @override
  State<HomeLarge> createState() => _HomeLargeState();
}

class _HomeLargeState extends State<HomeLarge> {
  late List<MainMenuButton> menu;

  @override
  void initState() {
    super.initState();
    menu = getMainMenu();
  }

  @override
  Widget build(BuildContext context) {
    SliderItemProvider sliderItem = Provider.of<SliderItemProvider>(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.pattern), fit: BoxFit.cover, opacity: 0.1),
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(30.h),
              CarouselSlider(
                items: getItems(),
                options: getOptions(context, sliderItem),
              ),
              const Gap(30),
              SizedBox(
                width: 1425.w,
                height: 650.h,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 20.h,
                      mainAxisSpacing: 20.h,
                      childAspectRatio: 10.w/5.h,
                    ),
                    itemCount: menu.length,
                    itemBuilder: (BuildContext context, int index) {
                      return menu[index];
                    }
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
