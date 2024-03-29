import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/HomeProviders/sliderItemProvider.dart';
import 'package:psychoverse/Ui/Components/AllOthers/backgroungImage.dart';
import 'package:psychoverse/Ui/Components/Buttons/simpleAppButton.dart';
import 'package:psychoverse/Ui/Components/PopUps/zBigPopUp.dart';
import 'package:psychoverse/Ui/Components/Blocs/quote.dart';
import 'package:psychoverse/Ui/Components/Lists/quotesList.dart';
import 'package:psychoverse/Ui/Components/Titres/pageTitle.dart';

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SliderItemProvider()),
      ],
      child: Stack(
        children: [
          const MakeBackgroundImage(),
          Column(
            children: [
              PageTitle(title: "Quotes",icon: FluentIcons.right_double_quote,),
              Gap(50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SimpleAppButon(
                      texte: "Ajouter une citation", function: () {
                        showDialog(context: context, builder: (context)=>BigPopUp(title: "Nouvelle pensée",save: true,child: Quote(),));
                  }),
                ],
              ),
              Gap(20.h),
              Expanded(
                child: SingleChildScrollView(child: QuotesList(list: ["","","","","","","",],)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
