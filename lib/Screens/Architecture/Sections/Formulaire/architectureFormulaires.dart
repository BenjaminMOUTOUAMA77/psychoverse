import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:psychoverse/Providers/ArchitectureProvider/changeScreenProviderArchitecture.dart';
import 'package:psychoverse/Screens/Architecture/Sections/Formulaire/architectureFormulaireDetail.dart';
import 'package:psychoverse/Screens/Architecture/Sections/Formulaire/architectureFormulaireList.dart';
import 'package:psychoverse/Ui/Components/AppContainers/appContainer4.dart';

class ArchitectureFormulaires extends StatefulWidget {
  const ArchitectureFormulaires({Key? key}) : super(key: key);

  @override
  State<ArchitectureFormulaires> createState() => _ArchitectureFormulairesState();
}

class _ArchitectureFormulairesState extends State<ArchitectureFormulaires> {
  late ArchitectureFormulairePagesManagerProvider page;
  @override
  Widget build(BuildContext context) {
    page =Provider.of<ArchitectureFormulairePagesManagerProvider>(context);
    return AppContainer4(
      icon: FluentIcons.care_plan,
      title: "Formulaire",
      number: 10,
      child: SizedBox(
        height: 840.h,
        child: PageView(
          pageSnapping: false,
          controller: page.getPage(),
          onPageChanged: (value){page.setPage(value);},
          children: <Widget>[
            ArchitectureFormulaireList(),
            ArchitectureFormulaireDetail(),
          ],
        ),
      ),
    );
  }
}
