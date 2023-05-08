import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/UI/Widgets/mainMenuBotton.dart';
import 'package:psychoverse/UI/Widgets/quotesSlider.dart';
import 'package:psychoverse/screens/Home/HomeProviders/sliderItemProvider.dart';
import 'package:psychoverse/Ui/Utils/appImages.dart';

class HomeMedium extends StatefulWidget {
  const HomeMedium({Key? key}) : super(key: key);

  @override
  State<HomeMedium> createState() => _HomeMediumState();
}

class _HomeMediumState extends State<HomeMedium> {

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
            image: DecorationImage(
                image: AssetImage(AppImages.pattern),
                fit: BoxFit.fitWidth,
                opacity: 0.1),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(10),
              CarouselSlider(
                items: getItems(),
                options: getOptions(context, sliderItem),
              ),
              const Gap(30),
              SizedBox(
                width: 1425.w,
                height: 780.h,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.h,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: 10.w/3.5.h,
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
